module Default
  class Field < MysqlTrackrBase
    self.table_name = 'fields'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :key, :created_at, :updated_at, :value_id
    end

    belongs_to :value, :foreign_key => 'value_id', :class_name => 'Value'
    has_many :beacon_fields, :foreign_key => 'field_id', :class_name => 'BeaconField'
    has_many :beacons, :through => :beacon_fields, :foreign_key => 'beacon_id', :class_name => 'Beacon'
  end
end