mechanixGuiSrc:
let
	assetsDir = "${mechanixGuiSrc}/shell/keyboard/src/assets";
in
{
	title = "Keyboard";
	app = {
		id = "mechanix.shell.keyboard";
		text_multithreading = true;
		antialiasing = true;
		try_opengles_first = true;
	};
	window = {
		size = [480 244];
		position = [0 0];
		min_size = [448 84];
		max_size = null;
		visible = true;
		resizable = true;
		decorations = true;
		transparent = true;
		always_on_top = false;
		icon_path = null;
	};
	icons = {
		backspace = "${assetsDir}/icons/edit_clear_icon.svg";
		shift = "${assetsDir}/icons/key_shift_icon.svg";
		enter = "${assetsDir}/icons/key_enter_icon.svg";
		symbolic = "${assetsDir}/icons/keyboard_mode_icon.svg";
		window_max = "${assetsDir}/icons/window_max_icon.svg";
		window_min = "${assetsDir}/icons/window_min_icon.svg";
	};
	layouts = {
		default = "${assetsDir}/layouts/us.yaml";
		terminal = "${assetsDir}/layouts/terminal/us.yaml";
		email = "${assetsDir}/layouts/email/us.yaml";
		url = "${assetsDir}/layouts/url/us.yaml";
	};
	trie = {
		raw_file = "${assetsDir}/trie/words_raw.tsv";
		cached_file = ".config/mechanix/shell/keyboard/caches/words_cached.json";
	};
	click_area = {
		increase_by = 5;
		visible = false;
	};
}