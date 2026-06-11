# Ferrox Labs Homebrew Tap

Homebrew casks for Ferrox Labs apps.

## Wayland

Local-first desktop AI agent that drives every AI CLI on your machine (Claude
Code, Codex, Gemini, and more), on your keys.

```sh
brew install --cask ferroxlabs/tap/wayland
```

or:

```sh
brew tap ferroxlabs/tap
brew install --cask wayland
```

Upgrade / uninstall:

```sh
brew upgrade --cask wayland
brew uninstall --cask wayland
```

The app is signed with a Developer ID and notarized by Apple, so it opens with a
normal double-click, no Gatekeeper prompts.

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

Flux is signed with a Developer ID certificate and Apple-notarized (since v0.2.8),
so Gatekeeper verifies it normally.
