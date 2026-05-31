class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.3.0/gambit-0.3.0.zip"
  sha256 "dbaf87f9eb39632e97949f719e5eff97d10ac7b95b036c0cbef0bca8ea6f8192"
  version "0.3.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/gambit version")
  end
end
