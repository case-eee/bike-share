class BikeShareApp < Sinatra::Base

  get "/conditions" do
    @conditions = Condition.all
    erb :"conditions/index"
  end

  get "/conditions/new" do
    erb :"conditions/new"
  end

  get "/conditions/:id/edit" do
    @condition = Condition.find(params[:id].to_i)
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

  put "/conditions/:id" do
    condition = Condition.find(params["id"])
    condition.update(params[:conditions])
    redirect "/conditions/#{params["id"]}"
  end

  delete "/conditions/:id" do
    Condition.delete(params["id"])
    redirect "/conditions"
  end

end