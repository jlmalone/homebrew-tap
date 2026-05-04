cask "mythoman" do
  version "1.0.0"
  sha256 "5ae33423fc4ac7b792a2b3b99237c5cd766a1667331c1d0e6fdc61aa8f555841"

  url "https://github.com/jlmalone/homebrew-tap/releases/download/v#{version}/Mythoman-#{version}.dmg"
  name "Mythoman"
  desc "Per-install utility shell and project launcher"
  homepage "https://github.com/jlmalone/mythoman"

  app "Mythoman.app"

  zap trash: [
    "~/Library/Application Support/Mythoman",
    "~/Library/Logs/Mythoman",
  ]
end
