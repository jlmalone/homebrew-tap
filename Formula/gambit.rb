class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.54.1/gambit-0.54.1.zip"
  version "0.54.1"
  sha256 "aa8781945e70791c5fd7b72442fef1e304e9a99c4f08c061085659bb3c264d5d"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.54.1", shell_output("#{bin}/gambit version")
  end
end
