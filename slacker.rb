class Slacker < Formula
  version = "0.1.2.4"
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/homebrew-slacker"
  url "https://github.com/Cj-bc/homebrew-slacker/archive/v" + version + ".tar.gz"
  sha256 "4ebc59cf0cd9208bbca3f484b5fda51210495eb174dfb7c9bcc032bf80123283"
  head "https://github.com/Cj-bc/homebrew-slacker.git"

  depends_on "awk"
  depends_on "python"

 def install 
	  ohai "Renaming executable..."
	  system "mv " "slacker.sh " "slacker" # Rename
	  bin.install "slacker" # Install slacker
	  prefix.install Dir["func"], Dir["texts"], ".sourcefiles" # Install all texts and functions
 end

  test do
    system "slacker"
  end
end
