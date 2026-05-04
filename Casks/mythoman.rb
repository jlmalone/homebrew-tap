cask "mythoman" do
  version "1.0.0"
  sha256 :no_check

  url "https://github.com/jlmalone/mythoman/releases/download/v#{version}/Mythoman-#{version}.dmg"
  name "Mythoman"
  desc "Per-install utility shell and project launcher"
  homepage "https://github.com/jlmalone/mythoman"

  app "Mythoman.app"

  zap trash: [
    "~/Library/Application Support/Mythoman",
    "~/Library/Logs/Mythoman",
  ]
end
