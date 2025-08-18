mechanixGuiSrc:
let
	assetsDir = "${mechanixGuiSrc}/shell/launcher/src/assets";
in
{
  title = "Launcher";
  app = {
    id = "mechanix.shell.launcher";
    text_multithreading = true;
    antialiasing = true;
    try_opengles_first = true;
  };
  window = {
    size = [480 480];
    position = [0 0];
    min_size = [480 40];
    max_size = null;
    visible = true;
    resizable = true;
    decorations = true;
    transparent = true;
    always_on_top = false;
    icon_path = null;
  };
  layout = {
    left = [];
    center = [];
    right = [];
  };
  fonts.paths = [
    "${assetsDir}/fonts/SpaceMono-Bold.ttf"
    "${assetsDir}/fonts/SpaceMono-BoldItalic.ttf"
    "${assetsDir}/fonts/SpaceMono-Italic.ttf"
    "${assetsDir}/fonts/SpaceMono-Regular.ttf"
    "${assetsDir}/fonts/SpaceGrotesk-Bold.ttf"
    "${assetsDir}/fonts/SpaceGrotesk-Regular.ttf"
    "${assetsDir}/fonts/SpaceGrotesk-SemiBold.ttf"
    "${assetsDir}/fonts/SpaceGrotesk-Medium.ttf"
  ];
  modules = {
    background.icon.default = "";
    pinned_apps = [
      "org.mecha.connect"
      "Alacritty"
      "chromium"
    ];
    clock = {
      time = "%H:%M";
      date = "%e %B  %A";
    };
    bluetooth.icon = {
      sm = {
        on = "${assetsDir}/icons/bluetooth/sm/bluetooth_on_icon.png";
        off = "${assetsDir}/icons/bluetooth/sm/bluetooth_off_icon.png";
        connected = "${assetsDir}/icons/bluetooth/sm/bluetooth_connected_icon.png";
        not_found = "${assetsDir}/icons/bluetooth/sm/bluetooth_not_found_icon.png";
      };
      lg = {
        on = "${assetsDir}/icons/bluetooth/lg/bluetooth_on_icon.png";
        off = "${assetsDir}/icons/bluetooth/lg/bluetooth_off_icon.png";
        connected = "${assetsDir}/icons/bluetooth/lg/bluetooth_connected_icon.png";
        not_found = "${assetsDir}/icons/bluetooth/lg/bluetooth_not_found_icon.png";
      };
    };
    wireless.icon = {
      sm = {
        off = "${assetsDir}/icons/wireless/sm/wireless_off_icon.png";
        on = "${assetsDir}/icons/wireless/sm/wireless_on_icon.png";
        low = "${assetsDir}/icons/wireless/sm/wireless_low_icon.png";
        weak = "${assetsDir}/icons/wireless/sm/wireless_weak_icon.png";
        good = "${assetsDir}/icons/wireless/sm/wireless_good_icon.png";
        strong = "${assetsDir}/icons/wireless/sm/wireless_strong_icon.png";
        not_found = "${assetsDir}/icons/wireless/sm/wireless_not_found_icon.png";
      };
      lg = {
        off = "${assetsDir}/icons/wireless/lg/wireless_off_icon.png";
        on = "${assetsDir}/icons/wireless/lg/wireless_on_icon.png";
        low = "${assetsDir}/icons/wireless/lg/wireless_low_icon.png";
        weak = "${assetsDir}/icons/wireless/lg/wireless_weak_icon.png";
        good = "${assetsDir}/icons/wireless/lg/wireless_good_icon.png";
        strong = "${assetsDir}/icons/wireless/lg/wireless_strong_icon.png";
        not_found = "${assetsDir}/icons/wireless/lg/wireless_not_found_icon.png";
      };
    };
    battery = {
      icon = {
        level_100 = "${assetsDir}/icons/battery/battery_100_icon.png";
        level_90 = "${assetsDir}/icons/battery/battery_90_icon.png";
        level_80 = "${assetsDir}/icons/battery/battery_80_icon.png";
        level_70 = "${assetsDir}/icons/battery/battery_70_icon.png";
        level_60 = "${assetsDir}/icons/battery/battery_60_icon.png";
        level_50 = "${assetsDir}/icons/battery/battery_50_icon.png";
        level_40 = "${assetsDir}/icons/battery/battery_40_icon.png";
        level_30 = "${assetsDir}/icons/battery/battery_30_icon.png";
        level_20 = "${assetsDir}/icons/battery/battery_20_icon.png";
        level_10 = "${assetsDir}/icons/battery/battery_10_icon.png";
        level_0 = "${assetsDir}/icons/battery/battery_0_icon.png";
        not_found = "${assetsDir}/icons/battery/battery_not_found_icon.png";
        battery = "";
      };
      charging_icon = {
        level_100 = "${assetsDir}/icons/battery/charging/battery_100_icon.png";
        level_90 = "${assetsDir}/icons/battery/charging/battery_90_icon.png";
        level_80 = "${assetsDir}/icons/battery/charging/battery_80_icon.png";
        level_70 = "${assetsDir}/icons/battery/charging/battery_70_icon.png";
        level_60 = "${assetsDir}/icons/battery/charging/battery_60_icon.png";
        level_50 = "${assetsDir}/icons/battery/charging/battery_50_icon.png";
        level_40 = "${assetsDir}/icons/battery/charging/battery_40_icon.png";
        level_30 = "${assetsDir}/icons/battery/charging/battery_30_icon.png";
        level_20 = "${assetsDir}/icons/battery/charging/battery_20_icon.png";
        level_10 = "${assetsDir}/icons/battery/charging/battery_10_icon.png";
        level_0 = "${assetsDir}/icons/battery/charging/battery_0_icon.png";
        not_found = "${assetsDir}/icons/battery/charging/battery_not_found_icon.png";
      };
    };
    rotation = {
      title = "Auto Rotate";
      icon = {
        portrait = "${assetsDir}/icons/rotation/portrait_icon.png";
        landscape = "${assetsDir}/icons/rotation/landscape_icon.png";
      };
    };
    power.icon.default = "${assetsDir}/icons/power_icon.png";
    lock = {
      icon.default = "${assetsDir}/icons/lock_icon.png";
      min_time_long_press = 1;
    };
    settings.icon.default = "${assetsDir}/icons/settings_icon.png";
    search.icon.default = "${assetsDir}/icons/search_icon.png";
    launch.icon.default = "${assetsDir}/icons/launch_icon.png";
    delete.icon.default = "${assetsDir}/icons/delete_icon.png";
    close.icon.default = "${assetsDir}/icons/close_icon.png";
    power_options = {
      shutdown.icon = "${assetsDir}/icons/shutdown_icon.png";
      restart.icon = "${assetsDir}/icons/restart_icon.png";
    };
    terminal = {
      icon = "${assetsDir}/icons/terminal_icon.png";
      app_id = "alacritty";
    };
  };
  app_list = {
    include_only = [];
    exclude = [];
    include = [];
    custom = [];
  };
}