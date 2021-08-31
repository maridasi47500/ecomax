class Island < ApplicationRecord
has_many :cities
def self.find_by_dpt(q)
find_by(dpt: q) || find_by(dpt: 'GF')

end
end
