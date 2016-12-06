require 'pry'
class BikeShareApp < Sinatra::Base

  get '/trips' do
    @trips = Trip.all
    erb :'trips/index'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  post '/trips' do
    trip = Trip.write(params[:trips])
    redirect "/trips/#{ trip.id }"
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
