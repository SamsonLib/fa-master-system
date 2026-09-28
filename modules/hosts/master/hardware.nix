{ self, inputs, ... }:

{
	flake.nixosModules.masterHardware =
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ohci_pci" "ehci_pci" "virtio_pci" "ahci" "usbhid" "sr_mod" "virtio" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/43f18e80-dc82-43c4-9b91-ee53b68e8e3a";
      fsType = "xfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CFB6-D0C1";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/8388829f-e05d-4072-9ba5-5f9912d6de52"; }
    ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
};

		
}
