{
  description = "ACME DNS client for use with certbot as a DNS-01 auth hook";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.buildGoModule {
      pname = "acme-dns-client";
      version = "0.3";
      src = ./.;
      vendorHash = "sha256-QBUJ3Zvcmfm2Uu3fPZd6BOaLEYWyhfTqRyMjKIPsfGI=";
    };
  };
}
