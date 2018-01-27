class Slacker < Formula
  version = "0.1.2.4"
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/homebrew-slacker"
  url "https://github.com/Cj-bc/homebrew-slacker/archive/v" + version + ".tar.gz"
  sha256 "ad9b8136ad59b05a806334a3333a72d4276de90186fa23e73e30c0828cf1f3ce"
  head "https://github.com/Cj-bc/homebrew-slacker.git"

  depends_on "awk"
  depends_on "python"

 def install 
	  ohai "Renaming executable..."
	  system "mv " "slacker.sh " "slacker" # Rename
	  bin.install "slacker" # Install slacker
	  prefix.install Dir[func]
	  prefix.install Dir[texts] # Install all texts and functions
 end

  test do
    system "slacker"
  end
end
