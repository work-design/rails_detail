class Sort < ActiveRecord::Base
  acts_as_nested_set :counter_cache => :children_count
  acts_as_list

  has_many :posts
  has_many :parts
  has_many :solos
  has_many :wikis
  has_many :lists

  #has_many :sections
  #has_many :section_sorts, :dependent => :destroy
  has_many :ask_sorts, :dependent => :destroy
  has_many :asks, :through => :ask_sorts


end
