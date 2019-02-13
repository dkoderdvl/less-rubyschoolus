require 'sinatra'

@hh_users = {}
@hh_date_time = []

def read_data
  return unless File.exists? './public/users.txt'

  f = File.open './public/users.txt', 'r'
  while line = f.gets do
    line.strip!
    arr = line.split ','
    @hh_users[ arr[0] ] = { :user_name => arr[1], :user_phone => arr[0] }
  end
  f.close

  return unless File.exists? './public/date-time-user.txt'

  f = File.open './public/date-time-user.txt'
  while line = f.gets do
    line.strip!
    arr = line.split ','
    @hh_date_time << { :user_name => @hh_users[arr[0]][:user_name], :user_phone => arr[0], :date_time => arr[1] }
  end
  f.close
end

get'/' do
  erb :index
end

get '/admin' do
  @hh_users = {}
  @hh_date_time = []

  read_data

  puts @hh_date_time

  @title = 'Welcom to admin side'
  @message = 'list:'

  @hh_date_time.each do |v|
    @message += "<p>Name: #{v[:user_name]}, phone: #{v[:user_phone]}, date time #{v[:date_time]}</p>"
  end

  erb :message
end

post '/' do
  @hh_users = {}
  @hh_date_time = []

  @user_name = params[:user_name].strip
  @user_phone = params[:user_phone].strip
  @date_time = params[:date_time].strip

  read_data

  if @hh_users[ @user_phone ] && @hh_users[ @user_phone ][:user_name] != @user_name
    @title = 'OOOPS!'
    @message = "This phone number: #{@user_phone} belongs another user"
  else
    if @hh_users[@user_phone] == nil
      f = File.open './public/users.txt','a'
      f.write "#{@user_phone},#{@user_name}\n"
      f.close
      @hh_users[@user_phone] = { :user_phone => @user_phone, :user_name => @user_name }
    end

    f = File.open './public/date-time-user.txt','a'
    f.write "#{@user_phone},#{@date_time}\n"
    f.close
    @hh_date_time << { :user_name => @user_name, :user_phone => @user_phone, :date_time => @date_time }

    @title = 'Thank you'
    @message = "Dear #{@user_name} we'll waiting for you at #{@date_time}"
  end

end
