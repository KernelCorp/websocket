class MessagesController < ApplicationController
  
  def trigger
    raise unless [ :token, :channel, :event ].all? { |s| params.key? s }

    token = params.delete :token

    site = Site.find_by token: token

    channel = params.delete :channel

    WebsocketRails[ "#{site.name}_#{channel}" ].trigger params[:event], params[:data]

    head :ok
  rescue
    head :bad_request
  end

end
