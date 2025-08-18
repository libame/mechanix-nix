pkgs:
{
	name,
	package,
	settings,
	settingsEnvVar ? "MECHA_LAUNCHER_SETTINGS_PATH"
}:
let
	lib = pkgs.lib;
	wrapWith = args: settings:
		let
			settingsFile = (pkgs.formats.yaml {}).generate "settings.yml" settings;
			overriddenPackage = package.override args;
			cleanName = lib.escapeShellArg name;
		in
		pkgs.runCommand name {
			buildInputs = [ pkgs.makeWrapper ];
		} ''
			mkdir -p $out/bin
			makeWrapper ${lib.escapeShellArg overriddenPackage}/bin/${cleanName} $out/bin/${cleanName} \
				--set LD_LIBRARY_PATH ${pkgs.libGL}/lib \
				--set ${settingsEnvVar} ${settingsFile}
		'';
	makeOverridable = package: args: settings:
		((package args settings) // {
			override = newArgs: makeOverridable package (args // newArgs) settings;
			withSettings = newSettings: makeOverridable package args (lib.recursiveUpdate settings newSettings);
		});
in
	makeOverridable wrapWith {} settings