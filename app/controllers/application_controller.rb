class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def default_url_options
    { host: "https://fete-de-la-science.herokuapp.com/" }
  end

  #https://www.fetedelascience-aura-numerique.com/
end
