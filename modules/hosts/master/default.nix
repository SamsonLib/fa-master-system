{ self, inputs, ... }:
{
  flake.nixosConfigurations.master = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.masterConfiguration
    ];
  };
}
