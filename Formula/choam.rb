class Choam < Formula
  desc "Cross-machine file synchronization for large media repositories"
  homepage "https://github.com/jlmalone/choam"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/choam-v2.0.15.128/choam-2.0.15.128.zip"
  sha256 "266c1da888ee8939afebfae58fb09de3fac232563f0e606f7885d9ba32176637"
  license "MIT"

  depends_on "openjdk@21"

  def install
    # Remove Windows batch file
    rm "bin/choam.bat"

    # Fix the shell script to use Homebrew's JDK
    inreplace "bin/choam", /^#!.*/, "#!/bin/bash"

    libexec.install Dir["*"]

    # CHOAM targets Java 21 bytecode. Pin the formula dependency so an unrelated
    # machine-wide JAVA_HOME cannot select an older, incompatible runtime.
    env = Language::Java.java_home_env("21")
    (bin/"choam").write_env_script libexec/"bin/choam", env
  end

  test do
    ENV["JAVA_HOME"] = "/invalid-java-home"
    assert_match "Cross-Host Orchestrated Asset Management", shell_output("#{bin}/choam --help")
  end
end
