class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.59.5/gambit-0.59.5.zip"
  version "0.59.5"
  sha256 "5dd0a466817e27fdbf1940ed3938ad48ef7d1b04e54aaafd75411412ff2ceb3f"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.59.5", shell_output("#{bin}/gambit version")
  end
end
