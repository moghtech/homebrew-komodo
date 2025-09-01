class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/moghtech/homebrew-komodo/releases/download/v1.19.2/km.tar.gz"
  sha256 "4b76dce9f3a9639e9e7910fbcb838850a0ca27eb4de6e9dc7816836ea649ecdc"
  license "GPL-V3.0"

  def install
    bin.install "km"
  end

  test do
    # Test the installation
    system "#{bin}/km", "--version"
  end
end