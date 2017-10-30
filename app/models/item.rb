class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items


  def self.available_items
    self.where(inventory: 1..Float::INFINITY)
  end

end
