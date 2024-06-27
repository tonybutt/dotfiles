{

  description = "My system configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, ...}: 
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      mantra = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        inherit inputs system;
        };
        modules = [ 
	  ./hosts/mantra/configuration.nix 
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.anthony = import ./modules/home-manager/home.nix;
	        }
        ];
      };
    }; 
  };
}
