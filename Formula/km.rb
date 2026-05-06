class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  version "2.1.1"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-apple"
      sha256 "2348a08d937e04a61b7a2a4ae2fbcdb5c6f6e8380df8a33195ad80e0679aa607"
    end

    on_intel do
      odie "km: Intel macOS is not supported by this formula. Please use an Apple Silicon Mac or a supported Linux platform."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-aarch64"
      sha256 "c6d1e5e60e9c1831176baa31f0e6c430cc759066202bf35ab8ccbaeffd7561f0"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-x86_64"
      sha256 "b91d9b75bdabe5447510216ff0a669d5721c43d05ad67d3d14c72567f05a4e93"
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