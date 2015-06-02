class ReportsController < ApplicationController

  def index
    @reports = Report.all
    locations = @reports.map {|report| [report.lat, report.lng]}
    @geographic_center = Geocoder::Calculations.geographic_center(locations)
  end

end
