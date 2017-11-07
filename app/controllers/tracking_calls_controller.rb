class TrackingCallsController < ApplicationController


  def report_action_error
    if @calls.action
      flash[:notice] = "Action performed successfully"
    else
      flash[:error] = "Action failed"
    end
  end

  def index
    @calls = TrackingDatum.all
    render "tracking_calls/results"
  end

  def create
    @errors = ""
    @error_div = "create_tracking_record_errors"

    p = tracking_call_params
    begin
      @calls = TrackingDatum.new(p)
      @calls.save
    rescue => e
      to_errors(e.message, "")
    ensure
      if @errors.blank?
        to_errors("Tracking entry #{@calls.test_page_name} added sucessfully", "")
        render "errors"
      else
        @error_div = "create_tracking_record_errors"
        render "errors"
      end
    end


  end

  def new_form
    render "tracking_calls/new"
  end

  def search
    p = tracking_call_params
    p.delete_if { |k, v| v.empty? }
    @calls = TrackingDatum.where(p)
  end

  def show
    if !@calls.nil?
      render "results"
    end
  end

  def delete_form
    render "tracking_calls/delete"
  end

  def delete
    @errors = ""
    @error_div = "delete_tracking_record_errors"
    begin
      p = tracking_call_params
      @calls = TrackingDatum.find_by(p)
      @calls.destroy
    rescue => e
      to_errors(e.message, "")
      return
    ensure
      if @errors.blank?
        to_errors("Service #{calls.name} added sucessfully", "")
        render "errors"
      else
        render "errors"
      end
    end
  end

  def edit_form
    render "tracking_calls/edit_results"
  end

  def edit
    p = tracking_call_params
    call = TrackingDatum.find_by(id: p[:id])
    call.assign_attributes(p)
    call.save
    render :nothing => true
  end

  private
  def tracking_call_params
    params.require(:tracking_datum).permit(:id, :page_type, :environment, :query_string, :service_name, :action_type, :entry_id, :edition, :platform, :section_name, :test_page_name)
  end

  def to_errors e, details
    @errors << e.gsub(/^.*Error: /,"").gsub(/\'.*$/,"") << details
  end

end

