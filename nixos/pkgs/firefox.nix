{stdenv, pkgs}:
if stdenv.isLinux then pkgs.wrapFirefox pkgs.firefox-unwrapped {
  # https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig
  extraPrefs = ''
    pref("ui.key.accelKey", 18);
    pref("ui.key.chromeAccess", 2);
    pref("ui.key.contentAccess", 6);
    pref("ui.key.contentAccess", 6);
    pref("ui.key.menuAccessKey", -1);
    pref("network.protocol-handler.expose.org-protocol", true);

    // Disable Firefox AI / chatbot features
    pref("browser.ml.enable", false);
    pref("browser.ml.chat.enabled", false);
    pref("browser.ml.chat.shortcuts", false);
    pref("browser.ml.chat.shortcuts.custom", false);
    pref("browser.ml.chat.sidebar", false);
    pref("browser.ml.chat.page", false);
    pref("browser.ml.chat.menu", false);
    pref("browser.ml.linkPreview.enabled", false);
    pref("browser.ml.linkPreview.optin", false);
    pref("extensions.ml.enabled", false);
    pref("browser.tabs.groups.smart.enabled", false);
  '';
} else pkgs.firefox-bin
