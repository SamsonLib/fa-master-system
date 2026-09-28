{ ... }:
let
  students = [
    # "firstname.lastname"
    "j.lie"
    "h.har"
  ];
in
{
  flake.nixosModules.students =
    { lib, pkgs, ... }:
    {
      users.groups.students = { };

      users.users = lib.genAttrs students (_: {
        isNormalUser = true;
        description = "Schüler";
        extraGroups = [ "students" ];
        initialPassword = "abcd";

        createHome = false;

        packages = [
          pkgs.python3
          pkgs.xed-editor
        ];
      });
    };
}
