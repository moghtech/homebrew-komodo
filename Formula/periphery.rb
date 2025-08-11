class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/moghtech/homebrew-komodo/releases/download/v1.19.0-dev-9/periphery.tar.gz"
  sha256 "742f474742075be95b1ea13f9f9be517db7ae03ee15a84ef124de0a552cd5582"
  license "GPL-V3.0"

  def install
    bin.install "periphery"
    (etc/"komodo").install "periphery.config.toml"
    (var/"komodo").mkpath
    (var/"log/komodo").mkpath
  end

  # Define a launchd service block
  service do
    run ["/bin/sh", "-c", "PATH=$PATH:/usr/local/bin #{opt_bin}/periphery --config-path #{etc}/komodo/periphery.config.toml"]
    keep_alive true
    working_dir var/"komodo"
    log_path var/"log/komodo/periphery.log"
    error_log_path var/"log/komodo/periphery-error.log"
  end

  test do
    # Test the installation
    system "#{bin}/periphery", "--version"
  end
end