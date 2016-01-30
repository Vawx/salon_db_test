require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require './lib/stylist'
require './lib/client'
also_reload( './lib/**/*.rb')

DBSALON = PG.connect( {:dbname => 'salon'})

get '/' do
  @clients = Salon.get_all_from_column("clients")
  @stylists = Salon.get_all_from_column("stylists")
  erb :index
end

get '/client/:client_id' do
  @client = Client.get_client_by_id(params[:client_id].to_i)
  @stylist = Stylist.get_stylist_by_id(@client.stylist_id.to_i)
  erb :client
end

get '/stylist/:stylist_id' do
  @stylist = Stylist.get_stylist_by_id(params[:stylist_id].to_i)
  @clients = Salon.get_all_from_column("clients")
  @stylist_clients = Stylist.get_all_clients(params[:stylist_id].to_i)
  erb :stylist
end

patch '/add_client_to_stylist/:client_id/:stylist_id' do
  Client.change_stylist(params[:stylist_id], params[:client_id])
  redirect '/stylist/' + params[:stylist_id]
end

post '/add_stylist' do
  Stylist.save_to_db(params.fetch("stylist_name"))
  redirect '/'
end

delete '/delete_stylist/:stylist_id' do
  clients = Stylist.get_all_clients(params[:stylist_id])
  clients.each do |client|
    clients.change_stylist(-1, client.id)
  end
  Stylist.delete(params[:stylist_id])
  redirect '/'
end

post '/add_client' do
  Client.save_to_db(params.fetch("client_name"), -1)
  redirect '/'
end

delete '/delete_client/:client_id' do
  Client.delete(params[:client_id])
  redirect '/'
end
