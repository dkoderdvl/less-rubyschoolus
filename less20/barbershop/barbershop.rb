# lesson 20
# программа очереди записи в парихмахерскую
require 'sinatra'

#тут нужно загрузить данные из файла в hash

get '/' do
  erb :index
end

get '/admin' do
  @title = 'List of users:'
  #@message = File.read 'user-date-time.txt'
  f = File.open('user-date-time.txt', "r")
  @message = ''
  while line = f.gets
    line.strip!
    arr = line.split ','
    @message += "<p>Name: #{arr[1]}, phone: #{arr[0]}, date_time: #{arr[2]}"
  end
  f.close

  erb :message
end

post '/' do
  @hh = {}
  
  
  f = File.open('user-date-time.txt', "r")
  while line = f.gets
    line.strip!
    arr = line.split ','
    @hh[arr[0]] = { :user_name => arr[1], :user_phone => arr[0], :date_time => arr[2]}
  end
  f.close
  
  @user_name = params[:user_name].strip
  @user_phone = params[:user_phone].strip
  @date_time = params[:date_time].strip
  
  if @hh[@user_phone] && @hh[@user_phone][:user_name] != @user_name
    @title = 'OOOPS'
    @message = "This phone number: #{@user_phone} have other user: #{@hh[@user_phone][:user_name]}"
  else  
    @title = 'Thank you'
    @message = "Dear #{@user_name} we`ll be waiting for you at #{@date_time}"

    f = File.open('user-date-time.txt', "a")
    f.write "#{@user_phone},#{@user_name},#{@date_time}\n"
    f.close
  end
  
  #~ @title = 'Thank you'
  #~ @message = "Dear #{@user_name} we`ll be waiting for you at #{@date_time}"
  erb :message

  
  
end
