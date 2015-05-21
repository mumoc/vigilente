class ReportSerializer < ActiveModel::Serializer
  attributes :id, :comment, :lat, :lng, :report_type, :provider, :uid, :user, :anonymus, :images, :shortLink, :hashtag, :imagen

  def shortLink
    "http://www.crowdint.com/"
  end

  def hashtag
    "#hashtag"
  end

  def imagen
    "http://demandware.edgesuite.net/aasj_prd/on/demandware.static/Sites-GoPro-Site/Sites-gopro-products/default/v1432050470342/cam-represent/surf4black.png"
  end

  def images
    object.images.map {|image| image.asset.url}
  end
end
