# lesson 19
#

require 'sinatra'

#__________________________________
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
get '/' do 
  
  erb :index
  
end 

post '/' do

  @lgn_s = params[ :lgn ]
  @pswrd_s = params[ :pswrd ]
  
  if @lgn_s == 'admin' && @pswrd_s == 'secret'
    erb :welcome
  else
    erb :index
  end
  
end 

#__________________________________
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
get '/contacts' do 
  
  'Phone: 111222'
  
end


