class WelcomeController < ApplicationController
    
  def index
    @card = Card.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml
      format.iphone
    end
  end

end
