class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  version "2.3.3"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-apple"
      sha256 "b6d5363836da16bb23d32aa631b48e02c9f2eeb8c60b365f6a397177bc5b5d32"
    end

    on_intel do
      odie "km: Intel macOS is not supported by this formula. Please use an Apple Silicon Mac or a supported Linux platform."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-aarch64"
      sha256 "a70357bdfbb7a4eb3e1e0e915cb41a59030f09a2c9d0d2af4105b598420381a1"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-x86_64"
      sha256 "61bf248c64242bedff5b8d58c6c17a075472ea7c30f6fca2dcd51161f575d5dd"
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