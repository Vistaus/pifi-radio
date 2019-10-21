require_relative "application_controller"
require_relative "../lib/lang_chooser"

class IndexController < ApplicationController
  def title
    title = "PiFi Radio"
    settings.production? ? title : "[#{settings.environment.capitalize}] #{title}"
  end

  def streams_set
    streams.pick(special_ip?)
  end

  def lang
    LangChooser.new(env["HTTP_ACCEPT_LANGUAGE"]).lang
  end

  def play_local?
    settings.play_local
  end

  get "/" do
    erb :index
  end
end
