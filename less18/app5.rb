# lesson 18
# 

require 'net/http'
require 'uri'

#response = Net::HTTP.get 'rubyschool.us', '/'

uri = URI.parse 'http://rubyschool.us/book/'
#response = Net::HTTP.get uri

response = Net::HTTP.post_form uri, :login => 'aaa', :password => 'bbb'

puts response.body
