{ ... }:
let
  students = [
    # "firstname.lastname"
    "hugo.hardel"
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
      });
    };
}
