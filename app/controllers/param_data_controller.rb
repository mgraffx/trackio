class ParamDataController < ApplicationController

  autocomplete :field, :field_name

  autocomplete :service, :name

  def create_service
    @errors = ""
    p = data_params
    begin
      begin
        if p.values.to_s == '["", ""]'
          raise "Please supply service name and domain"
        elsif p.values[0] == ""
          raise "Please supply service name"
        elsif p.values[1] == ""
          raise "Please supply domain"
        end
      rescue => e
        to_errors(e.message, "")
        return
      end

      begin
        service = Service.new(p)
        service.save
      rescue => e
        to_errors(e.message, "for service creation")
      end
    ensure
      @error_div = "create_service_errors"
      if @errors.blank?
        to_errors("Service #{service.name} added sucessfully", "")
      end
      render "errors"
    end
  end

  def create_service_fields
      @errors = ""
      fs = field_service_params
      f = field_params
      s = service_params
      service_fields = nil
      @error_div = "create_service_field_errors"
      begin
        begin
          if f.values.to_s == '[""]' && s.values.to_s == '[""]'
            raise "Please supply field and service"
          elsif f.values.to_s == '[""]'
            raise "Please supply field"
          elsif s.values.to_s == '[""]'
            raise "Please supply service"
          end
        rescue => e
          to_errors(e.message, "")
          return
        end
        begin
          field = Field.new(f)
          field.save
        rescue => e
          to_errors(e.message, "for field created")
          return
        end
        begin
          field = Field.where("field_name = ?", f[:field_name])
          service = Service.find_by(name: s[:service])
          service_fields = service.fields
          service_fields << field

        rescue => e
          to_errors(e.message, "for Service/Field association")
          return
        end
        begin
          assoc_description = service.field_service.where("field_id = ?", field[0][:id])
          assoc_description.update_all(fs)
        rescue => e
          to_errors(e.message, "for Service/Field association")
          return
        end
      ensure
        if @errors.blank?
          @errors = ""
           render "errors"
        else
          render "errors"
        end
      end
  end

  def service_fields
    @event_types = EventType.all
    service = Service.find_by(name: params[:edit_service_fields][:service])
    service_field_details = service.fields
    @service_fields = service_field_details.select(:field_name, :description, :event_type).as_json
    @service_fields.each{|h| h["service"] = service[:name]}
    @service_fields.each{|h| h.delete("id")}
  end

  def edit_service_fields
    render "edit_service_fields"

  end

  def submit_service_fields

  end

  def edit_field_description
    @errors = ""
    desc = field_description
    type = event_type
    service = desc_service
    field = desc_field
    begin
      service = Service.find_by(name: service[:service])
      field = Field.find_by(field_name: field[:field])
      assoc = service.field_service.where("field_id = ?", field[:id])
      if params[:commit] == 'Delete Field Association'
        begin
          assoc.delete_all
        rescue => e
          to_errors(e.message, "for deleting association")
        end
      else
        begin
          assoc.update_all(desc)

        rescue => e
          to_errors(e.message, "for edit description")
        end
        begin
           assoc.update_all(type)
        rescue => e
          to_errors(e.message, "for edit click type")
        end
      end
    rescue => e
      to_errors(e.message, "problem with service selected")
    ensure
       @error_div = "edit_description_#{desc[:field]}"
      if @errors.blank?
        @errors = ""
        if params[:commit] == 'Delete Field Association'
          @errors = "Delete successful"
        else
          @errors = "Update successful"
        end
        render "errors"
      else
        render "errors"
      end
    end
  end

  private
  def data_params
    params.require(:service).permit(:service_name, :domain_name)
  end

  def service_params
    params.require(:create_service_fields).permit(:service)
  end

  def field_params
    params.require(:create_service_fields).permit(:field_name)
  end

  def field_service_params
    params.require(:create_service_fields).permit(:description, :event_type)
  end

  def field_description
     params.require(:edit_field_description).permit(:description)
  end

  def event_type
    params.require(:edit_field_description).permit(:event_type)
  end

  def desc_service
    params.require(:edit_field_description).permit(:service)
  end

  def desc_field
    params.require(:edit_field_description).permit(:field)
  end

  def to_errors e, details
    @errors << e.gsub(/^.*Error: /,"").gsub(/\'.*$/,"") << details
  end

  def reload_params
    render :partial => "param_data/create_service_fields"
    render :partial => "param_data/edit_fields"
  end

end



