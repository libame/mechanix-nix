{
	interfaces = {
		display = {
			brightness_path = "/sys/class/backlight/backlight/brightness";
			backlight_path = "/sys/class/backlight/backlight/bl_power";
		};
		network.device = "/var/run/wpa_supplicant/wlan0";
		hw_buttons = {
			power.path = "/dev/input/event0";
			home.path = "/dev/input/event2";
		};
	};
}