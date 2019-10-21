require_relative "utils"

class Streams
  include Utils

  attr_reader :all

  def initialize(path_pub, path_priv)
    @path_pub = path_pub
    @path_priv = path_priv
    parse
  end

  def pick(special)
    special ? @all : @pub
  end

  private

  def parse
    @pub = file_to_hash(@path_pub)
    @priv = @path_priv.empty? ? {} : file_to_hash(@path_priv)
    @all = @pub.merge(@priv)
  end
end