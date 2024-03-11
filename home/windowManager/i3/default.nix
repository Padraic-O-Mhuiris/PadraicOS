{ config, l, ... }:

let modifier = "Mod4";
in {

  imports = [ ../../launcher/rofi.nix ../../terminal/alacritty.nix ];

  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.i3 = {
      enable = true;
      config = {
        inherit modifier;
        terminal = config.home.sessionVariables.TERMINAL;
        menu = config.home.sessionVariables.LAUNCHER;
        keybindings = l.mkOptionDefault {
          "${modifier}+Shift+q" = null;
          "${modifier}+Return" =
            "exec ${config.xsession.windowManager.i3.config.terminal}";
          "${modifier}+q" = "kill";
        };
        defaultWorkspace = "workspace number 1";
        gaps = {
          inner = 10;
          outer = 5;
        };
        floating = {
          titlebar = false;
          border = 1;
        };
        window = {
          titlebar = false;
          border = 1;
        };
        # bars = [ ];
      };
    };
  };
}