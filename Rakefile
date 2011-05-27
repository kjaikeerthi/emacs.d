require 'rake'
ROOT = File.expand_path(File.dirname(__FILE__)
)

desc "Download el-get package"
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

task :default => [:elget]
