{ ... }: {
  flake.nixosModules.slie =
    { ... }:
    {
      users.users.slie = {
        isNormalUser = true;
        description = "S Lie";
        initalPassword = "abcd";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };
    };
}
