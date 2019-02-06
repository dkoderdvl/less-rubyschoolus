# Урок 10
# рофакторинг app6.rb

def add_item
  
  print "Введите имя? "
  name = gets.strip.capitalize
  
  if name == ""
    
    return false
    
  end
  
  print "Введите возраст? "
  age = gets.to_i

  #~ arr_u = []
  #~ arr_u << name
  #~ arr_u << age
  #~ arr_u
  
  [name, age]
  
end

def display_items arr
  
  if arr.empty?
    
    puts "В списке никого нет"
    
  else
    
    puts "Список учеников:"
    arr.each_index do |i|
      
      puts "#{i+1}. #{arr[i][0]}, #{arr[i][1]}"
      
    end
    
  end
  
end

def remove_item arr
  
  #display_items arr
  
  print "Введите номер позиции для удаления: "
  n_del = gets.to_i
  
  if n_del >= 1 && n_del < arr.size
    
    print "Вы точно хотите удалить #{n_del}. #{arr[n_del - 1]} (Y/N))?"
    yes_no = gets.strip.upcase
    
    if yes_no == "Y"
      
      arr.delete_at n_del - 1
      
      return true
       
    end
    
  else
    
    puts "Введен не правильный номер элемента"
    
  end
  
  false
  
end

arr = []

loop do
  
  print "Введите команду (add, print, remove, exit)):"
  command = gets.strip.upcase
  
  if command == "ADD"
    
    item = add_item
    
    unless item == false
      
      arr << item
      
    end
    
  elsif command == "PRINT"
    
    display_items arr
    
  elsif command == "REMOVE"
    
    remove_item arr
    
  elsif command == "EXIT"
    
    exit
    
  end
  
end
