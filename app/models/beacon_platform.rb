module Default
  class BeaconPlatform < MysqlTrackBase
    self.table_name = 'beacon_platforms'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :example_url, :created_at, :updated_at, :platform_id, :beacon_id
    end

    belongs_to :beacon, :foreign_key => 'beacon_id', :class_name => 'Beacon'
    belongs_to :platform, :foreign_key => 'platform_id', :class_name => 'Platform'
  end
end