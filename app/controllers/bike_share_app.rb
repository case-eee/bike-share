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
    # @trips = Trip.find(params[:page])
    @trips = Trip.all
    erb :"trips/index"
  end

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

end
