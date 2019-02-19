#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def exists_db?
	File.file? 'barbarshop.sqlite'
end

def creat_db
	#db = SQLite3::DataBase.new './public/barbarshop.sqlite'
	db = SQLite3::Database.new 'barbarshop.sqlite'

	db.execute "CREATE TABLE stylists (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT UNIQUE)"
	db.execute "CREATE TABLE clients (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phone TEXT UNIQUE)"
	db.execute "CREATE TABLE visits (id INTEGER PRIMARY KEY AUTOINCREMENT, id_client INTEGER, id_stylist INTEGER, date_time TEXT, colorpicker TEXT)"

	db.execute "INSERT INTO stylists (name, phone) VALUES('Jon','111')"
	db.execute "INSERT INTO stylists (name, phone) VALUES('Kolyan','222')"
	db.execute "INSERT INTO stylists (name, phone) VALUES('Eva','333')"

	db.execute "INSERT INTO clients (name, phone) VALUES('zJon','122')"
	db.execute "INSERT INTO clients (name, phone) VALUES('Jessieca','133')"

	db.execute "INSERT INTO visits (id_client, id_stylist, date_time, colorpicker) VALUES(1,1,'20.30','#fbd75b')"
	db.execute "INSERT INTO visits (id_client, id_stylist, date_time, colorpicker) VALUES(1,2,'23.00','#dc2127')"
	db.execute "INSERT INTO visits (id_client, id_stylist, date_time, colorpicker) VALUES(2,3,'10.30','#5484ed')"

	db.close
end

def read_db_stylists
	hh_stylists = {}
	db = SQLite3::Database.new 'barbarshop.sqlite'
	db.results_as_hash = true
	db.execute "SELECT * FROM stylists" do |v|
		hh_stylists[ v['phone'] ] = { :stylist_phone => v['phone'], :stylist_name => v['name'], :stylist_id => v['id'] }
	end
	db.close

	hh_stylists
end

def read_db_clients
	hh_clients = {}

	db = SQLite3::Database.new 'barbarshop.sqlite'
	db.results_as_hash = true
	db.execute "SELECT * FROM clients" do |v|
		hh_clients[ v['phone'] ] = { :client_phone => v['phone'], :client_name => v['name'], :client_id => v['id'] }
	end
	db.close

	hh_clients
end

def read_db_datetime
	arr_date_time = []

	db = SQLite3::Database.new 'barbarshop.sqlite'
	db.results_as_hash = true
	db.execute "SELECT date_time as dt, colorpicker, clients.id as client_id, clients.name as client_name, clients.phone as client_phone, stylists.id as stylist_id, stylists.name as stylist_name, stylists.phone as stylist_phone FROM visits LEFT JOIN clients ON visits.id_client = clients.id LEFT JOIN stylists ON visits.id_stylist = stylists.id" do |v|
		#hh_date_time[ v['phone'] ] = { :stylist_phone => v['phone'], :stylist_name => v['name'], :stylists_id => v['id'] }
		arr_date_time << { :client_id => v['client_id'],
											:client_phone => v['client_phone'],
											:client_name => v['client_name'],
											:stylist_id => v['stylist_id'],
											:stylist_phone => v['stylist_phone'],
											:stylist_name => v['stylist_name'],
											:colorpicker => v['colorpicker'],
											:date_time => v['dt'] }
	end
	db.close

	arr_date_time
end

def read_db_data
	{ :stylists => read_db_stylists, :clients => read_db_clients, :date_time => read_db_datetime }
end

def is_stylist_by_phone? stylist_phone
	db = SQLite3::Database.new 'barbarshop.sqlite'
	db.results_as_hash = true
	raws_size = db.execute("SELECT id FROM stylists WHERE phone = '#{stylist_phone}'").size
	db.close

	raws_size == 1
end

def add_stylist hh_stylist
	unless is_stylist_by_phone? hh_stylist[ :stylist_phone ]
		db = SQLite3::Database.new 'barbarshop.sqlite'
		db.results_as_hash = true
		db.execute "INSERT INTO stylists (name, phone) VALUES(?,?)", [hh_stylist[ :stylist_name ],hh_stylist[ :stylist_phone ]]
		db.close

		return true
	end

	false
end

def is_client_by_phone? client_phone
	db = SQLite3::Database.new 'barbarshop.sqlite'
	db.results_as_hash = true
	raws_size = db.execute("SELECT id FROM clients WHERE phone = '#{client_phone}'").size
	db.close

	raws_size == 1
end

def add_client hh_client
	# TODO нужна проверка на клиента с таким телефоном
	db = SQLite3::Database.new 'barbarshop.sqlite'
	db.results_as_hash = true

	if db.execute("SELECT id FROM clients WHERE phone = '#{hh_client[ :client_phone ]}'").size == 0
		db.execute "INSERT INTO clients (name, phone) VALUES(?,?)", [ hh_client[ :client_name ], hh_client[ :client_phone ] ]
	end	

	client_id = db.execute("SELECT id FROM clients WHERE phone = '#{hh_client[ :client_phone ]}'")[0]['id']

	db.close

	client_id
end

def add_date_time hh_date_time
	db = SQLite3::Database.new 'barbarshop.sqlite'
	db.results_as_hash = true
	db.execute "INSERT INTO visits (id_client, id_stylist, date_time, colorpicker) VALUES(?,?,?,?)", [ hh_date_time[ :client_id ], hh_date_time[ :stylist_id ], hh_date_time[ :date_time ], hh_date_time[ :colorpicker ] ]
	db.close
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
	@hh = read_db_data
	@is_message = false
  erb :visit
end

def validation_visit params
	hh = {
		:client_name => 'Enter name',
		:client_phone => 'Enter phone',
		:date_time => 'Enter date time'
	}

	hh.select {|k,v| params[k] == '' }.values.join ', '
end

post '/visit' do
	@client_name = params[:client_name].strip
	@client_phone = params[:client_phone].strip
	@stylist = params[:stylist].strip
	@date_time = params[:date_time].strip
	@colorpicker = params[:colorpicker].strip

	@hh = read_db_data

	@error = validation_visit params
	unless @error == ''
	  return erb :visit
	end

	# search client	
	hh_client = @hh[ :clients ][  @client_phone ]

	if hh_client != nil && hh_client[ :client_name ] != @client_name
		p hh_client
		@error = "This phone number: #{@client_phone} belongs another user"
	else	
		hh_stylist = @hh[ :stylists ][ @stylist.split(',')[1].split(':')[1].strip ]

		client_id = add_client :client_name => @client_name,
									:client_phone => @client_phone

		add_date_time :client_id => client_id,
		 							:client_name => @client_name, 
		 							:client_phone => @client_phone, 
		 							:stylist_id => hh_stylist[ :stylist_id ], 
		 							:stylist_name => hh_stylist[ :stylist_name ], 
		 							:stylist_phone => hh_stylist[ :stylist_phone ], 
		 							:date_time=> @date_time,
		 							:colorpicker=> @colorpicker

		@message = "Dear #{@client_name} we'll waiting for you at #{@date_time} to stylist #{hh_stylist[ :stylist_name ]}. You may contact phone: #{hh_stylist[ :stylist_phone ]}"
	end	

  erb :visit
end

get '/admin' do
	unless exists_db?
		@error = 'DB don`t exists'
		return erb :creat_db
	end

	@hh = read_db_data
  erb :admin
end

post '/admin' do
	@hh = read_db_data

	@is_message = true
	if add_stylist params
		@hh = read_db_data
		@message = "New stylist added. Name: #{params[ :stylist_name ]}, phone: #{params[ :stylist_phone ]}"
	else
		@message = "OOOPs!!! A stylist with this phone number #{params[ :stylist_phone ]} is already there. This is #{@hh[ :stylists ][ params[ :stylist_phone ] ][:stylist_name] }."
	end

  erb :admin
end

post '/creat_db' do
	@b_creat_db = params[ :b_creat_db ]

	#creat_db if @b_creat_db == 'true' && !exists_db?
creat_db
	redirect :admin
end
