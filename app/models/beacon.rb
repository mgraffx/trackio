module Default
  class Beacon < MysqlTrackBase
    self.table_name = 'beacons'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :description, :created_at, :updated_at, :service_id
    end

    belongs_to :service, :foreign_key => 'service_id', :class_name => 'Service'
    has_many :beacon_fields, :foreign_key => 'beacon_id', :class_name => 'BeaconField'
    has_many :beacon_platforms, :foreign_key => 'beacon_id', :class_name => 'BeaconPlatform'
    has_many :fields, :through => :beacon_fields, :foreign_key => 'field_id', :class_name => 'Field'
    has_many :platforms, :through => :beacon_platforms, :foreign_key => 'platform_id', :class_name => 'Platform'
  end
end