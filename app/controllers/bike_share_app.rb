class BikeShareApp < Sinatra::Base

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end

  get "/stations/new" do
    erb :"stations/new"
  end

  post "/stations" do
    Station.create(params[:station])
    redirect "/stations"
  end

  delete "/stations/:id" do
    Station.destroy(params[:id])
    redirect "/stations"
  end
end
