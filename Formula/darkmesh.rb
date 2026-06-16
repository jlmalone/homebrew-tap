class Darkmesh < Formula
  desc "Self-healing Tailscale + VPN coexistence guard with port-scoped fail-closed"
  homepage "https://github.com/jlmalone/darkmesh-vpn-guard"
  url "https://github.com/jlmalone/darkmesh-vpn-guard/releases/download/v0.1.0/darkmesh-0.1.0.tar.gz"
  sha256 "ece1b4c2617401c9c5c368d8e061a72e991852234f3b7eb0847b25eb7fb9ee68"
  license "MIT"

  depends_on :macos

  def install
    # All scripts + the PF guard live in libexec; the user-facing subset is
    # symlinked onto PATH (the `darkmesh` dispatcher is the front door).
    libexec.install Dir["scripts/*"]
    libexec.install "vpn-guard/vpn-guard.sh"

    user_tools = %w[
      darkmesh darkmesh-setup darkmesh-audit darkmesh-healthcheck darkmesh-reconnect
      darkmesh-up darkmesh-panic darkmesh-captive darkmesh-diag darkmesh-dns-recover
      install-dns-recover-helper.sh transfer-vpn-doctor darkmesh-expressvpn-tailscale
      relax-network-lock emergency-restore-internet vpn-guard.sh
    ]
    user_tools.each { |t| bin.install_symlink libexec/t }

    # Data files `darkmesh setup` consumes (plist templates, PF rules, sudoers tmpl).
    pkgshare.install Dir["vpn-guard/com.user.darkmesh-healthcheck.plist",
                         "vpn-guard/com.user.darkmesh-reconnect.plist",
                         "vpn-guard/com.user.vpnguard.plist",
                         "vpn-guard/unsafe.pf.conf",
                         "vpn-guard/sudoers.d-vpn-guard"]
  end

  def caveats
    <<~EOS
      One-time per machine — loads the LaunchAgents + arms the PF kill-switch.
      Run as your user (it sudoes internally and prompts once); do NOT use sudo:

        darkmesh setup

      Then verify:

        darkmesh audit
        darkmesh status

      Upgrades: `brew upgrade darkmesh` updates the code the agents run
      automatically. Re-run `darkmesh setup` only if a plist/arg changes.
    EOS
  end

  test do
    assert_match "darkmesh", shell_output("#{bin}/darkmesh help")
  end
end
