# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Request from an iPhone or iPod touch? (Mobile Safari user agent)
  def iphone_user_agent?
    request.user_agent =~ /(Mobile\/.+Safari)/
  end

end
