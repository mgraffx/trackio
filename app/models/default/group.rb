module Default
  class Group < MysqlTrackrBase
    self.table_name = 'groups'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :override, :created_at, :updated_at
    end

    has_many :monoliths, :foreign_key => 'group_id', :class_name => 'Monolith'
  end
end