{
	rustPlatform,
	pkg-config,
	wayland,
	libxkbcommon,
	glib,
	gst_all_1,
	mechanixGuiSrc
}:
rustPlatform.buildRustPackage {
	name = "mechanix-camera-unwrapped";
	src = "${mechanixGuiSrc}/apps";
	
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
}