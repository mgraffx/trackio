class UiDataController < ApplicationController

  def trec
     @services = Service.all
     render "main"
  end

  def services_form
    respond_to do |format|
      format.html
      format.js
    end
  end

  def services
    service = Service.find(params[:service][:id])
    @fields = service.fields.pluck(:field_name)
  end

  def fields_form
    render "fields"
  end

  def hive_select
    require 'thrift'
    require 'rbhive'
    require 'byebug'
    require 'openssl'

    RBHive.tcli_connect('hue.huffpo.net', 10000, {transport: :sasl, sasl_params:{}}) do |conn|
    #byebug
    conn.execute('USE default')
    #byebug
    output = conn.fetch params[:query_string]
    puts output
    end
    render :nothing => true
    return output;
  end

  private
  def ui_params
    params.require(:service).permit(:name, :servers, :created_at, :updated_at)
  end



end

