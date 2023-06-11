{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.networkmanager_dmenu ];

  home.file.".config/networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi -show dmenu
    compact = True
    wifi_chars = ▂▄▆█
    list_saved = True

    [editor]
    terminal = alacritty
    # gui_if_available = <True or False> (Default: True)
  '';
}
