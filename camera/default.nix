{
	rustPlatform,
	formats,
	makeWrapper,
	pkg-config,
	wayland,
	libxkbcommon,
	glib,
	gst_all_1,
	libGL,
	mechanixGuiSrc
}:
let
	appsDir = "${mechanixGuiSrc}/apps";
	assetsDir = "${appsDir}/camera/src/assets";
	settings = {
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
	};
	settingsFile = (formats.yaml {}).generate "settings.yml" settings;
in
rustPlatform.buildRustPackage {
	name = "mechanix-camera";
	src = appsDir;
	
	cargoLock = {
		lockFile = ./Cargo.lock;
		outputHashes = {
			"cosmic-text-0.10.0" = "sha256-TRq4gghOJC0QbkR8mUDIb802qWUuftiydQgMhkjiL1Y=";
			"femtovg-0.8.2" = "sha256-wTgVbhhNtm3iTfPaUPPBt/feH58ShVE+BZI+QIc1mQQ=";
			"mctk_camera-0.1.0" = "sha256-yX/AqQXWoP2xpbOoaCIZA5GiYQHTloNwptcvdOKnyWU=";
		};
	};

	nativeBuildInputs = [
		pkg-config
		makeWrapper
	];

	buildInputs = [
		wayland
		libxkbcommon
		glib
		gst_all_1.gstreamer
		gst_all_1.gst-plugins-base
	];

	patchPhase = ''
		cp ${./Cargo.lock} Cargo.lock
		substituteInPlace Cargo.toml \
			--replace-fail '"settings-app", "camera",  "files"' '"camera"'
	'';

	postInstall = ''
		wrapProgram $out/bin/mechanix-camera \
			--set LD_LIBRARY_PATH ${libGL}/lib \
			--set MECHA_LAUNCHER_SETTINGS_PATH ${settingsFile}
	'';
}