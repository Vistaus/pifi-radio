require_relative "application_controller"

class StreamsController < ApplicationController
  get "/" do
    content_type :json
    streams.pick(special_ip?).to_json
  end
end
