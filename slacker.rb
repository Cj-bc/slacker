class Slacker < Formula
  version = "0.1.1"
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/slacker"
  url "https://github.com/Cj-bc/slacker/archive/v" + version + ".tar.gz"
  sha256 "56535901d6f80cb4d9a774cf78af4585869268e2a9a3a097be838b8e85b99c12"
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
