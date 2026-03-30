class Choam < Formula
  desc "Cross-machine file synchronization for large media repositories"
  homepage "https://github.com/jlmalone/choam"
  url "https://github.com/jlmalone/choam/releases/download/v2.0.0/choam-2.0.0.zip"
  sha256 "85b7dbb4ca1494c0016481e208c54dd603216879799eb280ff2e68dee0a2341f"
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
