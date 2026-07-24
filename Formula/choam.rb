class Choam < Formula
  desc "Cross-machine file synchronization for large media repositories"
  homepage "https://github.com/jlmalone/choam"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/choam-v2.0.12.124/choam-2.0.12.124.zip"
  sha256 "a412b3f5abe59a77f7ba35397282d498f63e073217b39161d4cc5828be6ba4c8"
  license "MIT"

  depends_on "openjdk@21"

  def install
    # Remove Windows batch file
    rm "bin/choam.bat"

    # Fix the shell script to use Homebrew's JDK
    inreplace "bin/choam", /^#!.*/, "#!/bin/bash"

    libexec.install Dir["*"]

    # Always use the declared JDK. Login shells may export an older JAVA_HOME.
    env = Language::Java.java_home_env("21")
    (bin/"choam").write_env_script libexec/"bin/choam", env
  end

  test do
    assert_match "Cross-Host Orchestrated Asset Management", shell_output("#{bin}/choam --help")
  end
end
