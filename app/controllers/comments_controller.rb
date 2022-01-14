class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments
    @comment = Comment.new(comment_params)
    @comment.prototype_id = @prototype.id
    if @comment.save
      redirect_to prototype_path(@prototype.id)
    else
      render template: 'prototypes/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:prototype_id, :content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
