{ lib, pkgs, config, ... }:
let
  cfg = lib.getAttrFromPath ["services" "stratos-fish"] config;
in {
  options.services.stratos-fish.enable = lib.mkEnableOption "StratOS Fish config";

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      vendor.config.enable = true;
      
      # Symlink repo's .config/fish structure directly
      configDir = lib.cleanSourceWith {
        src = self + "/.config/fish";
        filter = path: type:
          lib.cleanSourceFilter path type &&
          (builtins.baseNameOf path != "README.md") &&
          (builtins.baseNameOf path != "flake.nix") &&
          (builtins.baseNameOf path != "flake.lock") &&
          (builtins.match ".*\.fish$" path != null || builtins.baseNameOf path == "conf.d" || builtins.baseNameOf path == "functions");
      };
    };
    
    # Optionally set fish as default shell
    # home.sessionVariables.SHELL = "${pkgs.fish}/bin/fish";
  };
}
