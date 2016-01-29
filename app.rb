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
  @stylists = Salon.get_all_from_column("stylists")
  erb :client
end

post '/add_client/' do
  Client.save_to_db(params.fetch("client_name"), -1)
  redirect '/'
end

delete '/delete_client/:client_id' do
  Client.delete(params[:client_id])
  redirect '/'
end
