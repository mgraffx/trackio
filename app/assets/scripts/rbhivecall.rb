require 'thrift'
require 'rbhive'
require 'byebug'
require 'openssl'
require File.expand_path('../../config/environment', __FILE__)

  def query_hive(query)
    RBHive.tcli_connect('hue.huffpo.net', 10000, {transport: :sasl, sasl_params:{}}) do |conn|
      #byebug
      conn.execute('USE default')
      #byebug
      #output = conn.fetch 'SELECT * from beacon where dt = 2016062812'
      output = conn.fetch query
      puts output
    end
  end

  #query_hive('SELECT * from beacon where dt = 2016062812')
