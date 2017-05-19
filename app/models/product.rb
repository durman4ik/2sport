class Product < ApplicationRecord
  belongs_to :category
  belongs_to :location
  belongs_to :size
  belongs_to :cover
  belongs_to :building

  has_many   :book

  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :size
  accepts_nested_attributes_for :cover
  accepts_nested_attributes_for :building

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, presence: true

  private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end
