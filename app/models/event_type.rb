class EventType < MysqlTrackBase
  self.table_name = 'event_type'
  self.inheritance_column = 'ruby_type'
  self.primary_key = 'id'

   alias_attribute :id , :name

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :id, :name
  end
end