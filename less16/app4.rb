# laesson 16
# 

def run_5_times
  
  x = 0
  
  5.times do 
    
    x += 2
    
    yield x
    
  end
  
end

run_5_times { |i| puts "Something #{i}"}
