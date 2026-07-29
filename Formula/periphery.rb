class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  version "2.3.0"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-apple"
      sha256 "9209cbd5f1e03ccabbaee3c8c1acdacc17b2f83c4df3c60176c317a4a887aef2"
    end

    on_intel do
      odie "The periphery formula does not provide a macOS Intel binary. Please use an Apple Silicon Mac or install on Linux."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-aarch64"
      sha256 "c37f7a64d3828e96c691cbd7e2838ce15e5bc54e644839e4fcef9768bcb24443"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-x86_64"
      sha256 "086eb947893cf028729523d0b215142404d3a798bc4760ccbe00fbab05dc31cc"
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