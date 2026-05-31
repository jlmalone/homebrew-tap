class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.2.0/gambit-0.2.0.zip"
  sha256 "c5f072aa54ad91281820ade6fef922448151b8bd6b786b97274cbd4e67ba8967"
  version "0.2.0"

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
