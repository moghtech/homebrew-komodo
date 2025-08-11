class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/moghtech/homebrew-komodo/releases/download/v1.19.0-dev-9/km.tar.gz"
  sha256 "f9ea0c622b5c3734e89245212ff75c3b81eedabedd2d1b09156d900f5c8f1286"
  license "GPL-V3.0"

  def install
    bin.install "km"
  end

  test do
    # Test the installation
    system "#{bin}/km", "--version"
  end
end