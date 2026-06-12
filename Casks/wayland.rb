cask "wayland" do
  arch arm: "arm64", intel: "x64"

  version "0.9.7"
  sha256 arm:   "59680030dc67f2c82b0e3532fb634204be6b176e0a6f4964afef60f3032b7439",
         intel: "4d988c82b6e6ffc7624cfed208a45008a219b47e5f0a7e8471b67ff587c166ef"

  url "https://github.com/FerroxLabs/wayland/releases/download/v#{version}/Wayland-#{version}-mac-#{arch}.dmg"
  name "Wayland"
  desc "Local-first desktop AI agent that drives every AI CLI on your machine"
  homepage "https://github.com/FerroxLabs/wayland"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :big_sur

  app "Wayland.app"

  zap trash: [
    "~/Library/Application Support/Wayland",
    "~/Library/Preferences/com.ferroxlabs.wayland.plist",
    "~/Library/Saved Application State/com.ferroxlabs.wayland.savedState",
  ]
end
