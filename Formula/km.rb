class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  version "2.3.1"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-apple"
      sha256 "7424f8dd7a1a846bbbd3d4b2d7dcdd57ac4dc5f4d636e37879bec1e1a29144d3"
    end

    on_intel do
      odie "km: Intel macOS is not supported by this formula. Please use an Apple Silicon Mac or a supported Linux platform."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-aarch64"
      sha256 "65151f61fa39d2ee40c2ead411e232f18fca1a43ec03b47194bcc44efbcc02ad"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-x86_64"
      sha256 "55dcfbde7cefc54d4b7e082a8723cac35f7d8bb5ce3277ce863575b9690fc195"
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