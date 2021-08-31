class Image < ApplicationRecord
belongs_to :item
def image=(file)
if file && file != 'undefined'
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)
end
rescue NoMethodError => e
p e.message
end

end
