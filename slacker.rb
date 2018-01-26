require 'fileutils' # for fileutils.mv


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

	dest = "%x(brew --prefix)/Cellar/slacker/#{version}"	 # for mv libs/confs
	system "mv","slacker.sh","slacker" # rename
	bin.install "slacker" # make link
	mkdir("#{dest}") unless File.exist?("#{dest}")	# make dir of this version
	mv(['func/','texts/'],"#{dest}")
	system "mv",".sourcefiles","texts/templates/.slackerconf","#{dest}"
	  #    FileUtils.mv(origin_file,target_file)
	  #    FileUtils.cp_r([origin_file1,origin_file2],target_directory)
	# homebrew_prefix = "#{HOMEBREW_PREFIX}" # Get $HOMEBREW_PREFIX
	# mv('slacker.sh','slacker') # rename slacker.sh
	# bin.install "slacker"	# install slacker
	# mkdir_p("#{homebrew_prefix}/Cellar/slacker/#{version}/")
	# cp_r(['func/','texts/'],"#{homebrew_prefix}/Cellar/slacker/#{version}/")
	# cp_r(['.sourcefiles','.slackerconf'],"#{homebrew_prefix}/Cellar/slacker/") unless File.file?("#{homebrew_prefix}/.slackerconf")
  end

  test do
    system "/bin/bash slacker"
  end
end
