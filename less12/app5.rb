# less 12
# 

def print_details detail
  
  #puts detail
  
  # need to write like that
  puts detail[ :name ] if detail[ :name ]
  puts detail[ :age ] if detail[ :age ]
  puts detail[ :address ] if detail[ :address ]
  puts detail[ :phone ] if detail[ :phone ]
  
end

hh = { :name => 'Mike', :age => 42, :address => '123 West Street' }

print_details hh
