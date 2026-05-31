class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.3.0/gambit-0.3.0.zip"
  sha256 "426f7f2e78ec5ae5f34cf8141118dacdea42b6c539515a23c98f909d057a9367"
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
