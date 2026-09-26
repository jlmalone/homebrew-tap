cask "server-monitor" do
  version "1.2.7"
  sha256 "f48f0d6b2a0c80e1c0b5c9ac407ee816d1c7c17db3159db834ecdfb1ebb14cf9"

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
