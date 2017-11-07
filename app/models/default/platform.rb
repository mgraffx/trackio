module Default
  class Platform < MysqlTrackrBase
    self.table_name = 'platforms'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :description, :link, :created_at, :updated_at
    end

    has_many :beacon_platforms, :foreign_key => 'platform_id', :class_name => 'BeaconPlatform'
    has_many :beacons, :through => :beacon_platforms, :foreign_key => 'beacon_id', :class_name => 'Beacon'
  end
end