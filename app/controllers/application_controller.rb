
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end
  
  get '/posts/:id' do #params is {"id" => "6"}. What sets it as that exactly? This vs. params in line 19 being {name => "name inputted", content => "content from form"}
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do 
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.update(params[:id], "name" => params[:name], "content" => params[:content])
    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.destroy(params[:id])
    erb :deleted
  end

end
