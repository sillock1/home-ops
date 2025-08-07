{
  description = "Home ops flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Ancient version in nixpkgs
    zarf = {
      url = "https://github.com/zarf-dev/zarf/releases/download/v0.58.0/zarf_v0.58.0_Linux_amd64";
      flake = false;
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      devShells."x86_64-linux".default = with pkgs; mkShell {
        packages = [
          helm
          helmfile
          kustomize
          talosctl
          sops
          kind
          cilium-cli
          hubble
          fluxcd
          chart-testing
          opentofu
          minijinja
          go-task
          k9s
          kubectl
          restic
          kubectl
          renovate
          act
        ];

      };
  };
}
