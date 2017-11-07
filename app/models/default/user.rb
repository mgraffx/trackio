module Default
  class User < MysqlTrackrBase
    self.table_name = 'users'
    self.inheritance_column = 'ruby_type'
    self.primary_key = 'id'

    if ActiveRecord::VERSION::STRING < '4.0.0' || defined?(ProtectedAttributes)
      attr_accessible :crypted_password, :salt, :remember_token, :remember_token_expires_at, :name, :email_address, :administrator, :created_at, :updated_at, :state, :key_timestamp
    end

  end
end