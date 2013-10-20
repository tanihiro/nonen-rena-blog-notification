require 'nokogiri'
require 'open-uri'
class BaseInformation

  DATA_DIR = File.expand_path(File.dirname(__FILE__)) + '/../data/'

  def initialize(prefix)
    @data_dir = DATA_DIR + prefix
  end

  def recent_id
    if File.exists?(@data_dir + '/recent_id')
      File.read(@data_dir + '/recent_id')
    end
  end

  def update_recent_id
    Dir.mkdir @data_dir unless Dir.exists? @data_dir
    File.write(@data_dir + '/recent_id', @entry_id)
  end

  def update?
    @entry_id.to_i > self.recent_id.to_i
  end

end
