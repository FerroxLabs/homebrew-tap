cask "wayland" do
  arch arm: "arm64", intel: "x64"

  version "0.9.6-rc.2.1"
  sha256 arm:   "b9b1b7f12e56d29a14c9770d667e3c6c070f484796745914beb549b1c756c874",
         intel: "b594cd29d3a2a441ad264224737e0d07486674be1253a4c31a5fce6b1343c9b8"

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
