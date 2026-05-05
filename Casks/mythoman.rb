cask "mythoman" do
  version "1.0.1"
  sha256 "4edf39e0fec1575f9b9eaf804d34f017f846986388a67f650540e794da60e681"

  url "https://github.com/jlmalone/homebrew-tap/releases/download/v#{version}/Mythoman-#{version}.dmg"
  name "Mythoman"
  desc "Per-install utility shell and project launcher"
  homepage "https://github.com/jlmalone/mythoman"

  app "Mythoman.app"

  zap trash: [
    "~/.mythoman",
    "~/Library/Logs/Mythoman",
  ]
end
