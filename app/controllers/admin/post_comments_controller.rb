class Admin::PostCommentsController < ApplicationController
  def index
    @post_recipe = PostRecipe.find(params[:post_recipe_id])
    @post_comments = @post_recipe.post_comments
    @post_comment_count = @post_comments.all.count
  end

  def show
    @user = User.find(params[:user_id])
    @post_comments = @user.post_comments
    @post_comment_count = @post_comments.all.count
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    if post_comment.destroy
      redirect_to admin_post_recipe_post_comments_path(params[:post_recipe_id])
    else
      render :index
    end
  end
end
