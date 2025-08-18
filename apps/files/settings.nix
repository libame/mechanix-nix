mechanixGuiSrc:
let
	assetsDir = "${mechanixGuiSrc}/apps/files/src/assets";
in
{
	title = "Files";
	app = {
		id = "org.mechanix.files";
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
	fonts.paths = [ "${assetsDir}/fonts/SpaceGrotesk-Regular.ttf" ];
	icons = {
		fold_icon = "${assetsDir}/icons/fold.png";
		file_icon = "${assetsDir}/icons/file.png";
		arrow_icon = "${assetsDir}/icons/arrow.png";
		back_icon = "${assetsDir}/icons/back.png";
		add_icon = "${assetsDir}/icons/add.png";
		dots_icon = "${assetsDir}/icons/dots.png";
		pdf_icon = "${assetsDir}/icons/pdf.png";
		img_icon = "${assetsDir}/icons/img_file.png";
		unfold_dir_icon = "${assetsDir}/icons/unfold_dir.png";
	};
}