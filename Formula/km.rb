class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  version "2.3.4"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-apple"
      sha256 "d14889dc4e3a0a5dbd90e310b1302d31dc1d91379f6d3ed45b9a27b103cfc8fc"
    end

    on_intel do
      odie "km: Intel macOS is not supported by this formula. Please use an Apple Silicon Mac or a supported Linux platform."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-aarch64"
      sha256 "8337e3860e2417df88a401ccdfe376a5dabd92532de6c408e1f8c00439c0365c"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-x86_64"
      sha256 "cdf4efb4f0f2f36212b18edd0ad98fead4d04d19e5a3edbfb0de8c4c9d4f6435"
    end
  end

  def install
    binary_name = if OS.mac?
      "km-apple"
    elsif Hardware::CPU.arm?
      "km-aarch64"
    else
      "km-x86_64"
    end

    bin.install binary_name => "km"
  end

  test do
    # Test the installation
    system "#{bin}/km", "--version"
  end
end