env=""
open ARGV[0] do |f|
	f.readlines.each do |line| 
		env=line
	end
end

rules, mode, inject, stock
rules-config-path...

il faudra copier / renommer les fichiers

filename="/e8/webbu#{env}/rules"
puts filename

filename="i:/liens/e8/webbu#{env}/rules/"
puts filename

Dir.foreach(filename) do |f|
	puts "file : #{f}" if (!File.directory?(f)) 
end