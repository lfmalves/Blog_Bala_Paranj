# frozen_string_literal: true

class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'welcome',
                               password: 'secret',
                               except: [:create]

  def create
    @article = Article.find(params[:article_id])
    permitted_columns = params[:comment].permit(:commenter, :description)
    @comment = @article.comments.create(permitted_columns)

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article), notice: 'Comment deleted'
  end
end
