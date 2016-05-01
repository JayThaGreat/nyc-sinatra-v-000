class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all.uniq

    erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures' do
    Figure.find_by_name(params[:figure][:name]) ? @figure = Figure.find_by_name(params[:figure][:name]) : @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(params[:title])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    erb :'/figures/show'
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.landmarks << Landmark.find_or_create_by(params[:figure][:landmark])
    @figure.update(name: params[:figure][:name])

    redirect to "figures/#{@figure.id}"
  end

end