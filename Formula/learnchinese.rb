class Learnchinese < Formula
  desc "Terminal client for LearnChinese: study Mandarin with cross-device sync"
  homepage "https://github.com/jlmalone/learnchinese_cli"
  version "0.1.3"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/learnchinese-v#{version}/learnchinese-#{version}.tar.gz"
  sha256 "f245fa7a72ac63ca5605851021254dc2997dd9d26d436b9a21820561018d26d1"

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
    assert_match version.to_s, shell_output("#{bin}/learnchinese version")
  end
end
