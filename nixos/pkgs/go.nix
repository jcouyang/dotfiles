{go, fetchurl}:

go.overrideAttrs (old: rec {
  version = "1.18";
  src = fetchurl {
    url = "https://dl.google.com/go/go${version}.src.tar.gz";
    sha256 = "1mnskd0fc2yz3yhn5p2h6swznfbsza144d2j5czqhd689kdj7x1q";
  };
  patches = [];
  doCheck = false;
})
