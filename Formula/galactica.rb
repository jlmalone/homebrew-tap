class Galactica < Formula
  desc "Charter Forge and the Galactica CLI: compose a star system's founding charter"
  homepage "https://github.com/jlmalone/galactica"
  version "0.1.0"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/galactica-v#{version}/galactica-#{version}.tar.gz"
  sha256 "3bc2261521cd2f875263e4b80279e12da9772617be711eb90ad10ec4ddcb8738"

  depends_on "openjdk@21"

  def install
    # Tarball extracts to bin/galactica (gradle launcher) + lib/*.jar. Stash the
    # whole distribution under libexec; the public `galactica` command is an
    # env-script wrapper that pins JAVA_HOME and defers to the inner launcher,
    # which sets its own classpath from lib/.
    libexec.install Dir["*"]
    (bin/"galactica").write_env_script libexec/"bin/galactica",
      Language::Java.overridable_java_home_env("21")
  end

  test do
    # --help is intercepted before the interactive menu, so it is deterministic.
    assert_match "Galactica", shell_output("#{bin}/galactica --help")
  end
end
