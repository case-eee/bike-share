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
    date = format_date(params[:station][:installation_date])
    params[:station][:installation_date] = date
    station = Station.create(params[:station])
    redirect "/stations/#{station.id}"
  end

  def format_date(date)
    date = date.split("/").reverse
    date[1], date[2] = date[2], date[1]
    date = date.join("/")
    date
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    @cities  = City.all
    erb :"stations/edit"
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
