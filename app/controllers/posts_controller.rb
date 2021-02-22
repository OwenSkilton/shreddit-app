class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :current_user, only: [:edit, :update, :destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build # Same as writing: current_user.posts.new
  end
# **************************************************************************************************************************************** #

    # current_user indicates whos currently signed in from the devise gem and this passes those parameters to a posts builder.
    # '.build' is just an alias for the 'new' method.
    # When the button is clicked within posts/new, it routes to this 'new' definition in the controller. This @posts declaration then directs the 
    # request to be a post request. Within the console using 'rails routes --expanded', we see that a post request wihtin /posts re-directs to the 
    # create method within the contorller and that then handles saving the post to the db. 

    # OK SO BASICALLY rails is super fucking smart and news that a new object will then push it down the create path because its so fucking smart
    # The resource tag in the roots file sets all of these RESTful routes

# **************************************************************************************************************************************** #

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :photo, :user_id)
    end
end
