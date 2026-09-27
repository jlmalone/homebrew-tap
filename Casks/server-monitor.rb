cask "server-monitor" do
  version "1.2.15"
  sha256 "6580b5e72e254d63ff43ad5d5a9f105440c1ed36eccdb6c28b549ce25bc7f335"

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
