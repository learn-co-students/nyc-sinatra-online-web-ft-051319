class FiguresController < ApplicationController

  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    # @figure.title_ids=params[:figure][:title_ids]
    # @figure.landmark_ids=params[:figure][:landmark_ids]

    if !params[:title][:name].empty?
      @title=Title.create(params[:title])
      @figure.titles<<@title
    end

    if !params[:landmark][:name].empty?
      @landmark=Landmark.create(params[:landmark])
      @figure.landmarks<<@landmark
    end

    @figure.save

    puts Figure.all.count

    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures=Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    erb :'figures/edit'
  end


  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'/figures/show'
  end

  patch '/figures/:id' do
    @figure=Figure.find(params[:id])
    @figure.update(params[:figure])
    @landmark=Landmark.create_or_find_by(params[:landmark])
    @figure.landmark_ids<<@landmark.id
    @figure.save

    redirect "/figures/#{@figure.id}"
  end


end
