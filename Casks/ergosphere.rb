cask "ergosphere" do
  version "1.0.0.92"
  sha256 "e99d682f2b6682dfaa0efab27fa41bf03b737f79d8b0171edb03b580f6014871"

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
