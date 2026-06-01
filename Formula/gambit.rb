class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.9.0/gambit-0.9.0.zip"
  sha256 "0fe8cfd274789517a759c059ed453e6bb8b111e9438b8ff37dd0e911abdfd772"
  version "0.9.0"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/gambit version")
  end
end
