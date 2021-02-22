class HomeController < ApplicationController
  def index
    @posts = Post.all 
    #Instance variable used in the index view, @posts referes to all the posts saved within the posts model
  end
  def about
  end
end
