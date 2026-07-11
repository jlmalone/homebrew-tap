class Learnchinese < Formula
  desc "Terminal client for LearnChinese: study Mandarin with cross-device sync"
  homepage "https://github.com/jlmalone/learnchinese_cli"
  version "0.1.0"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/learnchinese-v#{version}/learnchinese-#{version}.tar.gz"
  sha256 "e77fdcdf58b8fac934c08256a3a5ea272765320129103ce71925c16c734b170b"

  depends_on "openjdk@21"

  def install
    # Tarball ships bin/learnchinese (wrapper) + libexec/learnchinese-cli.jar (fat JAR).
    # The public bin/ command is an env-script that pins JAVA_HOME to openjdk@21 and
    # tells the inner wrapper where the JAR lives.
    libexec.install Dir["*"]

    env = Language::Java.overridable_java_home_env("21").merge(
      "LEARNCHINESE_JAR" => libexec/"libexec/learnchinese-cli.jar",
    )
    (bin/"learnchinese").write_env_script libexec/"bin/learnchinese", env
  end

  test do
    # version is the only deterministic invocation; anything else touches ~/.learnchinese or network.
    assert_match "0.1.0", shell_output("#{bin}/learnchinese version")
  end
end
