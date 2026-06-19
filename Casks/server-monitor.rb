cask "server-monitor" do
  version "1.0.1"
  sha256 "1a91aff1d90cc1aeb29af201408651b2634e7e7217ee6e4017fd33a4daaa4b2c"

  url "https://github.com/jlmalone/server_monitor/releases/download/v#{version}/ServerMonitor-#{version}.dmg"
  name "Server Monitor"
  desc "Menu-bar monitor for launchd services, VPN protection, and file transfers"
  homepage "https://github.com/jlmalone/server_monitor"

  app "ServerMonitor.app"

  # App is not yet notarized; after install, first launch needs a one-time
  # Gatekeeper approval (right-click -> Open), or:
  #   xattr -dr com.apple.quarantine "/Applications/ServerMonitor.app"
  caveats <<~EOS
    ServerMonitor.app is not notarized yet. On first launch:
      right-click the app in /Applications -> Open -> Open
    or clear the quarantine flag:
      xattr -dr com.apple.quarantine "/Applications/ServerMonitor.app"
  EOS

  zap trash: [
    "~/Library/Application Support/ServerMonitor",
    "~/Library/Preferences/vision.salient.ServerMonitor.plist",
    "~/.config/server-monitor",
  ]
end
