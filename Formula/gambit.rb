class Gambit < Formula
  desc "Pure-Kotlin CLI client for the Gambit chess DAG + tracker protocol"
  homepage "https://github.com/jlmalone/gambit_cli"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/gambit-v0.59.6/gambit-0.59.6.zip"
  version "0.59.6"
  sha256 "709bd59d388e07f1b42e64ae7aa9443b14286490aead3a149ce23a46199384b9"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/gambit"
    env = Language::Java.overridable_java_home_env("21")
    (bin/"gambit").write_env_script libexec/"bin/gambit", env
  end

  test do
    assert_match "0.59.6", shell_output("#{bin}/gambit version")
  end
end
