  class MysqlTrackBase < ActiveRecord::Base
    self.abstract_class = true #important!
    establish_connection "#{Rails.env}".to_sym
  end
