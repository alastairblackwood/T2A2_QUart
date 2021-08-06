class PagesController < ApplicationController

    before_action :authenticate_user!, only: [:restricted]

    def home
    end

    def about
    end

    def restricted
    end

end

