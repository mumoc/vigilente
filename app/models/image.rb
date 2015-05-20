class Image < ActiveRecord::Base

  before_create :assign_original_filename

  has_attached_file :asset, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :asset, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  private

  def assign_original_filename
    self.asset_file_name = SecureRandom.urlsafe_base64(nil, false) + '.png'
  end
end
