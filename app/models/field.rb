  class Field < MysqlTrackBase

    self.table_name = 'fields'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :id, :field_name, :created_at, :updated_at
    end

    belongs_to :value, :foreign_key => 'value_id', :class_name => 'Value'
    has_many :beacon_fields, :foreign_key => 'field_id', :class_name => 'BeaconField'
    has_many :beacons, :through => :beacon_fields, :foreign_key => 'beacon_id', :class_name => 'Beacon'
    #has_and_belongs_to_many :service

    has_many :field_service
    has_many :services, :through => :field_service

    validates :field_name, :presence => true, :uniqueness => true

  end