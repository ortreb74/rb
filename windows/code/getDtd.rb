#Dir.foreach("c:/data/sgm")do |fileName|
#	puts fileName
#end

require 'set'
require 'fileutils'

# il y a le problème sur newcode

map = {
"alphamem"=>"alphamemV2",
"analyse"=>"analyse",
"baf"=>"brdaV4",
"bcf"=>"bcfV4",
"bcfnew"=>"bcfV4",
"bofip"=>"bofip",
"bpat"=>"brdaV4",
"bpim"=>"brdaV4",
"brda"=>"brdaV4",
"bull"=>"bullV2",
"codesc"=>"codescV2",
"dynamem"=>"dynamemV3",
"dynaprat"=>"efl.fr.dynaprat",
"dynaprice"=>"dynaprice",
"forms"=>"forms",
"fr"=>"frV3",
"indic"=>"brdaV4",
"jps"=>"jps",
"newcode"=>"newcode",
"normecncc"=>"normecncc",
"question"=>"question",
"recmaj"=>"recmaj",
"rj"=>"rj",
"sn"=>"sn",
"superfbv"=>"superfbvV3",
"talpha"=>"talpha",
"tfr"=>"tfrV2",
"themety"=>"themety",
"tmetho"=>"tmetho"
}

setFirstWord = Set.new()
setSecondWord  = Set.new()
setThirdWord = Set.new()
setDtd = Set.new()

listOfFiles = Dir["c:/data/sgm/*.sgm"]

i = 0

script = File.open("c:/w/script","w")
setDtd.each { |word| file.puts word }

listOfFiles.each do |fileName|
	i = i + 1
	puts i if i % 1000 == 0
	File.open(fileName) do |file|
		buffer=file.read(80)
		
		words = buffer.split(" ")
		
		setFirstWord << words[0]
		setSecondWord << words[1]
		setThirdWord << words[2]
		
		dtd = words[3].split('"')[1]
		dtd = dtd.split(".")[0]
		
		setDtd << dtd		
		file.close
		
		if map.key?(dtd)		
			dirToCreate = "c:/data/sgm/" + dtd			
			FileUtils.cp(fileName, dirToCreate)
			Dir.mkdir(dirToCreate) if !Dir.exists?(dirToCreate)		
			script.puts "makehtm-dev #{fileName.sub!("c:/data/sgm/","/e8/webbu/uaur/sgm/")} #{map[dtd]}"
		end		
		
	end	
	
end


puts "Nombre de fichiers : #{listOfFiles.size}"
puts "Premier mot : #{setFirstWord.size} "
setFirstWord.each { |firstWord| puts firstWord }
puts "Deuxième mot : #{setSecondWord.size} "
setSecondWord.each { |word| puts word }
puts "Troisième mot : #{setThirdWord.size} "
setThirdWord.each { |word| puts word }
puts "dtd : #{setDtd.size} "
setDtd.each { |word| puts word }
file = File.open("c:/w/dtd.txt","w")
setDtd.each { |word| file.puts word }
file.close

script.close