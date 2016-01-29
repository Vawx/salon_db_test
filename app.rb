require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require './lib/stylist'
require './lib/client'
also_reload( './lib/**/*.rb')

DBSALON = PG.connect( {:dbname => 'salon'} )

get '/' do
  erb :index
end
