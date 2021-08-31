class Suggestion < ApplicationRecord
belongs_to :item
validates_uniqueness_of :title
has_many :served_items, through: :item, source: :served_items
has_many :sold_items, through: :item, source: :sold_items
has_one :island, through: :item, source: :island
  #validates :start_at, comparison: { greater_than: :end_at }

def title=(x)
write_attribute(:title,x.strip.squish)
end
def self.myisland(d)
joins(:island).where('islands.dpt' => d)
end
def toserveimage
if served_items[0]
served_items[0].image
else
""
end
end


end
