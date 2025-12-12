{
  description = "StratOS Fish configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: {
    homeManagerModules.default = { lib, pkgs, config, ... }: {
      programs.fish.enable = true;
      
      # Copy fish config files to user's config directory
      home.file = let fishDir = self + "/.config/fish";
      in {
        ".config/fish/config.fish".source = fishDir + "/config.fish";
        ".config/fish/aliases".source = fishDir + "/aliases";
        ".config/fish/git.fish".source = fishDir + "/git.fish";
        ".config/fish/convert_aliases_to_abbreviations.fish".source = fishDir + "/convert_aliases_to_abbreviations.fish";
        ".config/fish/fisher.fish".source = fishDir + "/fisher.fish";
        ".config/fish/fish_plugins".source = fishDir + "/fish_plugins";
        ".config/fish/fish_variables".source = fishDir + "/fish_variables";
        ".config/fish/functions".source = fishDir + "/functions";
      };
    };
  };
}