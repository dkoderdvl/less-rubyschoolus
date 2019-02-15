# lesson 18
# 

require 'net/http'
require 'uri'

def is_wrong_password? username, password
  uri = URI.parse 'http://localhost:4567/login'
  response = Net::HTTP.post_form uri, :username => username, :password => password
  
  response.body.include? 'denied'
end

puts is_wrong_password? 'admin','123123'


