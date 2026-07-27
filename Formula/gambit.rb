class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.59.2/gambit-0.59.2.zip"
  version "0.59.2"
  sha256 "c95792d7d562952e9d36933b9ccac055d915677beaf421369c22c19d3f7d47ed"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.59.2", shell_output("#{bin}/gambit version")
  end
end
