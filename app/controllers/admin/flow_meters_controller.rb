class Admin::FlowMetersController < ApplicationController
  
  def index
    @flow_meter = FlowMeter.new
    @flow_meters = FlowMeter.find(:all)
  end
  
  def create
    @flow_meter = FlowMeter.create!(params[:flow_meter])
    redirect_to admin_flow_meters_url
  rescue ActiveRecord::RecordInvalid => e
    flash[:error] = "#{e.message}"
    redirect_to admin_flow_meters_url
  rescue FlowMeter::DataMismatch => e
    flash[:error] = "#{e.message}"
    redirect_to admin_flow_meters_url
  end
  
  def destroy
    @flow_meter = FlowMeter.find(params[:id])
    @flow_meter.destroy
    redirect_to admin_flow_meters_url
  end
end
