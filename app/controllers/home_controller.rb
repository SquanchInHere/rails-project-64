class HomeController < ApplicationController
  def index
    debugger
    @database_url = Rails.application.credentials.production[:db_connection]
  end
end
