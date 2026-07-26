class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.56.0/gambit-0.56.0.zip"
  version "0.56.0"
  sha256 "cccfefa474a1c99d094c8b3962e80d1166592e3c9722dac6c6c3ef6ca4b84eb2"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.56.0", shell_output("#{bin}/gambit version")
  end
end
