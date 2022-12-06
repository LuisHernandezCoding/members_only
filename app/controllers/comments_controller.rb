class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @article, notice: 'Comment was not created.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.user == current_user || @article.user == current_user
      @comment.destroy
      redirect_to @article, status: :see_other, notice: 'Comment was successfully destroyed.'
    else
      redirect_to @article, notice: "You can't delete this comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
