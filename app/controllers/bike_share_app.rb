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
    @trips = Trip.order(:start_date).paginate(:page => params[:page], :per_page => 30)
    @page = params[:page].to_i
    erb :'trips/index'
  end

  def select_correct_set_of_trip_data(trips_hash,search_value)
    trips_hash[search_value.to_i].flatten
  end

  get '/trips-dashboard' do

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
    #may want to reverse the order so most recent are first?
    if Condition.count > 30
      more_than_thiry_conditions
    else
      @conditions = Condition.all
      @page = 1
    end
    erb :"conditions/index"
  end

  def more_than_thiry_conditions
    conditions = Condition.all.each_slice(30)
    count = 0
    conditions_hash = create_conditions_hash(conditions, count)
    @conditions = find_correct_condition_grouping(conditions_hash, params["page"])
    @page = params["page"].to_i
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

    def create_conditions_hash(conditions, count)
      conditions.group_by do |condition|
        condition[count]
        count += 1
      end
    end

    def find_correct_condition_grouping(conditions_hash, search_value)
      if search_value.nil?
        select_first_set_of_condition_data(conditions_hash)
      else
        select_correct_set_of_conditon_data(conditions_hash, search_value)
      end
    end

    def select_first_set_of_condition_data(conditions_hash)
      if conditions_hash.empty?
        redirect '/conditions?page=1'
      else
        conditions_hash[1].flatten
      end
    end

    def select_correct_set_of_conditon_data(conditions_hash, search_value)
      conditions_hash[search_value.to_i].flatten
    end

end
