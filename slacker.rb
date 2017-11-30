class Slacker < Formula
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/slacker"
  url "https://github.com/Cj-bc/slacker/archive/latest.tar.gz"
  sha256 "c8e0e14f377637d4441095b9a14fc613ffaad03958b3feb2ffe0545ee1aba304"
  head "https://github.com/Cj-bc/slacker.git"

  def install
    bin.install "slacker.sh"
  end

  test do
    system "false"
  end
end
