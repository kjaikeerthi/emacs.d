require 'rake'
ROOT = File.expand_path(File.dirname(__FILE__)
)

task :default => [:elget,:jabber]

desc "Download and install el-get package"
task :elget do
  begin
    if not File.directory?("#{ROOT}/el-get")
      Dir.mkdir("#{ROOT}/el-get")
      Dir.chdir("#{ROOT}/el-get")
      exec "git clone git://github.com/dimitri/el-get.git"
      puts "Emacs Lisp Package Archive, installed successfully"
    end
  rescue => e
    puts e
    puts "Try deleting the profile"
  end
end

desc "Download and install jabber package"
task :jabber do
  begin 
    if not File.directory?("#{ROOT}/el-get/emacs-jabber")
      Dir.chdir("#{ROOT}/el-get")
      exec "git clone git://catap.ru/emacs-jabber/emacs-jabber.git"
      Dir.chdir("#{ROOT}/el-get/emacs-jabber")
      exec "su"
      exec "autoreconf -i && ./configure && make clean && make && sudo make install"
      puts "installed jabber client"
    end
  rescue => e
    puts e
    puts "Try deleting the profile"
  end
end
