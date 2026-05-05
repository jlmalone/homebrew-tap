cask "mythoman" do
  version "1.0.9"
  sha256 "38222c861639cf12f6e003465a46d0040733db28108ed151e4e7e73892c756f1"

  url "https://github.com/jlmalone/homebrew-tap/releases/download/v#{version}/Mythoman-#{version}.dmg"
  name "Mythoman"
  desc "Per-install utility shell and project launcher"
  homepage "https://github.com/jlmalone/mythoman"

  app "Mythoman.app"

  binary "#{appdir}/Mythoman.app/Contents/MacOS/Mythoman", target: "mythoman"

  zap trash: [
    "~/.mythoman",
    "~/Library/Logs/Mythoman",
  ]
end
