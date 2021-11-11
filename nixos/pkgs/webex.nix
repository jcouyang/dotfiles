{ pkgs }:
with pkgs;
let
  versionNumber = "41.9.0.20091";
in stdenv.mkDerivation {
  pname = "webex";

  version = versionNumber;

  src = fetchurl {
      url = "https://web.archive.org/web/20210927125841/https://binaries.webex.com/WebexDesktop-Ubuntu-Official-Package/Webex.deb";
      sha256 = "0lvrk24jbqgsji6vdn3d51bwvrikq85kbvchj3zg9qc1dnfdjjdr";
    };

  nativeBuildInputs = [
    autoPatchelfHook
    dpkg
    makeWrapper
  ];

  buildInputs = [
    xorg.libX11
    glib
    freetype
    libxkbcommon
    xorg.libICE
    xorg.libXrender
    xorg.libSM
    alsaLib
    fontconfig
    pango
    gtk3
    dbus_libs
    pulseaudio
    qt5.qtbase
    qt5.qtx11extras
    libsecret
    libdrm
    mesa
    nss
    nspr
    xorg.libXdamage
    xorg.libxshmfence
];

  unpackPhase = "true";
  # https://github.com/NixOS/nixpkgs/pull/122796/files
  installPhase = ''
    mkdir -p $out/bin $out/share/applications
    dpkg -x $src $out
    wrapProgram $out/opt/Webex/bin/CiscoCollabHost \
      --prefix LD_LIBRARY_PATH : $out/opt/Webex/lib
    ln -s $out/opt/Webex/bin/CiscoCollabHost $out/bin/webex
    substitute $out/opt/Webex/bin/webex.desktop $out/share/applications/webex.desktop --replace /opt/Webex/bin/ $out/opt/Webex/bin/
  '';

  dontWrapQtApps = true;

  meta = with lib; {
    description = "Cisco Webex";
    homepage = "https://www.webex.com";
    license = licenses.unfree;
    maintainers = with maintainers; [ jcouyang ];
    platforms = [ "x86_64-linux" ];
  };
}
