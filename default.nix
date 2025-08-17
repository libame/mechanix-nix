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
in
{
	files = pkgs.callPackage ./files { inherit mechanixGuiSrc; };
	settings = pkgs.callPackage ./settings { inherit mechanixGuiSrc; };
	camera = pkgs.callPackage ./camera { inherit mechanixGuiSrc; };
}