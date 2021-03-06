class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    # get the top authors/blogs to be displayed in side bar
    top_blogs
    top_authors

    @filter_text = ''
    if params[:q]
      search_term = params[:q]
      # puts 'now filtering'
      if Rails.env.development?
        @blogs = Blog.where("headline LIKE ?", "%#{search_term}%")
      else Rails.env.production?
        @blogs = Blog.where("headline ilike ?", "%#{search_term}%")
      end
      @filter_text = 'Search Results for: '+ search_term
    else
      @blogs = Blog.all
    end
  end

  def top_blogs
    @top_blogs = Blog.all
  end

  def top_authors
    @top_authors = Author.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    # require 'pry'
    # binding.pry
    # @comments = @blog.comments
    # .paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
    @comments = @blog.comments.paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        # require 'pry'
        # binding.pry
        # puts "*** @blog.blog_img: #{@blog.blog_img}"
        format.html { redirect_to @blog, notice: 'Blog was successfully saved.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:headline, :teaser, :content, :string, :author_id, :datePosted, :blog_img)
    end
end
