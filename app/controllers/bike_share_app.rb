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
end
