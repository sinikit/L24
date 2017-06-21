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
	@color = params[:color]

	hh={
		username:'Type yor name',
		phonenumber: 'Type yor phonenumber',
		datatime: 'Type yor datatime'}
	
	hh.each do |key,value|
		if params[key]=='' 
			@error=hh[key]
            return erb :visits
		end
	end

		tofile "#{@customername} will come at #{@datatime}. #{@specialist} can contact him by #{@phonenumber}. Print in #{@color} \n" , "visitors_list"
		@welcomecustomer = "Dear  #{@customername}, #{@specialist} will happy to see you at #{@datatime}, and print in #{@color}"
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