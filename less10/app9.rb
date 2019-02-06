# Урок 10
# Камень - ножницы - бумага
# rock - scissors - paper
# лучше использовать computer_choice и user_choice


def get_random_value
  
  [:rock, :scissors, :paper][rand(0..2)]
  
end

print "Enter you name: "
user_name = gets.strip.capitalize

puts "Hi #{user_name}. Let's game [r]ock - [s]cissors - [p]aper or e[x]it"

loop  do
  
  print "Enter you variant: "
  user_choice_s = gets.strip.upcase
  
  if user_choice_s == "ROCK" || user_choice_s == "R"
    
    user_choice = :rock
    
  elsif user_choice_s == "SCISSORS" || user_choice_s == "S"
    
    user_choice = :scissors
    
  elsif user_choice_s == "PAPER" || user_choice_s == "P"
    
    user_choice = :paper
    
  elsif user_choice_s == "EXIT" || user_choice_s == "X"
    
    exit
    
  else
    
    next
    
  end
  
  computer_choice = get_random_value
  
  puts "#{user_name} - #{user_choice} || computer - #{computer_choice}"
  
  matrix_user_win = [
    [:rock, :scissors],
    [:scissors, :paper],
    [:paper,:rock],
  ]
  
  if matrix_user_win.include?([user_choice, computer_choice])
    
    puts "#{user_name} - you are win"
    
  elsif user_choice == computer_choice
    
    puts "#{user_name} = computer. DRAW"
    
  else
    
    puts "compute is win"
    
  end




  
  #~ if var == :rock && valrnd == :scissors || var == :scissors && valrnd == :paper || var == :paper && valrnd == :rock
    
    #~ puts "#{user_name} - you are win"
    
  #~ elsif var == valrnd
    
    #~ puts "#{user_name} = computer. DRAW"
    
  #~ else
    
    #~ puts "compute is win"
    
  #~ end
    
  #~ puts var.object_id
  #~ puts :rock.object_id
  #~ puts :scissors.object_id
  #~ puts :paper.object_id
  
end

