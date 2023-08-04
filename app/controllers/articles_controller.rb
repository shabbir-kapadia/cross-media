class ArticlesController < ApplicationController
    def index
      @articles = Article.all
      render json: @articles
    end

    #Get functionality is used forextracting the given value from the SQL database and rendering in JSON format
    # GET  /articles/:id
    def show
      @articles = Article.find(params[:id])
      render json: @articles
    end
  
    # POST /articles
    def create
      @articles = Article.new(user_params) #extracting all the user params in articles
      if @articles.present? && @articles.save #performing validation if they are present
        render json: @articles, status: :created #rending if they are present
      else
        render json: { errors: @articles.errors.full_messages }, status: :unprocessable_entity #displaying actual error as to why they failed
      end
    end

    # PUT
    def update
        #As we cannot update values we present error 405
        render json: { message: 'API does not allow articles to be modified' }, status: 405
    end

    def destroy
        #As we cannot delete values we present error 405
        render json: { message: 'API does not allow articles to be deleted' }, status: 405
    end

    def user_params
      #this method extracts value from the POST request and p=we pass on the user_params to the create method
      params.require(:article).permit(:title, :content, :author, :category, :published_at)
    end
  end
  