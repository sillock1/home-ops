{
  description = "Home ops flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      hauler = pkgs.buildGoModule {
        name = "hauler";
        vesion = "1.3.1";
        vendorHash = "sha256-qGvKUEZqk7b7BLK9XmZyloYT5q68mfmfVreg6RmK2PQ=";
        doCheck = false;
        src = pkgs.fetchFromGitHub {
          owner = "hauler-dev";
          repo = "hauler";
          rev = "v1.3.1";
          sha256 = "sha256-bKr6LgBVUmalZcagGKMM/KaHnDmN6Mf6Midba/XfV3Q=";
        };

      };
    in
    {
      devShells."x86_64-linux".default = with pkgs; mkShell {
        packages = [
          kubernetes-helm
          helmfile
          kustomize
          talosctl
          sops
          kind
          cilium-cli
          hubble
          fluxcd
          fluxcd-operator
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
          mise
          yq-go
          hauler
        ];

      };
  };
}
