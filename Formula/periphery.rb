class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/moghtech/homebrew-komodo/releases/download/v1.19.1/periphery.tar.gz"
  sha256 "469de43c3b232f0a2bda87c5d884920d931526f18ec00e009498ce37dcfbedb3"
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