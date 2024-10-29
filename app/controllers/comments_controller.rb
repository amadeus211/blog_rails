class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(params.require(:comment).permit(:content))

    if @comment.save
      CommentsMailer.submitted(@comment).deliver_later
      redirect_to @post
    else
      render 'posts/show', locals: { comment: @comment }, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
