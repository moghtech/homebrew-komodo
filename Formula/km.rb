class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  version "2.3.0"
  license "GPL-V3.0"

  on_macos do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-apple"
      sha256 "002f372643d548fd4c5c774ee0b45b7cfb5027cab424b1bd31e581dc25634a45"
    end

    on_intel do
      odie "km: Intel macOS is not supported by this formula. Please use an Apple Silicon Mac or a supported Linux platform."
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-aarch64"
      sha256 "430dc20ced7dd1a7738adaf9e4a66bb32a8d3fdfd5a2dcc89afb34e989e391bf"
    end

    on_intel do
      url "https://github.com/moghtech/komodo/releases/download/v#{version}/km-x86_64"
      sha256 "af0ebdf12cc99d1b6619def57f999e1b21b68cba32056ab0784b26bf1a1af825"
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