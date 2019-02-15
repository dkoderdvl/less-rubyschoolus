def get_website_contents
    puts '<body>'
    yield
    puts '</body>'
end

def get_page text
    get_website_contents {puts "#{text}"}
end

get_page 'Hi'
get_page 'contacts'


