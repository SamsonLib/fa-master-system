{ self, ... }: {
  flake.nixosModules.pcConfiguration =
    { ... }:
    {
      imports = [
        self.nixosModules.common
        self.nixosModules.pcHardware
        self.nixosModules.students
        self.nixosModules.slie
      ];

      networking.hostName = "pc";

      services.xserver.enable = true;

      services.xserver.xkb = {
        layout = "us";
        variant = "dvp";
      };

      services.xserver.displayManager.lightdm.enable = true;
      services.xserver.desktopManager.cinnamon.enable = true;

      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
      security.rtkit.enable = true;

      services.printing.enable = true;

      programs.firefox.enable = true;

      system.stateVersion = "26.11";
    };
}
