class TrackingDatum < MysqlTrackBase
  self.table_name = 'tracking_data'
  self.inheritance_column = 'ruby_type'
  self.primary_key = 'id'

  alias_attribute :service , :service_name

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :page_type, :environment, :query_string, :service_name, :action_type, :entry_id, :edition, :platform, :section_name, :test_page_name
  end

end
