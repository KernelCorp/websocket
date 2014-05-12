require 'spec_helper'

describe MessagesController do
  before do
    @site = create :site

    @request_data = {
      token: @site.token,
      channel: 'channel',
      event: 'event',
      data: 'data'
    }
  end

  it 'should work' do
    expect_any_instance_of( WebsocketRails::Channel ).to receive(:trigger) do |event, data|
      expect( event ).to eq @request_data[:event]
      expect( data ).to eq @request_data[:data]
    end

    post :trigger, @request_data

    expect(response).to be_success
  end

  [ :token, :channel, :event, :data ].each do |field|
    it 'check field presence' do
      WebsocketRails::Channel.any_instance.stub :trigger

      @request_data.delete field

      post :trigger, @request_data

      expect(response.status).to eq( field == :data ? 200 : 400 )
    end
  end
end
