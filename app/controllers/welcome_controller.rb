class WelcomeController < ApplicationController
  def index
    @card = Card.new
  end

end
