#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "!!Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a> #{request.path}"
end

get '/:namepage' do
  erb params['namepage'].to_sym
end

post '/visit' do
	
	
  erb :visit

end
