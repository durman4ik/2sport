class Attachment < ApplicationRecord
  has_attached_file :image
  do_not_validate_attachment_file_type :image

  belongs_to :product
end
