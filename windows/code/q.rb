# I est associé à \\adsamba03\ext-pdonzel
# WshNetWork.MapNetworkDrive "I:", "\\adsamba03\ext-pdonzel"

date_modification=File.stat("i:/bas/Q").atime
date_limit=Time.now-3600*24

date=[date_modification,date_limit].min
archive_directory="i:/bas/" + date.strftime('%Y%m%d') 

abort("Le répertoire #{archive_directory} existe déjà") if Dir.exists?(archive_directory)

file=File.open($root="i:/spa/yesterday" ,"w")
file.puts archive_directory
file.close

puts "date : #{date}"
puts "archive_directory : #{archive_directory}"

# sans compréhension la syntaxe de mkdir nécéssite des \ et pas des /
# je double les \ parce que c'est le caractère d'échappement
command_line="mv i:/bas/Q #{archive_directory} && mkdir i:\\bas\\Q"

puts command_line
system (command_line)

sdate=date.strftime('%Y%m%d') 
command_line="nohup svn ls -R svn+ssh://svn02/repositories/dev/projets > i:/svnls/svn-projets-#{sdate}.txt &"
puts command_line
system (command_line)