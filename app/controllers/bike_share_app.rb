class BikeShareApp < Sinatra::Base

  get '/trips' do
    @trip = Trip.all
    erb :'trips/index'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[id])
    erb :'/trips/show'
  end

end
