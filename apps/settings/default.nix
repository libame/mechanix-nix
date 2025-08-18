{
	rustPlatform,
	pkg-config,
	wayland,
	libxkbcommon,
	dbus,
	pam,
	protobuf,
	libpulseaudio,
	mechanixGuiSrc
}:
rustPlatform.buildRustPackage {
	name = "mechanix-settings-unwrapped";
	src = mechanixGuiSrc;
	
	cargoLock = {
		lockFile = ./Cargo.lock;
		outputHashes = {
			"cosmic-text-0.10.0" = "sha256-TRq4gghOJC0QbkR8mUDIb802qWUuftiydQgMhkjiL1Y=";
			"mctk_core-0.1.0" = "sha256-PQwHae3aBMRS0AsH95reEWcfIudMtuhFm55yqytaidU=";
			"mctk_macros-0.1.0" = "sha256-PQwHae3aBMRS0AsH95reEWcfIudMtuhFm55yqytaidU=";
			"shmemfdrs-0.1.4" = "sha256-CHB49DaAdJtMLud0cEIle5HC3pKcY4EJxyH4BlPD6d8=";
			"wayland-protocols-async-0.1.0" = "sha256-Js2Ea3O7VgOYF3scw1jxPxfhCDatfow7PsSTrNRSD/M=";
		};
	};

	nativeBuildInputs = [
		pkg-config
		protobuf
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
		substituteInPlace shell/Cargo.toml \
			--replace-fail 'rev = "7c88787de053200cda4f7f02c050129e7c372d6d"' 'branch = "dev"' \
			--replace-fail ', rev = "0c2c8f6ab9d944e24fdff89f08fd8fe6a67eb6d3"' ""
		substituteInPlace commons/networkmanager/Cargo.toml \
			--replace-fail 'rev = "7c88787de053200cda4f7f02c050129e7c372d6d"' 'branch = "dev"'

		cd apps

		cp ${./Cargo.lock} Cargo.lock
		substituteInPlace Cargo.toml \
			--replace-fail ', "camera",  "files"' ""
	'';
}