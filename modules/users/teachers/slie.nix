{ ... }: {
  flake.nixosModules.slie =
    { ... }:
    {
      users.users.slie = {
        isNormalUser = true;
        description = "Samson Liebscher";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };
    };
}
