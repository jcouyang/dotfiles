{ config, lib, pkgs, ... }:
let
  inherit (lib) literalExpression types;

  cfg = config.services.ollama;
  ollama = lib.getExe cfg.package;

  staticUser = cfg.user != null && cfg.group != null;
in
{
  imports = [
    (lib.mkRemovedOptionModule [
      "services"
      "ollama"
      "listenAddress"
    ] "Use `services.ollama.host` and `services.ollama.port` instead.")
    (lib.mkRemovedOptionModule [
      "services"
      "ollama"
      "sandbox"
    ] "Set `services.ollama.user` and `services.ollama.group` instead.")
    (lib.mkRemovedOptionModule
      [
        "services"
        "ollama"
        "writablePaths"
      ]
      "The `models` directory is now always writable. To make other directories writable, use `launchd.user.agents.ollama.serviceConfig.ReadWritePaths`.")
    (lib.mkRemovedOptionModule [
      "services"
      "ollama"
      "acceleration"
    ] "Set `services.ollama.package` to one of `pkgs.ollama[,-vulkan,-rocm,-cuda,-cpu]` instead.")
  ];

  options = {
    services.ollama = {
      enable = lib.mkEnableOption "ollama server for local large language models";
      package = lib.mkPackageOption pkgs "ollama" {
        example = "pkgs.ollama-rocm";
        extraDescription = ''
          Different packages use different hardware acceleration.

          - `ollama`: default behavior; usually equivalent to `ollama-cpu`
            - if `nixpkgs.config.rocmSupport` is enabled, is equivalent to `ollama-rocm`
            - if `nixpkgs.config.cudaSupport` is enabled, is equivalent to `ollama-cuda`
            - otherwise defaults to `ollama-cpu`
          - `ollama-cpu`: disable GPU; only use CPU
          - `ollama-rocm`: supported by most modern AMD GPUs
            - may require overriding gpu type with `services.ollama.rocmOverrideGfx`
              if rocm doesn't detect your AMD gpu
          - `ollama-cuda`: supported by most modern NVIDIA GPUs
          - `ollama-vulkan`: supported by most GPUs
        '';
      };

      home = lib.mkOption {
        type = types.str;
        default =  "${cfg.home}/.ollama";
        example = "/home/foo";
        description = ''
          The home directory that the ollama service is started in.
        '';
      };
      environmentVariables = lib.mkOption {
        type = types.attrsOf types.str;
        default = { };
        example = {
          OLLAMA_LLM_LIBRARY = "cpu";
          HIP_VISIBLE_DEVICES = "0,1";
        };
        description = ''
          Set arbitrary environment variables for the ollama service.

          Be aware that these are only seen by the ollama server (launchd agent),
          not normal invocations like `ollama run`.
        '';
      };
      logFile = lib.mkOption {
        type = types.nullOr types.path;
        default = null;
        example =  "/var/tmp/ollama.log";
        description = ''
         The logfile to use for the ollama service.
        '';
    };
    };
  };

  config = lib.mkIf cfg.enable {
    launchd.user.agents.ollama = {
      serviceConfig = {
        ProgramArguments = [ "${cfg.package}/bin/ollama" "serve" ];
        KeepAlive = true;
        RunAtLoad = true;
        ProcessType = "Background";
        StandardOutPath = cfg.logFile;
        StandardErrorPath = cfg.logFile;
        EnvironmentVariables = cfg.environmentVariables;
      };
    };
    environment.systemPackages = [ cfg.package ];
  };
}
