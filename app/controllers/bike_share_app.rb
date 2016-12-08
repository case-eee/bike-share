class BikeShareApp < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/dashboard' do
    erb :dashboard
  end

  get '/stations-dashboard' do
    erb :"stations/dashboard"
  end

  get '/stations' do
    @stations = Station.order(:id).paginate(:page => params[:page], :per_page => 30)
    erb :'stations/index'
  end

  get '/stations/new' do
    erb :"stations/new"
  end

  get '/stations/:id/detailed' do |id|
    @station = Station.find(id)
    erb :"stations/details"
  end

  get '/stations/:id/edit' do |id|
    @station = Station.find(id)
    erb :"stations/edit"
  end

  get '/stations/:id' do |id|
    @station = Station.find(id)
    erb :"stations/show"
  end

  post '/station' do
    station = Station.create(params["station"])
    redirect :"stations/#{station.id}"
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  get '/trips' do
    @trips = Trip.order(:start_date).paginate(:page => params[:page], :per_page => 30)
    erb :'trips/index'
  end

  get '/trips/new' do
    erb :'trips/new'
  end

  post '/trips' do
    Trip.create(params[:trip])
    redirect '/trips'
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id].to_i)
    erb :'trips/show'
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.update_attributes(params[:trip])
    redirect "trips/#{trip.id}"
  end

  delete '/trips/:id' do
    trip = Trip.find(params["id"])
    trip.destroy
    redirect "/trips"
  end

  get '/conditions' do
    @conditions = Condition.order(:id).paginate(:page => params[:page], :per_page => 30)
    erb :"conditions/index"
  end

  get '/conditions/new' do
    erb :"conditions/new"
  end

  post '/conditions' do
    condition = Condition.create(params[:condition])
    redirect "/conditions/#{condition.id}"
  end

  put '/conditions/:id' do
    Condition.update(params[:id], params[:condition])
    redirect "/conditions/#{params[:id]}"
  end

  get '/conditions/:id' do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  delete '/conditions/:id' do |id|
    Condition.destroy(params[:id])
    redirect '/conditions'
  end
end
