require 'pry'
class BikeShareApp < Sinatra::Base

    get '/stations' do
      @stations = Station.all
      erb :"stations/index"
    end

    get '/stations/new' do
      erb :"/stations/new"
    end

    get '/stations_dashboard' do
      erb :"/stations/dashboard"
    end

    get '/stations/:id' do
      @station = Station.find(params[:id])
      erb :"stations/show"
    end

    post '/stations' do
      station = Station.create(params[:stations])
      redirect "/stations/#{ station.id }"
    end

    get '/stations/:id/edit' do
      @station = Station.find(params[:id])
      erb :"stations/edit"
    end

    put '/stations/:id' do
      station = Station.find(params[:id])
      station.update(params[:stations])
      redirect "stations/#{station.id}"
    end

    delete '/stations/:id' do
      Station.delete(params[:id])
      redirect "/stations"
    end

end
