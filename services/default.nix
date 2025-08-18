{
	rustPlatform,
	pkg-config,
	dbus,
	pam,
	libpulseaudio,
	mechanixGuiSrc
}:
rustPlatform.buildRustPackage {
	name = "mechanix-services-unwrapped";
	src = mechanixGuiSrc;
	
	cargoLock = {
		lockFile = ./Cargo.lock;
		outputHashes = {
			"shmemfdrs-0.1.4" = "sha256-CHB49DaAdJtMLud0cEIle5HC3pKcY4EJxyH4BlPD6d8=";
			"wayland-protocols-async-0.1.0" = "sha256-Js2Ea3O7VgOYF3scw1jxPxfhCDatfow7PsSTrNRSD/M=";
		};
	};

	nativeBuildInputs = [
		pkg-config
		rustPlatform.bindgenHook
	];

	buildInputs = [
		dbus
		pam
		libpulseaudio
	];

	patchPhase = ''
		cd services

		cp ${./Cargo.lock} Cargo.lock
	'';
}