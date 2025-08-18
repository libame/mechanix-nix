{
	rustPlatform,
	pkg-config,
	wayland,
	libxkbcommon,
	dbus,
	pam,
	libpulseaudio,
	mechanixGuiSrc
}:
rustPlatform.buildRustPackage {
	name = "mechanix-shell-unwrapped";
	src = mechanixGuiSrc;
	
	cargoLock = {
		lockFile = ./Cargo.lock;
		outputHashes = {
			"cosmic-text-0.10.0" = "sha256-TRq4gghOJC0QbkR8mUDIb802qWUuftiydQgMhkjiL1Y=";
			"mctk_core-0.1.0" = "sha256-SkB6ZeY0UvN/b8tx9OxzmCxO66gRP5nUW0vmfnjA/fo=";
			"shmemfdrs-0.1.4" = "sha256-CHB49DaAdJtMLud0cEIle5HC3pKcY4EJxyH4BlPD6d8=";
			"wayland-protocols-async-0.1.0" = "sha256-Js2Ea3O7VgOYF3scw1jxPxfhCDatfow7PsSTrNRSD/M=";
		};
	};

	nativeBuildInputs = [
		pkg-config
		rustPlatform.bindgenHook
	];

	buildInputs = [
		wayland
		libxkbcommon
		dbus
		pam
		libpulseaudio
	];

	patchPhase = ''
		cd shell

		cp ${./Cargo.lock} Cargo.lock
		substituteInPlace Cargo.toml \
			--replace-fail ', rev = "0c2c8f6ab9d944e24fdff89f08fd8fe6a67eb6d3"' ""
	'';
}