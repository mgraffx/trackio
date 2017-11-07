class FieldService < MysqlTrackBase
  self.table_name = 'field_service'
  self.inheritance_column = 'ruby_type'
  self.primary_key = 'id'

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :description, :created_at, :updated_at, :service_id, :field_id, :event_type
  end

  belongs_to :field
  belongs_to :service
end