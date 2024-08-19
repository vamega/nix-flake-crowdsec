{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "cs-firewall-bouncer";
  version = "0.0.29";

  src = fetchFromGitHub {
    owner = "crowdsecurity";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-lOBe7jgwLiLbb7Eqcip7h8s3igMIKDJntkDVBUeHfek=";
  };

  vendorHash = "sha256-zCBFzZAIil4yfvYY6Q8jqD+aCD6tzClcPkBLlaNB/xU=";

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
