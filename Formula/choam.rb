class Choam < Formula
  desc "Cross-machine file synchronization for large media repositories"
  homepage "https://github.com/jlmalone/choam"
  url "https://github.com/jlmalone/choam/releases/download/v1.0.0/choam-1.0.0.zip"
  sha256 "ea691990432dbebe314db7077b095f2b0b8619fde923f3e1378570ad553abd8a"
  license "MIT"

  depends_on "openjdk@21"

  def install
    # Remove Windows batch file
    rm "bin/choam.bat"

    # Fix the shell script to use Homebrew's JDK
    inreplace "bin/choam", /^#!.*/, "#!/bin/bash"

    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/choam"

    # Set JAVA_HOME in the wrapper script
    env = Language::Java.overridable_java_home_env("21")
    bin.env_script_all_files libexec/"bin", env
  end

  test do
    assert_match "Cross-Host Orchestrated Asset Management", shell_output("#{bin}/choam --help")
  end
end
