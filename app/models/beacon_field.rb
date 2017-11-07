module Default
  class BeaconField < MysqlTrackBase
    self.table_name = 'beacon_fields'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :created_at, :updated_at, :field_id, :beacon_id
    end

    belongs_to :beacon, :foreign_key => 'beacon_id', :class_name => 'Beacon'
    belongs_to :field, :foreign_key => 'field_id', :class_name => 'Field'
  end
end