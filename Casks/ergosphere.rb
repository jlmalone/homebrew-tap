cask "ergosphere" do
  version "1.0.1.94"
  sha256 "76bcd3587a812fcb83135554fe673275106a6a26199c1127775ccd7a5d3f9428"

  url "https://github.com/jlmalone/homebrew-tap/releases/download/ergosphere-v#{version}/Ergosphere-#{version}.dmg"
  name "Ergosphere"
  desc "Matrix-themed YouTube content management and yt-dlp downloader"
  homepage "https://github.com/jlmalone/ergosphere"

  app "Ergosphere.app"

  zap trash: [
    "~/ergo/`account/browser_choice.json",
    "~/ergo/`account/credentialDatastore",
    "~/Library/Logs/Ergosphere",
  ]
end
