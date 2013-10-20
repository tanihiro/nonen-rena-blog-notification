require 'yaml'
require 'uri'

class Notification

  IM_KAYAC_COM_URL = "http://im.kayac.com/api/post/"

  def initialize
    config = YAML.load(File.read(File.expand_path(File.dirname(__FILE__)) + '/../config/account.yml'))
    @username = config['username']
    @password = config['password']
  end

  def send(message, href)
    uri = URI.parse(IM_KAYAC_COM_URL + @username)
    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data :message => message, :handler => href, :password => @password 
      response = http.request(request)
    end
  end
end
