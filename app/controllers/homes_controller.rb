class HomesController < ApplicationController
  layout "public"
  
  def index
    
    if (request.url.include? 'www') || (request.url.include? 'localhost')
      respond_to do |format|
        format.html unless user_signed_in?
        format.html { redirect_to(loans_url) }
      end 
    else
      redirect_to 'http://www.ouestmaperceuse.com'
    end
    
  end
end
