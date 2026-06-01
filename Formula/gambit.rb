class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.8.0/gambit-0.8.0.zip"
  sha256 "7cbaa6a301192c2fdf7870a25599f653f50a501049f773cbb1b1afac318feacb"
  version "0.8.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/gambit version")
  end
end
