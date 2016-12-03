require_relative '../models/station'

class BikeShareApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :"dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    @cities = City.all
    erb :"stations/new"
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    # require 'pry'; binding.pry
    Station.update(params[:id], params[:station])
    # binding.pry
    redirect "/stations/#{params[:id]}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

end
