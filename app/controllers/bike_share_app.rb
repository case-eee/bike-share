class BikeShareApp < Sinatra::Base

  get '/trips' do
    @trip = Trip.all
    erb :'trips/index'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  post '/trips' do
    trip = Trip.create(params[:trips])
    redirect "/trips/#{ trip.id }"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :'/trips/show'
  end

end
