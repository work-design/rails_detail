class Photo < ActiveRecord::Base

  attachment :photo

  belongs_to :knowledge


end

# 开始属性列表
# :knowledge_id,        :integer
# :photo_id,    :string,  limit: 255

