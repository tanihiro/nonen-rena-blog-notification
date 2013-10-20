require 'nokogiri'
require 'open-uri'
require 'uri'
require 'yaml'

# 最新のIDをローカルファイルから取得
recent_entry_id = 0
if File.exists?('entry_id.txt') === true
  recent_entry_id = File.read 'entry_id.txt'
end

# 公式BLOGから最新のIDを取得
top      = Nokogiri::HTML(open('http://yaplog.jp/lp-n-rena/')) 
link     = top.css('.entry > .entry_title > h3 > a').first
href     = link.attributes['href'].to_s
entry_id = href.split('/').last

exit if entry_id.to_i <= recent_entry_id.to_i

config = YAML.load(File.read('config.yml'))
IM_KAYAC_COM_URL = "http://im.kayac.com/api/post/#{config['username']}"

uri = URI.parse(IM_KAYAC_COM_URL)
Net::HTTP.start(uri.host, uri.port) do |http|
  request = Net::HTTP::Post.new(uri.path)

  data = { :message => "能年玲奈のブログが更新されました", :handler => href }
  data[:password] = config['password'] if config['password']

  request.set_form_data data
  response = http.request(request)
  puts response
end

# 最新のIDをローカルファイルに上書き
File.write 'entry_id.txt', entry_id
