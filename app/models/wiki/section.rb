class Section < ActiveRecord::Base


  belongs_to :sort
  has_many :baikes, :foreign_key => :add_sort_id


end
