{stdenv, wrapFirefox, firefox-unwrapped, firefox}:
wrapFirefox firefox-unwrapped {
  # https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig
  extraPrefs = ''
    pref("ui.key.accelKey", 18);
    pref("ui.key.chromeAccess", 2);
    pref("ui.key.contentAccess", 6);
    pref("ui.key.contentAccess", 6);
    pref("ui.key.menuAccessKey", -1);
    pref("network.protocol-handler.expose.org-protocol", false);
  '';
}
