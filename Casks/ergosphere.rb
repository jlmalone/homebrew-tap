cask "ergosphere" do
  version "1.0.13.114"
  sha256 "115beb6ea8623a0d8be839a38a43d3c12c6ed344d849b08de6af382b3ab6b800"

  url "https://github.com/jlmalone/homebrew-tap/releases/download/ergosphere-v#{version}/Ergosphere-#{version}.dmg"
  name "Ergosphere"
  desc "Matrix-themed YouTube content management and yt-dlp downloader"
  homepage "https://github.com/jlmalone/ergosphere"

  app "Ergosphere.app"
  binary "#{appdir}/Ergosphere.app/Contents/MacOS/Ergosphere", target: "ergosphere"

  zap trash: [
    "~/ergo/account/browser_choice.json",
    "~/ergo/account/credentialDatastore",
    "~/Library/Logs/Ergosphere",
  ]
end
