class ArticlesController < ApplicationController

def new
  @article = Article.new
end

def edit
  @article = Article.find(params[:id])
end

def create
  @article = Article.new(article_params)
  if @article.save
    flash[:success] = "Article enregistré, félicitations !"
    redirect_to article_path(@article)
  else
    render 'new'
  end
end

def update
  @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = " article modifié bro"
      redirect_to article_path(@article)
    else
      render 'edit'
end



end

def index
end

def show
  @article = Article.find(params[:id])
end

private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
