class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  version "2.3.4"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-apple"
      sha256 "20f66f9ac8302878f44843068ce3e32f60ea40fa8430b80a24d3e7c4b9b69a90"
    end

    on_intel do
      odie "The periphery formula does not provide a macOS Intel binary. Please use an Apple Silicon Mac or install on Linux."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-aarch64"
      sha256 "f49dc4cfab0046563cab9d7f3910e92e083f7742161a8b877bd60e2e74550feb"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-x86_64"
      sha256 "46d50313970aea59d293bbe237648f4becea74e8abc2f30f1bb62b73456fc72e"
    end
  end

  def install
    binary_name = if OS.mac?
      "periphery-apple"
    elsif Hardware::CPU.arm?
      "periphery-aarch64"
    else
      "periphery-x86_64"
    end

    bin.install binary_name => "periphery"

    (var/"komodo").mkpath
    (var/"log/komodo").mkpath
  end

  service do
    run [opt_bin/"periphery", "--config-path", etc/"komodo/periphery.config.toml"]
    keep_alive true
    working_dir var/"komodo"
    log_path var/"log/komodo/periphery.log"
    error_log_path var/"log/komodo/periphery-error.log"
    environment_variables PATH: std_service_path_env
  end

  test do
    # Test the installation
    system "#{bin}/periphery", "--version"
  end
end