class LandmarksController < ApplicationController

  get '/landmarks/new' do
    @titles=Title.all
    @figures=Figure.all
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark=Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks=Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id/edit' do
    @landmark=Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  get '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  patch '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

end
