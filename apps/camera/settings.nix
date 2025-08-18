mechanixGuiSrc:
let
	assetsDir = "${mechanixGuiSrc}/apps/camera/src/assets";
in
{
	title = "Camera";
	app = {
		id = "org.mechanix.camera";
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
		back_icon = "${assetsDir}/icons/back_icon.png";
		settings_icon = "${assetsDir}/icons/settings_icon.png";
	};
}