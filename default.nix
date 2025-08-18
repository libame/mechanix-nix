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