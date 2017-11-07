class Service < MysqlTrackBase
  self.table_name = 'services'
  self.inheritance_column = 'ruby_type'
  self.primary_key = 'id'

  alias_attribute :service , :name
  alias_attribute :service_name, :name
  alias_attribute :domain_name, :domain

  if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
    attr_accessible :name, :domain, :created_at, :updated_at
  end

  has_many :beacons, :foreign_key => 'service_id', :class_name => 'Beacon'
  #has_and_belongs_to_many :fields

  has_many :field_service
  has_many :fields, :through => :field_service

  validates :service, :presence => true
  validates :domain, :presence => true
end