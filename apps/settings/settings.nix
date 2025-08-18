mechanixGuiSrc:
let
	assetsDir = "${mechanixGuiSrc}/apps/settings-app/src/assets";
in
{
	title = "Settings";
	app = {
		id = "org.mechanix.settings";
		text_multithreading = true;
		antialiasing = true;
		try_opengles_first = true;
	};
	window = {
		size = [480 440];
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
		"${assetsDir}/fonts/Inter-Regular.ttf"
		"${assetsDir}/fonts/Inter_18pt-Regular.ttf"
		"${assetsDir}/fonts/Inter_24pt-Regular.ttf"
		"${assetsDir}/fonts/Inter_28pt-Regular.ttf"
		"${assetsDir}/fonts/Inter_18pt-Medium.ttf"
		"${assetsDir}/fonts/Inter_24pt-Medium.ttf"
		"${assetsDir}/fonts/Inter_28pt-Medium.ttf"
		"${assetsDir}/fonts/Inter_18pt-Bold.ttf"
		"${assetsDir}/fonts/Inter_24pt-Bold.ttf"
		"${assetsDir}/fonts/Inter-28pt-Bold.ttf"
	];
	modules = {
		wireless = {
			icon = {
				off = "${assetsDir}/icons/wireless/wireless_off_icon.png";
				on = "${assetsDir}/icons/wireless/wireless_on_icon.png";
				low = "${assetsDir}/icons/wireless/wireless_low_icon.png";
				weak = "${assetsDir}/icons/wireless/wireless_weak_icon.png";
				good = "${assetsDir}/icons/wireless/wireless_good_icon.png";
				strong = "${assetsDir}/icons/wireless/wireless_strong_icon.png";
				error = "${assetsDir}/icons/wireless/wireless_error_icon.png";
				not_found = "${assetsDir}/icons/wireless/wireless_not_found_icon.svg";
				wireless_settings = "${assetsDir}/icons/wireless/wireless_settings_icon.png";
			};
			secured_icon = {
				off = "${assetsDir}/icons/wireless/secured/secured_wireless_off_icon.png";
				on = "${assetsDir}/icons/wireless/secured/secured_wireless_on_icon.png";
				low = "${assetsDir}/icons/wireless/secured/secured_wireless_low_icon.png";
				weak = "${assetsDir}/icons/wireless/secured/secured_wireless_weak_icon.png";
				strong = "${assetsDir}/icons/wireless/secured/secured_wireless_strong_icon.png";
				error = "${assetsDir}/icons/wireless/secured/secured_wireless_error_icon.png";
			};
		};
		bluetooth.icon = "${assetsDir}/icons/bluetooth_off_icon.svg";
		display.icon = "${assetsDir}/icons/display_icon.png";
		appearance.icon = "${assetsDir}/icons/appearance_icon.png";
		battery.icon = "${assetsDir}/icons/battery_icon.png";
		sound.icon = "${assetsDir}/icons/sound_icon.png";
		lock.icon = "${assetsDir}/icons/lock_icon.svg";
		date_time.icon = "${assetsDir}/icons/date_time_icon.svg";
		language.icon = "${assetsDir}/icons/language_icon.svg";
		update.icon = "${assetsDir}/icons/update_icon.svg";
		about.icon = {
			default = "${assetsDir}/icons/about_icon.png";
			device = "${assetsDir}/icons/device_icon.png";
		};
		see_options = {
			white_right_arrow = "${assetsDir}/icons/white_right_arrow.svg";
			grey_right_arrow = "${assetsDir}/icons/grey_right_arrow.svg";
			info_icon = "${assetsDir}/icons/info_icon.png";
			connected_icon = "${assetsDir}/icons/connected_icon.png";
		};
		footer = {
			back_icon = "${assetsDir}/icons/back_icon.png";
			confirm_icon = "${assetsDir}/icons/confirm_icon.png";
			enable_confirm_icon = "${assetsDir}/icons/enable_confirm_icon.svg";
			disable_confirm_icon = "${assetsDir}/icons/disable_confirm_icon.svg";
			delete_icon = "${assetsDir}/icons/delete_icon.png";
			add_icon = "${assetsDir}/icons/add_icon.png";
		};
		not_found.icon = {
			default = "${assetsDir}/icons/not_found_icon.png";
			small = "${assetsDir}/icons/not_found_small_icon.png";
		};
	};
}