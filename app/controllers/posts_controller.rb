class PostsController < ApplicationController
  
  def new
    @post = Post.new
    @post["place_id"] = params["place_id"]
    # render posts/new view with new Post form
  end

  def create
    # start with a new Contact
    @post = Post.new

    # assign user-entered form data to Post's columns
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    
    # assign relationship between Post and Place
    @post["place_id"] = params["post"]["place_id"]

    # save Contact row
    @post.save

    # redirect user
    redirect_to "/places/#{@post["place_id"]}"
  end

end
