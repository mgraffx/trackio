class TrackingRequestController < Api::BaseController
   respond_to :json

  def search
    params.delete("action")
    params.delete("controller")
    p = tracking_call_params
    p.delete_if { |k, v| v.empty?}
    @calls = TrackingDatum.where(p)
    respond_to do |format|
        format.html { render :text => @calls.to_json}
        format.json { render :json => @calls.to_json }
    end
  end

  private
    def tracking_call_params
      params.permit(:page_type, :environment, :service_name, :action_type, :test_page_name)
    end
end