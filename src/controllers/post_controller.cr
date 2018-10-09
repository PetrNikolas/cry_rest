class PostController < ApplicationController
  getter post = Post.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_post }
  end

  #
  # MVC ENDPOINTS
  #
  def index
    posts = Post.all
    render("index.slang")
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def update
    post.set_attributes post_params.validate!
    if post.save
      redirect_to action: :index, flash: {"success" => "Updated post successfully."}
    else
      flash["danger"] = "Could not update Post!"
      render "edit.slang"
    end
  end

  def create
    post = Post.new post_params.validate!
    if post.save
      redirect_to action: :index, flash: {"success" => "Created post successfully."}
    else
      flash["danger"] = "Could not create Post!"
      render "new.slang"
    end
  end

  def destroy
    post.destroy
    redirect_to action: :index, flash: {"success" => "Deleted post successfully."}
  end


  #
  # JSON API ENDPOINTS
  #
  def index_json
    posts = Post.all
    respond_with { json posts.to_json }
  end

  def show_json
    respond_with { json post.to_json }
  end


  #
  # PRIVATE METHODS
  #
  private def post_params
    params.validation do
      required :title { |f| !f.nil? }
      required :description { |f| !f.nil? }
      required :content { |f| !f.nil? }
    end
  end

  private def set_post
    @post = Post.find! params[:id]
  end
end
