{

  description = "NixOS configuration";

    inputs = {
      hyprland.url = "github:hyprwm/Hyprland";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      ags.url = "github:aylur/ags";
      hyprswitch.url = "github:h3rmt/hyprswitch/release";
      zen-browser.url = "github:0xc000022070/zen-browser-flake";
      spicetify-nix.url = "github:Gerg-L/spicetify-nix";
      nixcord.url = "github:kaylorben/nixcord";
# nvchad4nix = {
#   url = "github:nix-community/nix4nvchad";
#   inputs.nixpkgs.follows = "nixpkgs";
# };   
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: 

    let
        lib = nixpkgs.lib;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit system; inherit inputs; };
    in {
        nixosConfigurations = {
            hryu = lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [ ./nixos/configuration.nix ];
            };
        };

        homeConfigurations = {
            hryu = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                inherit extraSpecialArgs;
                modules = [ ./home/home.nix ];
            };
        };
    };
    
}
