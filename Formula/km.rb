class Km < Formula
  desc "Cli to interact with Komodo Core"
  homepage "https://komo.do"
  url "https://github.com/moghtech/homebrew-komodo/releases/download/v1.19.5/km.tar.gz"
  sha256 "39f6f5f40a06d5ce68b0f7f5a217b3feaafb45dc790842c7e9869de2e65d7a74"
  license "GPL-V3.0"

  def install
    bin.install "km"
  end

  test do
    # Test the installation
    system "#{bin}/km", "--version"
  end
end