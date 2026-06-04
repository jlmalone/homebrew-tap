cask "ergosphere" do
  version "1.0.7.100"
  sha256 "260769f1b2554b0fb64b67d6430c7ac64ff4085b353f85134f715ca61a844ca7"

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
