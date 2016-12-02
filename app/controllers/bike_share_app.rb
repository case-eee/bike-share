class BikeShareApp < Sinatra::Base

  get "/stations" do
    erb :"stations/index"
  end
end
