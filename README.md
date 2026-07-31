# Axelerant Homebrew Tap

Homebrew casks and formulae for software published by [Axelerant](https://www.axelerant.com/).

## Install

```sh
brew install --cask axelerant/tap/fynn
```

That taps this repository on first use. To tap it explicitly:

```sh
brew tap axelerant/tap
```

## What's here

| Cask   | Description                                       | Requires             |
| ------ | ------------------------------------------------- | -------------------- |
| `fynn` | Fynn for Mac — meeting and note capture           | macOS 14 (Sonoma)+   |

`fynn` installs a signed and notarized `.pkg`, so Homebrew will prompt for your
password during install.

## Upgrade

```sh
brew update && brew upgrade --cask fynn
```

Fynn for Mac has no built-in updater — Homebrew is the upgrade path.

## Uninstall

```sh
brew uninstall --cask fynn          # removes the app
brew uninstall --zap --cask fynn    # also removes local app data and caches
```

`--zap` cannot reach the Keychain, so the app's local capture-store key survives.
Remove it by hand in Keychain Access if you want a truly clean slate: search for
`com.fynn.desktop.capture-store`.

## Updating casks in this tap

Bumps are automated. Tagging a release in the product's own repository builds,
signs, and notarizes the artifact, publishes it, then pushes the `version` and
`sha256` bump here. Prefer letting that job run over hand-editing a cask — the
`sha256` has to match the published bytes exactly, and a signed build is not
byte-for-byte reproducible, so a hand-written hash cannot be recovered by guessing.
