class PostsController < ApplicationController
  
  def new
    @post = Post.new
    @place = Place.find_by({"id" => params["place_id"]})
    @post["place_id"] = @place["id"]
    # render posts/new view with new Post form
    end

  def create
    # start with a new Contact
    @post = Post.new

    # assign user-entered form data to Post's columns
    @post["action"] = params["post"]["action"]
    @post["description"] = params["post"]["description"]
    @post["date"] = params["post"]["date"]
    
    # assign relationship between Post and Place
    @post["place_id"] = params["post"]["place_id"]

    # save Contact row
    @post.save

    # redirect user
    redirect_to "/places/#{@post["place_id"]}"
  end

end
