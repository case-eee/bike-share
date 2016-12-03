require_relative '../models/station'

class BikeShareApp < Sinatra::Base
  
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end
  
  get '/stations' do
    @stations = Station.all
    erb :stations_index
  end

  get '/stations/new' do
    erb :new_station
  end

  post '/stations' do
    Station.create(params[:station])
    redirect '/stations'
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show_station
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :edit_station
  end

  put '/stations/:id' do
    Station.update(params[:id], params[:station])
    redirect "/stations/#{params[:id]}"
  end

  delete '/stations/:id' do
    Station.destroy(params[:id])
    redirect '/stations'
  end

end
