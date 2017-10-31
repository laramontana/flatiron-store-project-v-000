class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    return total
  end

  def add_item(item_id)
    @line_item = self.line_items.find_by(item_id: item_id)
    if @line_item
      @line_item.quantity = @line_item.quantity + 1
      @line_item
    else
      @line_item = LineItem.new(cart_id: self.id, item_id: item_id, quantity: 1)
    end
  end

  def checkout
    self.status = "submitted"
    self.line_items.each do |line_item|
      line_item.item.inventory = line_item.item.inventory - line_item.quantity
      line_item.item.save
    end
  end

end
