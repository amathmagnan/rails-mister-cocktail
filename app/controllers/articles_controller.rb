class ArticlesController < ApplicationController
  before_action: set_article, only [:show, :edit, :update]

  #Get/articles
def index
  @articles = Article.all
end

  #Get/articles/1
def show
end

  #Get/articles/new
def index
  @article = Article.new
end

 #Get/articles/1/edit
def edit
end

#POST /articles
def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article, notice: 'Article was succesfully uploaded'
  else
    render: edit
  end
end

#PATCH/PUT  /articles/1
def update
  if @article.update(article_params)
    redirect_to @article, notice: 'Article was successfully updated'
  else
    render :edit
  end
 end

  #DELETE /articles/1
  def destroy
    @articles.destroy
    redirect_to root_path, notice: 'Article was successfully destroyed.'
  end

  private
  #use callbacks to shatr common setup
  def set_article
    @article = Article.find(params[:id])
  end

  #Only allow a trusted paramater "whilte list" through.
  def article_params
    params.require(:article).permit(:title, :body, photos:[])
  end
end
