class BikeShareApp < Sinatra::Base

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end

  get "/stations/new" do
    erb :"stations/new"
  end

  get "/stations/:id" do
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  post "/stations" do
    Station.create(params[:station])
    redirect "/stations"
  end

  delete "/stations/:id" do
    Station.destroy(params[:id])
    redirect "/stations"
  end

  get "/stations/:id/edit" do
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  put "/stations/:id" do
    Station.update(params[:station])
    redirect "/stations"
  end

  get "/station-dashboard" do
    erb :"stations/dashboard"
  end

  get "/trips" do
    @number = params[:number].to_i
    start = @number * 30
    finish = start + 30
    @current_trips = Trip.order(:start_date).reverse_order.where( :id => [start .. finish] )
    erb :"trips/index"
  end

  # get "/trips" do
  #   # @trips = Trip.all
  #   # erb :"trips/index"
  #   redirect "/trips?page=1"
  # end

  get "/trips/new" do
    erb :"trips/new"
  end

  post "/trips" do
    Trip.create(params[:trip])
    redirect "/trips"
  end

  get "/trips/:id" do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  delete "/trips/:id" do
    Trip.destroy(params[:id])
    redirect "/trips"
  end

  get "/trips/:id/edit" do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  put "/trips/:id" do
    Trip.update(params[:trip])
    redirect "/trips"
  end

  get "/conditions" do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get "/conditions/new" do
    erb :"conditions/new"
  end

  post "/conditions" do
    Condition.create(params[:condition])
    redirect "/conditions"
  end

  delete "/conditions/:id" do
    Condition.destroy(params[:id])
    redirect "/conditions"
  end

  get "/conditions/:id/edit" do
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  put "/conditions/:id" do
    Condition.update(params[:condition])
    redirect "/conditions"
  end

  get "/conditions/:id" do
    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end
end
