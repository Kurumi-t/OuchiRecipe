class Public::PostCommentsController < ApplicationController
  def index
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    post_comments = @post_recipe.post_comments
    @post_comments = post_comments.page(params[:page]).per(10)
    @post_comment_count = post_comments.all.count
    @post_comment = PostComment.new
  end

  def create
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.post_recipe_id = @post_recipe.id
    if @post_comment.save
      redirect_to post_recipe_post_comments_path(@post_recipe.id)
    else
      post_comments = @post_recipe.post_comments
      @post_comments = post_comments.page(params[:page]).per(10)
      @post_comment_count = post_comments.all.count
      render :index
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    if @post_comment.destroy
      redirect_to post_recipe_post_comments_path(params[:post_recipe_id])
    else
      render :index
    end
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
