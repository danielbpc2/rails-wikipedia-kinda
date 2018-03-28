class ArticlesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(user_params)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(user_params)

    flash[:notice] = "Article was successfully updated."
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private

  def set_params
    @article = Article.find(params[:id])
  end

  def user_params
    params.require(:article).permit(:title, :content)
  end

end
