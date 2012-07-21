require 'sinatra'
require './lib/probateca'

get '/' do
  @mega_sena = Probateca.parse("data/mega_sena.mega_sena")
  @quina     = Probateca.parse("data/quina.quina")
  erb :index
end
