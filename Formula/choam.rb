class Choam < Formula
  desc "Cross-machine file synchronization for large media repositories"
  homepage "https://github.com/jlmalone/choam"
  version "2.0.8.112"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/choam-v#{version}/choam-#{version}.zip"
  sha256 "206b75e660da6b8efa1c7c3419e0847fd87aac6b1ff139da4e17db1c3619493a"
  license "MIT"

  depends_on "openjdk@21"
  depends_on "rsync"

  def install
    # Remove Windows batch file
    rm "bin/choam.bat"

    # Fix the shell script to use Homebrew's JDK
    inreplace "bin/choam", /^#!.*/, "#!/bin/bash"

    libexec.install Dir["*"]

    # Set JAVA_HOME in the wrapper script
    env = Language::Java.overridable_java_home_env("21")
    (bin/"choam").write_env_script libexec/"bin/choam", env
  end

  test do
    assert_match "Cross-Host Orchestrated Asset Management", shell_output("#{bin}/choam --help")
  end
end
