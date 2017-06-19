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
	@specialist = params[:spec]
	tofile "#{@customername} will come at #{@datatime}. #{@specialist} can contact him by #{@phonenumber}. \n" , "visitors_list"
	@welcomecustomer = "Dear  #{@customername}, #{@specialist} will happy to see you at #{@datatime}"
	erb :visits 
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@post = "\n"+params[:email] + "\n ========================= \n" + params[:message] + "\n ========================= \n " 
		tofile @post , "contacts"
	erb :contacts
end


def tofile userdata ,  file_name
	f=File.open("./public/#{file_name}.txt", "a")
	f.print userdata
	f.close
end