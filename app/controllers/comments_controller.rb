# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    permitted_columns = params[:comment].permit(:commenter, :description)
    @comment = @article.comments.create(permitted_columns)

    redirect_to article_path(@article)
  end
end
