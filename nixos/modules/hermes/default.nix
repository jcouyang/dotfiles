{ config, ...}:
{
  services.hermes-agent = {
    enable = true;
    settings = {
      model = {
        provider = "copilot";
        default = "claude-opus-4.7";
      };
      compression = {
        enabled = true;
        threshold = 0.8;
      };
    };
    documents = {
      "SOUL.md" = ./documents/SOUL.md;
    };
    environmentFiles = [ config.age.secrets."hermes/.env".path ];
    addToSystemPackages = true;
  };
}
