class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.59.1/gambit-0.59.1.zip"
  version "0.59.1"
  sha256 "2a18475e9f438b5e9d873976ac913fd17f8cf6ebf090d6de400717983d517187"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.59.1", shell_output("#{bin}/gambit version")
  end
end
