require 'rake'
require 'erb'

task :default => [:install, :vundle]

$replace_all=false
desc "install the dot files into user's home directory"
task :install do
  process_dir('.')
end

def process_dir(d, top=true)
  Dir.open(d).each do |file|
    next if top and %w[Rakefile README].include? file
    next if file.match(/^\./)
    file = top ? file : File.join(d, file)
    if file == 'config'
      process_dir(file, false)
      next
    end
    name = ".#{file.sub('erb', '')}" 
    fname = File.join(ENV['HOME'], name)
    notbin = file != 'bin'
    if File.exist?(fname)
      if File.identical? file, fname 
        puts "identical ~/#{name}"
      elsif $replace_all
        replace_file(file, notbin)
      else
        print "overwrite ~/#{name}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          $replace_all = true
          replace_file(file, notbin)
        when 'y'
          replace_file(file, notbin)
        when 'q'
          exit
        else
          puts "skipping ~/#{name}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file, hidden=true)
  fname = (hidden ? "." : "") + "#{file.sub('erb', '')}" 
  system %Q{rm -rf "$HOME/#{fname}"}
  link_file(file)
end

def link_file(file, hidden=true)
  fname = (hidden ? "." : "") + "#{file.sub('erb', '')}" 
  if file =~ /.erb$/
    puts "generating ~/#{fname}"
    File.open(File.join(ENV['HOME'], fname), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/#{fname}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/#{fname}"}
  end
end

task :command_t do
  puts "Compiling Command-T plugin..."
  Dir.chdir "vim/bundle/Command-T/ruby/command-t" do
    # first try to read which ruby version is vim compiled against
    read_version = %{require "rbconfig"; print File.join(RbConfig::CONFIG["bindir"], RbConfig::CONFIG["ruby_install_name"])}
    ruby = `vim --cmd 'ruby #{read_version}' --cmd 'q' 2>&1 >/dev/null | grep -v 'Vim: Warning'`.strip
    # fall back to system rubies
    ruby = %w[/usr/bin/ruby1.8 /usr/bin/ruby].find {|rb| File.executable? rb } || 'ruby' if ruby.empty?
    cmd = Array(ruby) + %w[extconf.rb]
    sh(*cmd)
    sh "make clean && make"
  end
end

desc "Clone vim/bundle/vundle"
task :vundle do
  unless File.exist?('vim/bundle/vundle')
  puts "Cloning vim/bundle/vundle"
  system "git clone https://github.com/gmarik/vundle.git vim/bundle/vundle"
  end
end

desc "Update plugins"
task :update do
  puts "Update plugins"
  Dir['vim/bundle/*'].select{|file| File.ftype(file)=='directory'}.each do |dir|
    puts "Updating #{dir}..."
    system "cd #{dir};git pull;cd ../../.."
  end 
end
