class BikeShareApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :index
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/stations/new' do
    erb :"stations/new"
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
    trips = Trip.order(:start_date)
    trips = trips.each_slice(30)
    count = 0
    trips_hash = create_trip_hash(trips,count)
    @trips = find_correct_trip_grouping(trips_hash,params["page"])
    erb :'trips/index'
  end

  def create_trip_hash(trips,count)
    #this creates a count value {1 => <#Trip Object>}
    #for the pagination on the rendered view(buttons)
    trips.group_by do |trip|
      trip[count]
      count += 1
    end
  end

  def find_correct_trip_grouping(trips_hash,search_value)
    if search_value.nil?
      select_first_set_of_trip_data(trips_hash)
    else
      select_correct_set_of_trip_data(trips_hash,search_value)
    end
  end

  def select_first_set_of_trip_data(trips_hash)
    if trips_hash.empty?
      redirect '/trips?page=1'
    else
      trips_hash[1].flatten
    end
  end

  def select_correct_set_of_trip_data(trips_hash,search_value)
    trips_hash[search_value.to_i].flatten
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
    @conditions = Condition.all
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
