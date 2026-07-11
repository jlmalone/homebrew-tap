class Galactica < Formula
  desc "Charter Forge and the Galactica CLI: compose a star system's founding charter"
  homepage "https://github.com/jlmalone/galactica"
  version "0.1.1"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/galactica-v#{version}/galactica-#{version}.tar.gz"
  sha256 "f8c8391f3d195b4adefdb965258485fa8e6d4b925c899328e2d275e123cbcbce"

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
