cask "ergosphere" do
  version "1.0.5.98"
  sha256 "b492f04ffd3196dfbabd9f5cfa36a0226008fa37cae04c0c02dd913d4c9c8f60"

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
