class HomeController < ApplicationController
  def index
    debugger
    @database_url = Rails.application.credentials.production_database_url
  end
end
