{
	lib,
	rustPlatform,
	pkg-config,
	wayland,
	libxkbcommon,
	mechanixGuiSrc,
	homeDir ? "/home/mecha"
}:
rustPlatform.buildRustPackage {
	name = "mechanix-files-unwrapped";
	src = "${mechanixGuiSrc}/apps";
	
	cargoLock = {
		lockFile = ./Cargo.lock;
		outputHashes = {
			"cosmic-text-0.10.0" = "sha256-TRq4gghOJC0QbkR8mUDIb802qWUuftiydQgMhkjiL1Y=";
			"mctk_core-0.1.0" = "sha256-PQwHae3aBMRS0AsH95reEWcfIudMtuhFm55yqytaidU=";
		};
	};

	nativeBuildInputs = [
		pkg-config
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
}