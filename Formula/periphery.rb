class Periphery < Formula
  desc "Agent to connect with Komodo Core"
  homepage "https://komo.do"
  version "2.1.1"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-apple"
      sha256 "16c56ac365a8d47ac2978eb97662ccf881c07ec800775c6e7582457bd50371a4"
    end

    on_intel do
      odie "The periphery formula does not provide a macOS Intel binary. Please use an Apple Silicon Mac or install on Linux."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-aarch64"
      sha256 "549d4a7824da6f49a5aa5dc8c5b4cb3b52562762b7a5a6d63e08ed08cf435aa6"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/periphery-x86_64"
      sha256 "e02e125b3b6604926abdd45752453216e597e1c800c83d760e7c66cfc7a50b91"
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

    (etc/"komodo").install buildpath.parent/"periphery.config.toml"

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