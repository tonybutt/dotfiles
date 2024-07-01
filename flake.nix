{
  description = "My system configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
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
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.anthony = import ./hosts/mantra/home.nix;
              home-manager.sharedModules = [
                nixvim.homeManagerModules.nixvim
              ];
            }
            inputs.stylix.nixosModules.stylix
          ];
        };
      };
    };
}
