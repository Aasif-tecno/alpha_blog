class PagesController < ApplicationController

    def home
    end

    def about
    end

    def articles
        @articles = Article.all
    end
end
