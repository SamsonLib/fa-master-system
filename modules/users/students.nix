{ ... }:
let
  students = [
    # "firstname.lastname"
  ];
in
{
  flake.nixosModules.students =
    { lib, ... }:
    {
      users.groups.students = { };

      users.users = lib.genAttrs students (_: {
        isNormalUser = true;
        description = "Schüler";
        extraGroups = [ "students" ];
        initialPassword = "abcd";
      });
    };
}
