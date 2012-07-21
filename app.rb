require 'sinatra'
require './lib/probateca'

get '/' do
  @mega_sena = Probateca.new("data/mega_sena.txt").parse_file
  erb :index
end
