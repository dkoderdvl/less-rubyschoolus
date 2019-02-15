#puts Dir.children Dir.pwd

#puts Dir.glob 'searche-file.rb'
folder = Dir.pwd
f = File.open Dir.glob("#{folder}/**/barbarshop.rb")[0]

while line = f.gets
  line.strip!
  puts line
end
