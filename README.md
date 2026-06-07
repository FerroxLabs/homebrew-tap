# Ferrox Labs Homebrew Tap

Homebrew casks for Ferrox Labs apps.

## Flux Desktop

```sh
brew install --cask ferroxlabs/tap/flux
```

or:

```sh
brew tap ferroxlabs/tap
brew install --cask flux
```

Upgrade / uninstall:

```sh
brew upgrade --cask flux
brew uninstall --cask flux
```

### Note on Gatekeeper

Flux is signed with a Developer ID certificate. Apple notarization is pending a
service-side hold on the signing account, so until that clears the cask strips
the download quarantine flag on install, which lets the signed app open without
the macOS "cannot verify" prompt. Once notarization is enabled the quarantine
strip is removed and standard Gatekeeper verification applies.
