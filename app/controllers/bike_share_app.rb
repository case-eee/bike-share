require_relative '../models/station'

class BikeShareApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  # get '/' do
  #   erb :"dashboard"
  # end

  ### Start Stations Routes ###
  get '/station-dashboard' do
    erb :"stations/dashboard"
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
    redirect "/stations"
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

  ### Start Trips Routes ###
  get '/trip-dashboard' do
    erb :"trips/dashboard"
  end

  get '/trips' do
    @page = params[:page].to_i
    @trips = Trip.order(:start_date).offset(@page * 30).limit(30)
    erb :"trips/index"
  end

  get '/trips/new' do
    @trips = Trip.all
    erb :"trips/new"
  end

  post '/trips' do
    trip = Trip.create(params[:trip])
    redirect "/trips/#{trip.id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    @trips  = Trip.all
    erb :"trips/edit"
  end

  put '/trips/:id' do
    Trip.update(params[:id], params[:trip])
    redirect "/trips/#{params[:id]}"
  end

  delete '/trips/:id' do
    Trip.destroy(params[:id])
    redirect '/trips'
  end

  ### Start Weather Conditions Routes ###
  get '/weather-dashboard' do
    @metrics = WeatherCondition.master_metrics
    erb :"conditions/dashboard"
  end

  get '/conditions' do
    @page = params[:page].to_i
    @end = false
    @conditions = WeatherCondition.order(:date).offset(@page * 30).limit(30)
    @end = true if WeatherCondition.order(:date).offset((@page + 1) * 30).empty?
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/conditions' do
    params[:condition][:zip_code] = 94107
    condition = WeatherCondition.create(params[:condition])
    redirect "/conditions"
  end

  get '/conditions/:id' do
    @condition = WeatherCondition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    @condition = WeatherCondition.find(params[:id])
    @conditions  = WeatherCondition.all
    erb :"conditions/edit"
  end

  put '/conditions/:id' do
    WeatherCondition.update(params[:id], params[:condition])
    redirect "/conditions/#{params[:id]}"
  end

  delete '/conditions/:id' do
    WeatherCondition.destroy(params[:id])
    redirect '/conditions'
  end


end
