class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.4.0/gambit-0.4.0.zip"
  sha256 "6472968a14af2bcb13e0488456e672f7e324663bf0a3e7f3cc746c2efe2d81ee"
  version "0.4.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/gambit version")
  end
end
