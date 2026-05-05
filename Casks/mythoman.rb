cask "mythoman" do
  version "1.0.7"
  sha256 "925534b81b4f104e25999562ae953dd14254a1ab56d5284b47d5b85dc8b232af"

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
