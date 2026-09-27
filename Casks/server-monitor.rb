cask "server-monitor" do
  version "1.2.13"
  sha256 "795bbbbd8bbc75d29263f6caa28f73a19d76d5f7cffc462387442fa3b906d9aa"

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
