# Nix stuff for Mechanix OS
## Index
- [Contents](#contents)
- [How to use](#how-to-use)
- [Use through fetchgit](#use-through-fetchgit)
## Contents
This repo currently contains the following packages:
### Services
- `system-dbus-server`
- `desktop-dbus-server`
### Shell
- `launcher`
- `keyboard`
### Apps
- `settings`
- `files`
- `camera`
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
You can customize the packages' settings like this:
```nix
(import <mechanix-nix> {}).launcher.withSettings { modules.clock.time = "%I:%M %p"; }
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
		rev = "4c3f579d6ea5c2ea1c66d6033f40b6cd097d0080";
		sha256 = "s0FtuiQwf57KMO62ucsX25l1r4CiWC7urBeNEDynqww=";
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
		rev = "4c3f579d6ea5c2ea1c66d6033f40b6cd097d0080";
		sha256 = "s0FtuiQwf57KMO62ucsX25l1r4CiWC7urBeNEDynqww=";
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