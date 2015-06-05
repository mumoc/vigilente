class ImageComposer

  POSITIONS = {
    1 => ["+20+20"],
    2 => ["+20+20", "+406+20"],
    3 => ["+20+20", "+213+20", "+406+20"]
  }
  attr_accessor :images

  def initialize(images = [])
    @images = from_base64(images)
    @base_image = MiniMagick::Image.open(Rails.root.join('public','twitter-image.png'))
    @s3 ||= AWS::S3.new
  end

  def compose
    positions = POSITIONS[@images.length]
    result = @base_image
    @images.each_with_index do |image, index|
      result = result.composite(image) do |c|
        c.compose "Over"
        c.geometry positions[index]
      end
    end
    result
  end

  def upload
    @s3.buckets['vigilente'].objects["social/#{filename}"].write(:file => compose.path, acl: :public_read)
  end

  def url
    @s3.buckets['vigilente'].objects["social/#{filename}"].public_url(secure: false).to_s
  end

  private

  def from_base64(images)
    images.map do |image_base64|
      encoded_data = Base64.decode64(image_base64)
      image = MiniMagick::Image.read(encoded_data)
      image.resize '173x173'
      image.format 'png'
      image
    end
  end

  def filename
    @filename ||= SecureRandom.urlsafe_base64(6, false) + '.png'
  end

end