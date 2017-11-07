module Default
  class MysqlTrackrBase < ActiveRecord::Base
    establish_connection :adapter => "mysql", :host => "staging-pets-db.use1.huffpo.net", :database => "trackr", :port => 3306, :username => "admin", :password => "Myfn79gdC96sX8B7hjTS"
    self.table_name = 'values'
  end
end