class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.2.1/gambit-0.2.1.zip"
  sha256 "10b524baeb0c271992958fe6adbd9562068a1a48313e9c783b3c69a82985c09e"
  version "0.2.1"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/gambit version")
  end
end
