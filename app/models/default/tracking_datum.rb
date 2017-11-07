module Default
  class TrackingDatum < MysqlTrackrBase
    self.table_name = 'tracking_data'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :page_type, :environment, :query_string, :service_name, :action, :entry_id
    end

  end
end