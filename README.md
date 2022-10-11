# ytui-music-nix

Nix flake for [ytui-music](https://github.com/sudipghimire533/ytui-music).

## Run

Ensure Nix flakes are [enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes) before running the following command.

```console
nix run github:gvolpe/ytui-music-nix
```

Or without flakes enabled.

```console
nix run --experimental-features 'nix-command flakes' github:gvolpe/ytui-music-nix
```
