input_root_directory = "/e8/imemento"
input_root_directory_alternate = "/s/imemento"
input_root_directory_alternate2 = "s:/imemento"
output_root_directory = "/u/ext-pdonzel/dd/imemento"

# actualisation

memento_list = "MVI MF MC MAS MCPA MCC MDC MSC MS"

# la structure est de créer ces répertoires en minuscule

# le programme doit copier les Tcb et les Tcb accumulatives

# le résultat est la Tcb, la Tcb de référence, et plus le zip dans le répertoire Gen fichiers qui est un zip de zip 

puts "Test de l'existence de #{input_root_directory}"
puts Dir.exists?(input_root_directory)

puts "Test de l'existence de #{input_root_directory_alternate}"
puts Dir.exists?(input_root_directory_alternate)

puts "Test de l'existence de #{input_root_directory_alternate2}"
puts Dir.exists?(input_root_directory_alternate2)