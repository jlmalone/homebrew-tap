class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.11.0/gambit-0.11.0.zip"
  sha256 "b81dabca384c16c60032d747e428b4bd8448ec9a7bfe0b5eac80d773f082c743"
  version "0.11.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.11.0", shell_output("#{bin}/gambit version")
  end
end
