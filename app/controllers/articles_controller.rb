class ArticlesController < ApplicationController

    def new 
        @article = Article.new
    end

    def index
        @article = Article.all
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was sucessfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end 
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])    
    end

    def show 
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "article was updated"
            redirect_to articles_path(@article)
        else
            flash[:notice] = "article was not updated"
            render 'edit'
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end
end
