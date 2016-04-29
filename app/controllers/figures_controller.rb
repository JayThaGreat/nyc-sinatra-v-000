class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures' do
    #binding.pry
    # May need to use find_or_create_by
    @figure = Figure.find_or_create_by(name: params[:figure][:name])

    @figure.titles << Title.find_or_create_by(id: params[:figure][:title_ids],name: params["title"]["name"])
    @figure.landmarks << Landmark.find_or_create_by(id: params[:figure][:landmark_ids],name: params["landmark"]["name"])
    #@figure.update(params)
    Title.last.save
    Landmark.last.save
    @figure.save

    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    #binding.pry
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/show'
  end

  post '/figures/:id' do
    #binding.pry
    @figure = Figure.find_by_id(params[:id])

    redirect to "figures/#{@figure.id}"
  end

end