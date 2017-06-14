#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end
get '/visits' do
	erb :visits
end

post '/visits' do
	@customername = params[:username]
	@phonenumber = params[:phonenumber]
	@datatime = params[:datatime]
	tofile "#{@customername} will come at #{@datatime}. You can contact him by #{@phonenumber}. \n" , "visitors_list"
	@welcomecustomer = "Dear #{@customername}, will happy to see you at #{@datatime}"
	erb :visits 
end

get '/contacts' do
	erb :contacts
end

def tofile userdata ,  file_name
	f=File.open("./public/#{file_name}.txt", "a")
	f.print userdata
	f.close
end