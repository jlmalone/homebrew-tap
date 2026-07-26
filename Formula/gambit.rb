class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.57.0/gambit-0.57.0.zip"
  version "0.57.0"
  sha256 "80b3bfbd1a634289b8fe473c9342a6adaccdfbd7fa4da4f089c7fdef4a05b6ec"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.57.0", shell_output("#{bin}/gambit version")
  end
end
