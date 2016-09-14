require 'pry'

class FiguresController < ApplicationController

get '/figures' do
  erb :'figures/index'
end

get '/figures/new' do
  erb :'figures/new'
end

get '/figures/:id' do
  @figure = Figure.all.find_by_id(params[:id])
  erb :'figures/show'
end

post '/figures' do
  @figure = Figure.create(params[:figure])

  if !params[:title][:name].empty?
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
  end

  if !params[:landmark][:name].empty?
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
  end

  @figure.save
  redirect to '/figures'
end

 get '/figures/:id/edit' do
  @figure = Figure.all.find_by_id(params[:id])
  erb :'figures/edit'
end

  post '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    @figure.update(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


end
