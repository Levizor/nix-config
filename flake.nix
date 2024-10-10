{
	description = "Config";
	
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

                stylix.url = "github:danth/stylix";

		nixvim = {
			url = "github:nix-community/nixvim";

			inputs.nixpkgs.follows = "nixpkgs";
  		};
	};


	outputs = {nixpkgs, home-manager, ...}@inputs: 

	let 
		system = "x86_64-linux";
	in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ 
			  ./nixos/configuration.nix 
			  inputs.stylix.nixosModules.stylix
			  inputs.nixvim.nixosModules.nixvim
        		];
		};

	};





}
