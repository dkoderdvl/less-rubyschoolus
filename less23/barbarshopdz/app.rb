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

puts hh_date_time

			hh_date_time << { :client_phone => arr[0], :client_name => arr[1], :stylist_phone => arr[2], :stylist_name => arr[3], :date_time => arr[4] }
		end
		f.close
	end

	#puts hh

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

get '/' do
	erb "!!Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a> #{request.path}"
end

get '/contacts' do
  erb :contacts
end

get '/about' do
  erb :about
end

get '/visit' do
	@hh = read_file_data
	@is_message = false
  erb :visit
end

post '/visit' do
	@hh = read_file_data
	@is_message = true

	# search client	
	hh_client = @hh[ :clients ][  params[ :client_phone ].strip ]

	if hh_client != nil && hh_client[ :client_name ] != params[ :client_name ]
		@message = "This phone number: #{params[ :client_phone ].strip} belongs another user"
	else	
		hh_stylist = @hh[ :stylists ][ params[ :stylist ].strip.split(',')[1].split(':')[1].strip ]

		add_client		:client_name => params[ :client_name ].strip, :client_phone => params[ :client_phone ].strip
		add_date_time :client_name => params[ :client_name ].strip,
		 							:client_phone => params[ :client_phone ].strip, 
		 							:stylist_name => hh_stylist[ :stylist_name ], 
		 							:stylist_phone => hh_stylist[ :stylist_phone ], 
		 							:date_time=> params[ :date_time ].strip

		@message = "Dear #{params[ :client_name ].strip} we'll waiting for you at #{params[ :date_time ].strip} to stylist #{hh_stylist[ :stylist_name ]}. You may contact phone: #{hh_stylist[ :stylist_phone ]}"
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

