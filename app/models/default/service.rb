module Default
  class Service < MysqlTrackrBase
    self.table_name = 'services'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :servers, :created_at, :updated_at
    end

    has_many :beacons, :foreign_key => 'service_id', :class_name => 'Beacon'
  end
end