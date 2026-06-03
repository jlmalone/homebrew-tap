cask "ergosphere" do
  version "1.0.2.95"
  sha256 "374cd9a9f35d164e1c377c59f996702be2b8a1763e3eb3bef5cd8fd2bfa6ecc6"

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
