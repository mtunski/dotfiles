"use strict";
// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
module.exports = {
  config: {
    scrollback: 999999,
    updateChannel: "stable",
    fontSize: 16,
    fontFamily: "LigaOperatorMono NF",
    fontWeight: 300,
    fontWeightBold: 400,
    lineHeight: 1,
    letterSpacing: 0,
    cursorAccentColor: "#000",
    cursorShape: "BEAM",
    cursorBlink: true,
    borderColor: "#333",
    css: "",
    termCSS: "",
    // workingDirectory: "",
    // showHamburgerMenu: "",
    // showWindowControls: "",
    padding: "12px 14px",
    shell: "C:\\Windows\\System32\\wsl.exe",
    shellArgs: ["~"],
    env: {},
    bell: false,
    copyOnSelect: true,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: "vertical",
    webGLRenderer: true,
    webLinksActivationKey: "ctrl",
    disableLigatures: false,
    disableAutoUpdates: false,
    screenReaderMode: false,

    preserveCWD: true,

    paneNavigation: {
      // focusOnMouseHover: true,
      inactivePaneOpacity: 0.4,
      hyperCwdWsl: {
        titleRegExp: "^user@hostname: (.*)$",
        clearAfter: true,
      },
    },

    useConpty: false,
  },

  plugins: [
    "hyper-pane",
    "hyper-cwd-wsl",
    "hyperminimal",
    "hyper-single-instance",
    "hyper-quit",
    "hyperborder",
    "hyper-dnd-tabs",
  ],
  localPlugins: ["dracula-pro"],
  keymaps: {},
};
