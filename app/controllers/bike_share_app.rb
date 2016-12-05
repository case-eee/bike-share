class BikeShareApp < Sinatra::Base

    get '/stations' do
      @stations = Station.all
      erb :stations/index
    end

    get '/stations/:id' do
      @station = Station.find(id)
      erb :stations/show
    end

    get '/stations/new' do
      erb :"stations/new"
    end

    post '/stations' do
      station = Station.create(params[:stations])
      redirect '/stations'
    end

    get '/stations/:id/edit' do
      @station = Station.find(id)
      erb :stations/edit
    end

    put '/stations/:id' do
      station = Station.find(id)
      station.update(params[:stations])
      redirect "stations/#{station.id}"
    end

    delete '/stations/:id' do
      station = Station.find(id)
      station.delete(station.id)
      redirect "stations/#{station.id}"
    end

end
