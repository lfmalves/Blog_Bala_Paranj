# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(params.require(:article).permit(:title, :description))

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    permitted_columns = params.require(:article).permit(:title, :description)
    @article.update_attributes(permitted_columns)

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, notice: 'Delete success'
  end
end
