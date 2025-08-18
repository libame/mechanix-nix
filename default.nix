{
	pkgs ? import <nixpkgs> {}
}:
let
	mechanixGuiSrc = pkgs.fetchFromGitHub {
		owner = "mecha-org";
		repo = "mechanix-gui";
		rev = "439a53781d1bb799b8d810f2b30d0005f6c17f27";
		sha256 = "Uh34izooICYpoY3fQQ8kwU0bSXRGY67eZEVBSi9I07A=";
	};
	wrap = import ./wrap.nix pkgs;
in
rec {
	services-unwrapped = pkgs.callPackage ./services { inherit mechanixGuiSrc; };
	system-dbus-server = wrap {
		name = "mechanix_system_dbus_server";
		package = services-unwrapped;
		settings = import services/settings-system-dbus-server.nix;
		settingsEnvVar = "MECHA_SERVICES_CONFIG_PATH";
	};
	desktop-dbus-server = wrap {
		name = "mechanix_desktop_dbus_server";
		package = services-unwrapped;
		settings = import services/settings-desktop-dbus-server.nix;
		settingsEnvVar = "MECHANIX_DESKTOP_SERVER_SETTINGS_PATH";
	};
	shell-unwrapped = pkgs.callPackage ./shell { inherit mechanixGuiSrc; };
	launcher = wrap {
		name = "mechanix-launcher";
		package = shell-unwrapped;
		settings = import shell/settings-launcher.nix mechanixGuiSrc;
	};
	keyboard = wrap {
		name = "mechanix-keyboard";
		package = shell-unwrapped;
		settings = import shell/settings-keyboard.nix mechanixGuiSrc;
		settingsEnvVar = "MECHANIX_KEYBOARD_SETTINGS_PATH";
	};
	settings-unwrapped = pkgs.callPackage apps/settings { inherit mechanixGuiSrc; };
	settings = wrap {
		name = "mechanix-settings";
		package = settings-unwrapped;
		settings = import apps/settings/settings.nix mechanixGuiSrc;
	};
	files-unwrapped = pkgs.callPackage apps/files { inherit mechanixGuiSrc; };
	files = wrap {
		name = "mechanix-files";
		package = files-unwrapped;
		settings = import apps/files/settings.nix mechanixGuiSrc;
	};
	camera-unwrapped = pkgs.callPackage apps/camera { inherit mechanixGuiSrc; };
	camera = wrap {
		name = "mechanix-camera";
		package = camera-unwrapped;
		settings = import apps/camera/settings.nix mechanixGuiSrc;
	};
}