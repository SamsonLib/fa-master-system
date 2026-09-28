{ ... }: {
  flake.nixosModules.pcHardware =
    { lib, modulesPath, ... }:
    {
      imports = [
        (modulesPath + "/profiles/qemu-guest.nix")
      ];

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ohci_pci"
        "ehci_pci"
        "virtio_pci"
        "ahci"
        "usbhid"
        "sr_mod"
        "virtio"
      ];
      boot.kernelModules = [ "kvm-amd" ];

      fileSystems."/" = {
        device = "/dev/disk/by-partlabel/nixos";
        fsType = "xfs";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-partlabel/boot";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [
        { device = "/dev/disk/by-partlabel/swap"; }
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
