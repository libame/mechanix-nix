{
	lib,
	rustPlatform,
	formats,
	makeWrapper,
	pkg-config,
	wayland,
	libxkbcommon,
	libGL,
	mechanixGuiSrc,
	homeDir ? "/home/mecha"
}:
let
	appsDir = "${mechanixGuiSrc}/apps";
	assetsDir = "${appsDir}/files/src/assets";
	settings = {
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
	};
	settingsFile = (formats.yaml {}).generate "settings.yml" settings;
in
rustPlatform.buildRustPackage {
	name = "mechanix-files";
	src = appsDir;
	
	cargoLock = {
		lockFile = ./Cargo.lock;
		outputHashes = {
			"cosmic-text-0.10.0" = "sha256-TRq4gghOJC0QbkR8mUDIb802qWUuftiydQgMhkjiL1Y=";
			"mctk_core-0.1.0" = "sha256-PQwHae3aBMRS0AsH95reEWcfIudMtuhFm55yqytaidU=";
		};
	};

	nativeBuildInputs = [
		pkg-config
		makeWrapper
	];

	buildInputs = [
		wayland
		libxkbcommon
	];

	patchPhase = ''
		cp ${./Cargo.lock} Cargo.lock
		substituteInPlace Cargo.toml \
			--replace-fail '"settings-app", "camera",' ""
		substituteInPlace files/src/gui.rs \
			--replace-fail '/home/mecha' ${lib.escapeShellArg homeDir}
	'';

	postInstall = ''
		wrapProgram $out/bin/mechanix-files \
			--set LD_LIBRARY_PATH ${libGL}/lib \
			--set MECHA_LAUNCHER_SETTINGS_PATH ${settingsFile}
	'';
}