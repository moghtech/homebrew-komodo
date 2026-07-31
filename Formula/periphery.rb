class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  version "2.3.1"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-apple"
      sha256 "fe3c3d3902e7a1c0cf5a2617df921a0875491143e8792eb387f37212edc0257d"
    end

    on_intel do
      odie "The periphery formula does not provide a macOS Intel binary. Please use an Apple Silicon Mac or install on Linux."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-aarch64"
      sha256 "1fb85d63d8039fc8e7ac0881836d7df3e15cff91346b799798d12c998ee16f4b"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-x86_64"
      sha256 "db671652f3a1188c0d16435a6552fb30eb3bf31092c36dd6b7d6352f4bcab676"
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