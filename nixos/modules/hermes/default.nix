{config}:
{
  services.hermes-agent = {
    enable = true;
    settings = {
      model = {
        provider = "copilot";
        default = "claude-opus-4.7";
      };
    };
    environmentFiles = [ config.age.secrets."hermes/.env".path ];
    addToSystemPackages = true;
  };
}
