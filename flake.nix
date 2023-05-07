{
  description = "Snowflakes are fractals";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, stylix }: {
    nixosConfigurations.snowfire = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./system/configuration.nix ];
    };

    homeConfigurations."silas" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ stylix.homeManagerModules.stylix ./user/home.nix ];
    };

  };
}
