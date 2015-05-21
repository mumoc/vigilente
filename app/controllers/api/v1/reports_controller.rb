class Api::V1::ReportsController < Api::V1::BaseController

  def_param_group :report do
    param :comment, String
    param :lat, String
    param :lng, String
    param :report_type, String
    param :provider,  String
    param :uid, String
    param :user, String
  end

  api :post, '/reports'
  param_group :report
  def create
    @report = Report.new report_params
    if @report.save
      render json: @report
    else
      render json: {errors: @report.errors.full_messages}
    end
  end

  def show
    render json: report
  end

  private

  def report
    @report ||= Report.find params[:id]
  end

  def report_params
    params[:images_attributes] = image_params if params[:images].present?
    params.permit(:comment, :lat, :lng, :report_type, :provider, :uid, :user, :anonymus, :district, :section, images_attributes: [:asset])
  end

  def image_params
    params[:images].map do|image|
      image = 'data:image/png;base64,' + image unless image.match(/\Adata:([-\w]+\/[-\w\+\.]+)?;base64,(.*)/m)
      {asset: image}
    end
  end

end
