{
  description = "CrowdSec is a free, open-source and collaborative IPS";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    systems = flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      crowdsec = pkgs.callPackage ./packages/crowdsec {};
      bouncer-firewall = pkgs.callPackage ./packages/bouncer-firewall {};
    in {
      formatter = pkgs.alejandra;

      packages."crowdsec" = crowdsec;
      packages."crowdsec-firewall-bouncer" = bouncer-firewall;
    });
  in (systems
    // {
      nixosModules = {
        crowdsec = ./modules/crowdsec;
        crowdsec-firewall-bouncer = ./modules/crowdsec-firewall-bouncer;
      };
      overlays.default = final: prev: {
        crowdsec = systems.packages.${final.system}.crowdsec;
        crowdsec-firewall-bouncer = systems.packages.${final.system}.crowdsec-firewall-bouncer;
      };
    });
}
