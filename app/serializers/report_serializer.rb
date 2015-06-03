class ReportSerializer < ActiveModel::Serializer
  attributes :id, :comment, :lat, :lng, :report_type, :provider, :uid, :user, :anonymus, :images, :shortLink, :hashtag, :imagen, :section, :district

  include ActionView::Helpers::AssetTagHelper

  def shortLink
    "http://bit.ly/1FqmA6j"
  end

  def hashtag
    "#Vigilente"
  end

  def imagen
    "http://vigilente.mx/twitter-image.png"
  end

  def images
    object.images.map {|image| image.asset.url}
  end
end
