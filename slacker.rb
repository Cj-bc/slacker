class Slacker < Formula
  version = "0.1.2.6"
  desc "Allows to send slack messages from terminal"
  homepage "https://github.com/Cj-bc/homebrew-slacker"
  url "https://github.com/Cj-bc/homebrew-slacker/archive/v" + version + ".tar.gz"
  sha256 "fde2b38c97fe126ae6baee888160dd3b752ef8ae8bdcf623c7ac512d209025ac"
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
