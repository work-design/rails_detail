class WikiHistory < ActiveRecord::Base
  paginates_per 10

  belongs_to :wiki
  belongs_to :knowledge



  def move_to_wiki
    wiki = knowledge.wiki || knowledge.build_wiki
    wiki.commit_id = self.commit_id
    wiki.commit_message = self.commit_message
    wiki.body = self.body
    wiki.save
  end

end

# :item_id, :integer
# :user_id, :integer
# :content, :string, limit: 65535
# :comment, :string
