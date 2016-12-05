class BikeShareApp < Sinatra::Base

  get '/trips' do
    @trip = Trip.all
    erb :'trips/index'
  end

end
