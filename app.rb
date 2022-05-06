require 'sinatra'
require './lib/probateca'

get '/' do
  @mega_sena = Probateca.parse("data/results.megasena")
  @quina     = Probateca.parse("data/results.quina")
  erb :index
end
