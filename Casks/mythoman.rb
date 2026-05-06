cask "mythoman" do
  version "1.0.10"
  sha256 "7a84f9513c364143e8357ffb29d2b6d1d97fb3dce9ded028eb336c6256ce839a"

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
