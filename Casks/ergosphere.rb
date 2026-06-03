cask "ergosphere" do
  version "1.0.3.96"
  sha256 "1582b6f7bb3d3abaa42da0b761a2cc4e9583a7359a98b72f7ea9d309fcd7d45b"

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
