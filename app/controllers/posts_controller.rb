class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy, :likes  , :likes_count]
  before_action :increment_likes_count, only: [:show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.increment!(:likes_count)
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render :show, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      render :show, status: :ok, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
  end
def likes
@posts = Post.all
@likes =@post.likes.new(post_params)
@likes.save
show_likes_on_post
end
def likes_count
   @posts = Post.all
   @likes = @post.likes_count
   show_count_on_likes
end
protected
def show_likes_on_post
  render status: :ok, json: { message: "You  have  liked   #{@post.content}." }
end
def show_count_on_likes
render status: :ok, template: 'posts/index.json.jbuilder'
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.permit(:content)
    end
    def increment_likes_count
      @post.increment(:likes_count)
    end
  end
