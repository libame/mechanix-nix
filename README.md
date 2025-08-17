# Nix stuff for Mechanix OS
## How to use
Add the repo as a channel:
```bash
$ sudo nix-channel --add 'https://github.com/libame/mechanix-nix/archive/main.tar.gz' mechanix-nix
$ sudo nix-channel --update mechanix-nix
```
Then you can run the apps like this:
```bash
$ nix-shell -p '(import <mechanix-nix> {}).files'
$ mechanix-files
```
You may also add it to your system config like this:
```nix
{ pkgs, ... }:
let
	mechanix-nix = import <mechanix-nix> {};
in
{
	environment.systemPackages = [
		mechanix-nix.camera
		mechanix-nix.files
		mechanix-nix.settings
	];
}
```
By default, the `files` app attempts to open the directory `/home/mecha` when started.\
You can change the startup directory like this:
```nix
(import <mechanix-nix> {}).files.override { homeDir = "/tmp"; }
```
## Use through fetchgit
You may also use this without adding a channel, using fetchgit or fetchFromGitHub:
```nix
let
	mechanix-nix-repo = pkgs.fetchgit {
		url = "https://github.com/libame/mechanix-nix.git";
		rev = "6d0e75840d480050069bef0e061ac743e92c8c28";
		sha256 = "fF8350rKeg9yn0375BcSdeoPUNYUXuZVFAI0qt73Smk=";
	};
	mechanix-nix = import mechanix-nix-repo {};
in
	mechanix-nix.files
```
You would put it in your system config like this:
```nix
{ pkgs, ... }:
let
	mechanix-nix-repo = pkgs.fetchgit {
		url = "https://github.com/libame/mechanix-nix.git";
		rev = "6d0e75840d480050069bef0e061ac743e92c8c28";
		sha256 = "fF8350rKeg9yn0375BcSdeoPUNYUXuZVFAI0qt73Smk=";
	};
	mechanix-nix = import mechanix-nix-repo {};
in
{
	environment.systemPackages = [
		mechanix-nix.camera
		mechanix-nix.files
		mechanix-nix.settings
	];
}
```