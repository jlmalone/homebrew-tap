cask "server-monitor" do
  version "1.2.8"
  sha256 "5f212e4dd916098f257f1d2232dce089591403b712d04bd6ef676b001287612b"

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
