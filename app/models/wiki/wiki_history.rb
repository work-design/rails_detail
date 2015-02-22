class WikiHistory < ActiveRecord::Base

  paginates_per 10

  belongs_to :user
  belongs_to :sort


end