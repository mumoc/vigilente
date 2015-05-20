class ReportSerializer < ActiveModel::Serializer
  attributes :id, :comment, :lat, :lng, :report_type, :provider, :uid, :user, :anonymus, :images, :shortLink, :hashtag, :imagen

  def shortLink
    "http://www.crowdint.com/"
  end

  def hashtag
    "#hashtag"
  end

  def imagen
    "http://cdn0.crowdint.com.global.prod.fastly.net/assets/crowdint-5963acccbed6d4e6d30efa65f078f83d.svg"
  end

  def images
    object.images.map {|image| image.asset.url}
  end
end
