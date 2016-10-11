class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @blog, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { redirect_to @blog, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    blog = @comment.blog
    @comment.destroy
    redirect_to blog
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end
end
