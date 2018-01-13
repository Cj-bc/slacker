class Slacker < Formula
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/slacker"
  url "https://github.com/Cj-bc/slacker/archive/v0.1.tar.gz"
  sha256 "493c683efeddfc730945d874924066320fdd70b5eca6b7016d544ec6dceb2d12"
  head "https://github.com/Cj-bc/slacker.git"

  depends_on "awk"
  depends_on :python

    system "mv","slacker.sh","slacker"
    bin.install "slacker"
    system "mv","func","texts",".sourcefiles",".slackerconf","/usr/local/Cellar/slacker/0.1/"
  end

  test do
    system "false"
  end
end
