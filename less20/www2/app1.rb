# lesson 20
#

require 'sinatra'


#__________________________________
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
get '/' do 
  erb :index
end

get '/contacts' do
  @title = 'Contacts:'
  @message = 'Phone number: 1112222'
  erb :message
end

get '/faq' do
  @title = 'FAQ:'
  @message = 'Q: question A: answer'
  erb :message
end

get '/somthing' do
  @title = 'Somthing:'
  @message = 'Fignya'
  erb :message
end




post '/' do

  @lgn_s = params[ :lgn ]
  @pswrd_s = params[ :pswrd ]
  
  if @lgn_s == 'admin' && @pswrd_s == 'secret'
    erb :welcome
  else
    @message_denied = 'Access denied'
    erb :index
  end
  
end 

#__________________________________
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
get '/contacts' do 
  
  'Phone: 111222'
  
end


