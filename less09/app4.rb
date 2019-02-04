# урок 9
# методы. возвращаемое значение

@a = 1

def get_1_1
  
  get_1 + get_1
  
end   


def get_1
  
  1
  
end



def get_password
  
  @a = 3
  
  print "Type password: "
  gets.strip
  
end


xx = get_password

puts "Был введен пароль: #{xx}"

puts "Переменная a = #{@a}"


puts get_1_1
