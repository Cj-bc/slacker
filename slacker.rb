class Slacker < Formula
  version = "0.1.1.6"
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/slacker"
  url "https://github.com/Cj-bc/slacker/archive/v" + version + ".tar.gz"
  sha256 "1da848f5f5195992f8b973e1600b9eee8d056da867fe90be66c42a10a9cc91e1"
  head "https://github.com/Cj-bc/slacker.git"

  depends_on "awk"
  depends_on :python

  def install 
    system "mv","slacker.sh","slacker"
    bin.install "slacker"
    system "mv","func","texts",".sourcefiles",".slackerconf","/usr/local/Cellar/slacker/" + version
  end

  test do
    system "false"
  end

end
