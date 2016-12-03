class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/stations' do
    @stations = Station.all
    erb :"/stations/index"
  end

  get '/stations/new' do
    erb :"/stations/new"
  end

  post '/stations' do
    station = Station.create(params[:station])
    redirect "/stations/#{station.id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :"/stations/show"
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"/stations/edit"
  end

  put '/stations/:id' do |id|
    Station.update(params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get '/cities' do
    @cities = City.all
    erb :"cities/index"
  end

  get '/cities/new' do
    erb :"cities/new"
  end

  post '/cities' do
    city = City.create(params[:city])
    redirect "/cities/#{city.id}"
  end

  get '/cities/:id' do
    @city = City.find(params[:id])
    erb :"/cities/show"
  end

  get '/cities/:id/edit' do
    @city = City.find(params[:id])
    erb :"/cities/edit"
  end

  put '/cities/:id' do
    city = City.find(params[:id])
    city.update(params[:city])
    redirect "/cities/#{city.id}"
  end

end
