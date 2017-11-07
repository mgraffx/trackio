class WelcomeController < ApplicationController
  def index
      @event_types = EventType.all
      @services = Service.all
      respond_to do |format|
        format.html
        format.js
      end
  end
end
