class BikeShareApp < Sinatra::Base

  get '/trips' do
    erb :'trips/index'
  end

end
