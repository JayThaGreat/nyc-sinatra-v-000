class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'/landmarks/index'
  end

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  post '/landmarks' do
    #binding.pry
    # May need to use find_or_create_by
    @landmark = Landmark.create(params[:landmark])
    #binding.pry
    @landmark.titles << Title.create(params[:title])
    @landmark.landmarks << Landmark.create(params[:landmark])
    Title.all.last.save
    Landmark.all.last.save
    @landmark.save

    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    #binding.pry
    @landmark = Landmark.find_by_id(params[:id])

    erb :'/landmarks/show'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])

    redirect to "figures/#{@figure.id}"
  end
  
end
