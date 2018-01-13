class Slacker < Formula
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/slacker"
  url "https://github.com/Cj-bc/slacker/archive/v0.1.tar.gz"
  version 0.1
  sha256 "8e6081a851df2fbda8f4d7feb0ee4cd3855da7d8c81c9769948ae7633c6aefb6"
  head "https://github.com/Cj-bc/slacker.git"

  depends_on "awk"
  depends_on :python

  def install
    bin.install "../slacker"
  end

  test do
    system "false"
  end
end
