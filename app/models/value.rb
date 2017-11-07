module Default
  class Value < MysqlTrackBase
    self.table_name = 'values'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :description, :type, :data_format, :possible_values, :regex_pattern, :example_url, :created_at, :updated_at
    end

    has_many :fields, :foreign_key => 'value_id', :class_name => 'Field'
  end
end