class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.10.0/gambit-0.10.0.zip"
  sha256 "4f43dc0194c0bd5ab4753dfe9d606ecc38604841355523765d901d7ff150e3a8"
  version "0.10.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/gambit version")
  end
end
