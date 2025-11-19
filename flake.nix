{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      perSystem = {
        pkgs,
        ...
      }: let
        project = (fromTOML (builtins.readFile ./src/pyproject.toml)).project;
        deps = map (x: pkgs.python3.pkgs.${x}.overridePythonAttrs {doCheck = false;}) project.dependencies;
      in {
        # TODO: fix this
        packages.default = pkgs.python3.pkgs.buildPythonApplication {
          pname = project.name;
          version = project.version;
          src = ./src;
          pyproject = true;
          doCheck = false;
          build-system = [pkgs.python3.pkgs.setuptools];
        };
        devShells.default = pkgs.mkShellNoCC {
          packages = [pkgs.python.withPackages (_: deps)];
        };
      };
    };
}
