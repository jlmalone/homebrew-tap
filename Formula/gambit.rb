class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.54.0/gambit-0.54.0.zip"
  version "0.54.0"
  sha256 "fa6f3e4b15e64045b84ef2c6bdc67e054391fa39de21ec144b58572e1ca773c1"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.54.0", shell_output("#{bin}/gambit version")
  end
end
