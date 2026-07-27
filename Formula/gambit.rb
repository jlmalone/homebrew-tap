class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.59.4/gambit-0.59.4.zip"
  version "0.59.4"
  sha256 "314a667c2d4f5b2bb76dff6e4f2c25f3a2f728e53d8cd99097be1b4cc68479ee"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.59.4", shell_output("#{bin}/gambit version")
  end
end
