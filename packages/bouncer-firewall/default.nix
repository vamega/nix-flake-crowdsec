{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "cs-firewall-bouncer";
  version = "0.0.31";

  src = fetchFromGitHub {
    owner = "crowdsecurity";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-59MWll8v00CF4WA53gjHZSTFc8hpYaHENg9O7LgTCrA=";
  };

  vendorHash = "sha256-7Jxvg8UEjUxnIz1llvXyI2AefJ31OVdNzhWD/C8wU/Y=";

  meta = with lib; {
    homepage = "https://crowdsec.net/";
    changelog = "https://github.com/crowdsecurity/${pname}/releases/tag/v${version}";
    description = "Crowdsec bouncer for firewalls.";
    longDescription = ''
      crowdsec-firewall-bouncer will fetch new and old decisions from a CrowdSec API to add them in a blocklist used by supported firewalls.
    '';
    license = licenses.mit;
  };
}
