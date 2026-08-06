class Redo < Formula
  desc "Local-first distributed task manager with Firebase-backed sync"
  homepage "https://redotasks.com/"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/redo-v0.0.52/redo-0.0.52.tar.gz"
  sha256 "46ff8b8dcf1391c7903759d20d13742683328e94d32f36dc3a82959ea2fb475d"

  depends_on "openjdk@21"

  def install
    # Tarball ships bin/redo (wrapper) + libexec/redo.jar (fat JAR ~75MB).
    # Stash both under the formula's libexec; the public `redo` command in
    # bin/ is an env-script wrapper that pins JAVA_HOME + tells the inner
    # wrapper where the JAR lives.
    libexec.install Dir["*"]

    env = Language::Java.overridable_java_home_env("21").merge(
      "REDO_JAR" => libexec/"libexec/redo.jar",
    )
    (bin/"redo").write_env_script libexec/"bin/redo", env
  end

  test do
    # --help is the only deterministic invocation — anything that touches the
    # filesystem or network ($HOME/.redo, Firebase) would be order-dependent.
    assert_match "Redo task manager CLI", shell_output("#{bin}/redo --help")
  end
end
