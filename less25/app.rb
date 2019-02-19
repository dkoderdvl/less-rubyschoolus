require 'sqlite3'

db = SQLite3::Database.new 'testdb.sqlite'
db.results_as_hash = true

#db.execute "INSERT INTO cars(name,price) VALUES ('audi','33000')"

db.execute "SELECT * FROM cars" do |v|
    
    puts v.class
    puts v['id']
    puts '============'
    
end

db = SQLite3::Database.new 'barbarshop.sqlite'
db.results_as_hash = true

#db.execute "INSERT INTO cars(name,price) VALUES ('audi','33000')"

db.execute "SELECT date_time as dt, colorpicker, clients.name as client_name, clients.phone as client_phone, stylists.name as stylist_name, stylists.phone as stylist_phone FROM visits LEFT JOIN clients ON visits.id_client = clients.id LEFT JOIN stylists ON visits.id_stylist = stylists.id" do |v|
    
    puts v.class
    puts v
    puts '============'
    
end



db.close

db = SQLite3::Database.new 'barbarshop.sqlite'
db.results_as_hash = true

#raws = db.execute("SELECT * FROM stylists WHERE stylists.name = 'Jonsy'").size
#aws = db.execute "INSERT INTO stylists (name, phone) VALUES('aaaaaaa','2324')"
p db.execute("SELECT id FROM clients WHERE phone = '133'")[0]['id']
    
#   puts raws.class
#   puts raws
#   puts raws.size
   puts '============'



db.close

