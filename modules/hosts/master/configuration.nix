{ self, ... }: {
  flake.nixosModules.masterConfiguration =
    { ... }:
    {
      imports = [
        self.nixosModules.common
        self.nixosModules.masterHardware
      ];

      networking.hostName = "master";

      system.stateVersion = "26.11";
    };
}
