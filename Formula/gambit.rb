class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.55.0/gambit-0.55.0.zip"
  version "0.55.0"
  sha256 "6d079078edfd069306ffa1fda537628bca771c9c7eb2b3fb1fe1f843f2bdfc25"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.55.0", shell_output("#{bin}/gambit version")
  end
end
