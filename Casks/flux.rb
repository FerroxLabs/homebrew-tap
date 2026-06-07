cask "flux" do
  version "0.2.6"
  sha256 "c7e1e8ddac514517eb2f7526ebd66862a9611d1461505b66f41ef5b8c362a6ee"

  url "https://github.com/FerroxLabs/flux-desktop/releases/download/v#{version}/Flux_#{version}_universal.dmg",
      verified: "github.com/FerroxLabs/flux-desktop/"
  name "Flux"
  desc "Menu-bar app that routes AI coding tools through Flux Router"
  homepage "https://fluxrouter.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Flux.app"

  # Flux is Developer-ID signed but not yet Apple-notarized (account-level notary
  # hold on the signing team). Homebrew quarantines downloads, so without this an
  # un-notarized app would hit the Gatekeeper "cannot verify" wall. Strip the
  # quarantine flag from the freshly-installed, signed app so it opens cleanly.
  # REMOVE this block once notarization is enabled (then plain Gatekeeper passes).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Flux.app"]
  end

  uninstall launchctl: "ai.fluxrouter.daemon",
            quit:      "ai.fluxrouter.desktop"

  zap trash: [
    "~/.flux",
    "~/Library/Application Support/ai.fluxrouter.desktop",
    "~/Library/Caches/ai.fluxrouter.desktop",
    "~/Library/LaunchAgents/ai.fluxrouter.daemon.plist",
    "~/Library/Preferences/ai.fluxrouter.desktop.plist",
    "~/Library/Saved Application State/ai.fluxrouter.desktop.savedState",
  ]
end
