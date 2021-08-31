class Item < ApplicationRecord
has_many :served_items
accepts_nested_attributes_for :served_items
has_many :sold_items
accepts_nested_attributes_for :sold_items
belongs_to :city
has_one :island, through: :city, source: :island
def self.from(d)
joins(:island).where('islands.dpt = ?', d)
end
def toserveimage
served_items[0].image
end

end
