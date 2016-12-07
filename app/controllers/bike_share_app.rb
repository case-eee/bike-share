require 'will_paginate'
require 'will_paginate/active_record'

class BikeShareApp < Sinatra::Base
include WillPaginate::Sinatra::Helpers

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
    station = Station.create(params[:stations])
    redirect "/stations/#{ station.id }"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put '/stations/:id' do
    station = Station.find(params[:id])
    station.update(params[:stations])
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

end
