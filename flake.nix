{

  description = "NixOS configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
          url = "github:nix-community/home-manager/master";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        # hyprlock = {
        #   url = "github:nix-community/nix4nvchad";
        #   inputs.nixpkgs.follows = "nixpkgs";
        # };
        # nvchad4nix = {
        #   url = "github:nix-community/nix4nvchad";
        #   inputs.nixpkgs.follows = "nixpkgs";
        # };
        # hyprswitch.url = "github:h3rmt/hyprswitch/release";
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
