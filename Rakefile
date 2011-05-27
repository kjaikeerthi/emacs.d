require 'rake'
ROOT = File.expand_path(File.dirname(__FILE__))

task :initialize do
  # begin
    puts File.directory?("#{ROOT}/el-get")
    if not File.directory?("#{ROOT}/el-get")
      Dir.mkdir("#{ROOT}/el-get")
      Dir.chdir("#{ROOT}/el-get")
      exec "git clone git://github.com/dimitri/el-get.git"
      puts "elpa installed successfully"
    end
  # rescue => e
  #   puts e
  #   puts "Try deleting the profile"
  # end
end
