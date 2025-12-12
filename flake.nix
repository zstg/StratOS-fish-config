{
  description = "StratOS Fish configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: {
    nixosModules.default = { lib, pkgs, config, ... }: {
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
    };
  };
}