# lesson 18
# 

require 'net/http'
require 'uri'

def is_wrong_password? login, password
  uri = URI.parse 'http://rubyschool.us/book/'
  response = Net::HTTP.post_form uri, :login => login, :password => password
  
  response.body.include? 'denied'
end

puts is_wrong_password? '123123'


