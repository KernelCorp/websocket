class MainController < ApplicationController
  
  def channel
  end

  def trigger
    WebsocketRails[:channel].trigger 'trigger'
    redirect_to :root
  end

end
