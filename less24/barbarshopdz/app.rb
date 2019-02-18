#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

def read_file_data
	hh = { :stylists => {}, :clients => {}, :date_time => []}

	# read stylists file
	if File.file? './public/stylists.txt'
		hh_stylists = hh[ :stylists ]
		f = File.open './public/stylists.txt', 'r'
		while line = f.gets do
			line.strip!

			arr = line.split ','
			hh_stylists[ arr[0] ] = { :stylist_phone => arr[0], :stylist_name => arr[1] }
		end
		f.close
	end
	# read clients file
	if File.file? './public/clients.txt'
		hh_clients = hh[ :clients ]
		f = File.open './public/clients.txt', 'r'
		while line = f.gets do
			line.strip!

			arr = line.split ','
			hh_clients[ arr[0] ] = { :client_phone => arr[0], :client_name => arr[1] }
		end
		f.close
	end
	# read date_time file
	if File.file? './public/date-time.txt'
		hh_date_time = hh[ :date_time ]
		f = File.open './public/date-time.txt', 'r'
		while line = f.gets do
			line.strip!

			arr = line.split ','

			hh_date_time << { :client_phone => arr[0], :client_name => arr[1], :stylist_phone => arr[2], :stylist_name => arr[3], :date_time => arr[4] }
		end
		f.close
	end

	hh
end

def add_stylist hh_stylist
	hh = read_file_data

	unless hh[ :stylists ][ hh_stylist[ :stylist_phone ] ]
		f = File.open './public/stylists.txt', 'a'
		f.write "#{hh_stylist[ :stylist_phone ]},#{hh_stylist[ :stylist_name ]}\n"
		f.close

		return true
	end

	false
end

def add_client hh_client
	hh = read_file_data

	unless hh[ :clients ][ hh_client[ :client_phone ] ]
		f = File.open './public/clients.txt', 'a'
		f.write "#{hh_client[ :client_phone ]},#{hh_client[ :client_name ]}\n"
		f.close

		return true
	end

	false
end

def add_date_time hh_date_time
	f = File.open './public/date-time.txt', 'a'
	f.write "#{hh_date_time[ :client_phone ]},#{hh_date_time[ :client_name ]},#{hh_date_time[ :stylist_phone ]},#{hh_date_time[ :stylist_name ]},#{hh_date_time[ :date_time ]}\n"
	f.close
end

def validation_email params
	hh = {
		:email_name => 'Enter name',
		:email_text => 'Enter E-mail text',
		:email_password => 'Enter password'
	}

	hh.select {|k,v| params[k] == '' }.values.join ', '
end

get '/' do
	erb "!!Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a> #{request.path}"
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
# Чет пока не получается, ругается на аутентификацию
# по ходу Google не дает отправить почту, надо для таких вещей сделать публичный ящик


	@email_name = params[ :email_name ]
	@email_text = params[ :email_text ]
	@email_password = params[ :email_password ]

	@error = validation_email params
	unless @error == ''
		return erb :contacts
	end

	require 'pony'
	Pony.mail(
	  :to => 'dkoder.dvl@gmail.com',
	  :from => 'dkoder.dvl@gmail.com',
	  :subject => @email_name + " has contacted you",
	  :body => params[:email_text],
	  #:port => '587',
	  :via => :smtp,
	  :via_options => { 
	    :address              => 'smtp.gmail.com', 
	    :port                 => '587', 
	    :enable_starttls_auto => true, 
	    :user_name            => 'dkoder.dvl', 
	    :password             => @email_password, 
	    :authentication       => :plain, 
	    :domain               => 'localhost.localdomain'
	  })
	#redirect '/success' 

	erb :contacts
end

get '/about' do
	@error = 'error - something'
  erb :about
end

get '/visit' do
	@hh = read_file_data
	@is_message = false
  erb :visit
end

def validation_visit params
	#error = ''
	
	hh = {
		:client_name => 'Enter name',
		:client_phone => 'Enter phone',
		:date_time => 'Enter date time'
	}

	# hh.each do |k,v|
	# 	if params[k] == '' 
	# 		error += v 
	# 	end
	# end
	hh.select {|k,v| params[k] == '' }.values.join ', '

	#error
end

post '/visit' do
	@client_name = params[:client_name].strip
	@client_phone = params[:client_phone].strip
	@stylist = params[:stylist].strip
	@date_time = params[:date_time].strip
	@colorpicker = params[:colorpicker].strip

	@hh = read_file_data

	@error = validation_visit params
	unless @error == ''
	  return erb :visit
	end

	# search client	
	hh_client = @hh[ :clients ][  @client_phone ]

	if hh_client != nil && hh_client[ :client_name ] != @client_name
		@error = "This phone number: #{@client_phone} belongs another user"
	else	
		hh_stylist = @hh[ :stylists ][ @stylist.split(',')[1].split(':')[1].strip ]

		add_client		:client_name => @client_name,
									:client_phone => @client_phone
		add_date_time :client_name => @client_name,
		 							:client_phone => @client_phone, 
		 							:stylist_name => hh_stylist[ :stylist_name ], 
		 							:stylist_phone => hh_stylist[ :stylist_phone ], 
		 							:date_time=> @date_time

		@message = "Dear #{@client_name} we'll waiting for you at #{@date_time} to stylist #{hh_stylist[ :stylist_name ]}. You may contact phone: #{hh_stylist[ :stylist_phone ]}"
	end	

  erb :visit
end

get '/admin' do
	@hh = read_file_data

  erb :admin
end

post '/admin' do
	@hh = read_file_data

	@is_message = true
	if add_stylist params
		@hh = read_file_data
		@message = "New stylist added. Name: #{params[ :stylist_name ]}, phone: #{params[ :stylist_phone ]}"
	else
		@message = "OOOPs!!! A stylist with this phone number #{params[ :stylist_phone ]} is already there. This is #{@hh[ :stylists ][ params[ :stylist_phone ] ][:stylist_name] }."
	end

  erb :admin
end

