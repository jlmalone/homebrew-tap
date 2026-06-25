class Darkmesh < Formula
  desc "Self-healing Tailscale + VPN coexistence guard with port-scoped fail-closed"
  homepage "https://github.com/jlmalone/darkmesh-vpn-guard"
  url "https://github.com/jlmalone/homebrew-tap/releases/download/darkmesh-v0.1.2/darkmesh-0.1.2.tar.gz"
  sha256 "6ec3e08f38adbead70c1628ffd0f252377ffae619b33d734c241db9d496268d6"
  license "MIT"

  depends_on :macos

  def install
    # All scripts + the PF guard live in libexec; the user-facing subset is
    # symlinked onto PATH (the `darkmesh` dispatcher is the front door).
    libexec.install Dir["scripts/*"]
    libexec.install "newsyslog"
    libexec.install "vpn-guard/vpn-guard.sh"

    user_tools = %w[
      darkmesh darkmesh-setup darkmesh-audit darkmesh-healthcheck darkmesh-breaker
      darkmesh-root-helper darkmesh-reconnect darkmesh-repair
      darkmesh-up darkmesh-panic darkmesh-captive darkmesh-diag
      install-root-helper.sh transfer-vpn-doctor darkmesh-expressvpn-tailscale
      relax-network-lock emergency-restore-internet vpn-guard.sh
    ]
    user_tools.each { |t| bin.install_symlink libexec/t }

    # Data files `darkmesh setup` consumes (plist templates, PF rules, sudoers tmpl).
    pkgshare.install Dir["vpn-guard/com.user.darkmesh-healthcheck.plist",
                         "vpn-guard/com.user.darkmesh-reconnect.plist",
                         "vpn-guard/com.user.darkmesh-netchange.plist",
                         "vpn-guard/com.user.vpnguard.plist",
                         "vpn-guard/unsafe.pf.conf",
                         "vpn-guard/sudoers.d-vpn-guard"]
  end

  def caveats
    <<~EOS
      One-time per machine: loads the LaunchAgents + arms the PF kill-switch.
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
