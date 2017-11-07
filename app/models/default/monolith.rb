module Default
  class Monolith < MysqlTrackrBase
    self.table_name = 'monoliths'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :name, :defaults, :interval, :override, :created_at, :updated_at, :group_id
    end

    belongs_to :group, :foreign_key => 'group_id', :class_name => 'Group'
  end
end