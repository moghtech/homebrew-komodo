class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/moghtech/homebrew-komodo/releases/download/v1.19.3/km.tar.gz"
  sha256 "aad83d86ce2a11d8e17720fcd1047f35067adf6e9bf4bdbace3f7c49031ec5ab"
  license "GPL-V3.0"

  def install
    bin.install "km"
  end

  test do
    # Test the installation
    system "#{bin}/km", "--version"
  end
end