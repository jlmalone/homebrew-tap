class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.58.0/gambit-0.58.0.zip"
  version "0.58.0"
  sha256 "c6967fffc9a0ddeb917728b510f88cfd190fe713b4072e290221b1c7bcf0fa4b"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.58.0", shell_output("#{bin}/gambit version")
  end
end
