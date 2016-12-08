require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
include WillPaginate::Sinatra::Helpers

  get '/' do
    erb :homepage
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"/stations/new"
  end

  get '/stations-dashboard' do
    erb :"/stations/dashboard"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  post '/stations' do
    station = Station.write(params[:stations])
    redirect "/stations/#{ station.id }"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    station = Station.find(params[:id])
    station.write_update(station, params[:stations])
    redirect "stations/#{station.id}"
  end

  delete '/stations/:id' do
    Station.delete(params[:id])
    redirect "/stations"
  end

  get '/trips' do
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
    erb :'trips/index'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  post '/trips' do
    trip = Trip.write(params[:trips])
    redirect "/trips/#{ trip.id }"
  end

  get '/trips-dashboard' do
    erb :'/trips/dashboard'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    @subscription_type = Subscription.find(@trip.subscription_id)
    erb :'/trips/edit'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end

  put '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.update(params[:trips])
    redirect "/trips/#{ trip.id }"
  end

  delete '/trips/:id' do
    Trip.delete(params[:id])
    redirect '/trips'
  end

  get "/conditions" do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get "/conditions-dashboard" do
    @highest_rides = Condition.day_with_highest_number_of_rides 
    @lowest_rides = Condition.day_with_lowest_number_of_rides
    erb :"conditions/dashboard"
  end

  get "/conditions/new" do
    erb :"conditions/new"
  end

  get "/conditions/:id/edit" do
    @condition = Condition.find(params[:id].to_i)
    erb :"conditions/edit"
  end

  get "/conditions/:id" do
    @condition = Condition.find(params["id"].to_i)
    erb :"conditions/show"
  end

  post "/conditions" do
    condition = Condition.write(params[:conditions])
    redirect "/conditions/#{condition.id}"
  end

  put "/conditions/:id" do
    condition = Condition.find(params["id"])
    condition.update(params[:conditions])
    redirect "/conditions/#{params["id"]}"
  end

  delete "/conditions/:id" do
    Condition.delete(params["id"])
    redirect "/conditions"
  end

end
