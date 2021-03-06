class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.all.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    @landmark.save
    redirect to '/landmarks'
  end

   get '/landmarks/:id/edit' do
    @landmark = Landmark.all.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

    post '/landmarks/:id' do
      @landmark = Landmark.find_by(id: params[:id])
      @landmark.update(params[:landmark])

      redirect to "/landmarks/#{@landmark.id}"
    end

end
