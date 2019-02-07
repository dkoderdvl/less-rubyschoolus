# lesson 12
# 

hh = {
  '100'=>2,
  '111'=>10,
  '222'=>20,
  '333'=>30,
  '444'=>40,
  '555'=>50,
  '666'=>-60,
  '777'=>1_000_000,
  '888'=>80,
  '999'=>90
}

balance = 100

loop do
  
  print 'press Enter: '
  gets
  
  n = rand(100..999).to_s
  
  #puts n
  
  #if hh.has_key? n
  if hh[n]
    
    balance += hh[n]
    
    puts "Your balance increased by #{hh[n]}$. Your balance = #{balance}"
    
  else
    
    balance -= 5
    
    puts "Your balance decreased by 5$. Your balance = #{balance}"
    
  end
  
  if balance <= 0
    
    puts 'you have no more money'
    break
    
  end
  
  
end
