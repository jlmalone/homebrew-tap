cask "mythoman" do
  version "1.0.8"
  sha256 "3622c03a4128b3404627c9e5a8f23695622ebd0ba1f9c9df72b3e3331c43e967"

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
