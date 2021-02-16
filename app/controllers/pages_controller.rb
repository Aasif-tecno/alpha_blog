class PagesController < ApplicationController

    def home
    end

    def index
        @users = User.all
    end

    def about
    end

    def articles
        @articles = Article.all
    end

    def dashboard
        @articles = Article.all

    end
end
