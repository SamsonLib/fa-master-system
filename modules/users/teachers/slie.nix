{ ... }: {
  flake.nixosModules.slie =
    { ... }:
    {
      users.users.slie = {
        isNormalUser = true;
        description = "S Lie";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };
    };
}
