class HomeController < ApplicationController
  require 'json'

  def index
    @data = JSON.parse(HTTParty.get('https://api.instagram.com/v1/users/self/media/recent/', :query => {:access_token => current_user.token.access_token}).body)
    @data["data"].each do |post|
      Post.add_post(post,current_user)
    end
    # binding.pry
    @posts = Post.where(user: current_user)
  end
end
