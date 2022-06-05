class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def new 
        @article = Article.new
    end

    def index
        @articles = Article.all
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
    end

    def show  
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "article was updated"
            redirect_to articles_path(@article)
        else
            flash[:notice] = "article was not updated"
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "article has been destroyed"
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def set_acticle
        @article = Article.find(params[:id])
    end
end
