cask "flux" do
  version :latest
  sha256 :no_check

  # flux-desktop is a private repo, so its GitHub release assets are not publicly
  # downloadable. fluxrouter.ai/api/download/mac is the public endpoint: it
  # 302-redirects to the latest signed universal .dmg. It only serves "latest",
  # hence version :latest / sha256 :no_check (integrity still covered by HTTPS +
  # the app's Developer ID signature, which macOS verifies at launch).
  url "https://fluxrouter.ai/api/download/mac"
  name "Flux"
  desc "Menu-bar app that routes AI coding tools through Flux Router"
  homepage "https://fluxrouter.ai/"

  depends_on macos: :ventura

  app "Flux.app"

  # Flux is Developer-ID signed AND Apple-notarized (since v0.2.8), so Gatekeeper
  # verifies it normally — no quarantine workaround needed. (Earlier versions
  # stripped com.apple.quarantine here while the account's notary hold was
  # active; that hack was removed once notarization shipped.)

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
