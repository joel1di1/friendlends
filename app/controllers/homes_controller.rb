class HomesController < ApplicationController
  layout "public"
  
  def index
    respond_to do |format|
      format.html unless user_signed_in?
      format.html { redirect_to(loans_url) }
    end
  end
end
