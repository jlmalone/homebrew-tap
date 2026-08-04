cask "server-monitor" do
  version "1.2.0"
  sha256 "6619f8cd01c4f5483734ee1e14b825dcbc9996a306d34185f4ce03e457329547"

  url "https://github.com/jlmalone/server_monitor/releases/download/v#{version}/ServerMonitor-#{version}.dmg"
  name "Server Monitor"
  desc "Menu-bar monitor for launchd services, VPN protection, and file transfers"
  homepage "https://github.com/jlmalone/server_monitor"

  depends_on :macos

  app "ServerMonitor.app"

  zap trash: [
    "~/.config/server-monitor",
    "~/Library/Application Support/ServerMonitor",
    "~/Library/Preferences/vision.salient.ServerMonitor.plist",
  ]
end
