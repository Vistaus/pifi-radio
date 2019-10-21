require_relative "../lib/config_getter"
require_relative "../lib/streams"

class ApplicationController < Sinatra::Base
  def special_ip?
    # Try to get remote IP if behind reverse-proxy
    ip = env["HTTP_X_FORWARDED_FOR"] || request.ip
    settings.special_ips.include?(ip)
  end

  def streams
    @@streams ||= Streams.new(settings.streams_file, settings.streamsp_file)
  end

  set ConfigGetter.new.config
  
  configure :production do
    set :static, settings.serve_static
  end

  set :root, File.expand_path("../../", __FILE__)
end