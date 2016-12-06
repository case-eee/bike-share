class BikeShareApp < Sinatra::Base

  get "/conditions" do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get "/conditions/new" do
    erb :"conditions/new"
  end

  get "/conditions/:id/edit" do
    erb :"conditions/edit"
  end

  get "/conditions/:id" do
    @condition = Condition.find(params["id"].to_i)
    erb :"conditions/show"
  end

  post "/conditions" do
    condition = Condition.write(params[:conditions])
    redirect "/conditions/#{condition.id}"
  end

end