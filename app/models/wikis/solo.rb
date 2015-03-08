class Solo < Wiki
  include TaxonBase

  has_many :solo_parts, :dependent => :destroy
  has_many :parts, :through => :solo_parts

  has_many :solo_parents, :foreign_key => :child_id, :class_name => 'SoloTaxon', :dependent => :destroy
  has_many :solo_children, :foreign_key => :parent_id, :class_name => 'SoloTaxon', :dependent => :destroy
  has_many :parents, :through => :solo_parents, :source => :parent
  has_many :children, :through => :solo_children, :source => :child

  #acts_as_list

  def self.roots
    root_ids = SoloTaxon.where(parent_id: 0).pluck(:child_id)
    Solo.find root_ids
  end

  def siblings_and_self
    parent_ids = self.parents.pluck(:id)
    if parent_ids.blank?
      self.class.roots
    else
      child_ids = SoloTaxon.where("parent_id = ?", parent_ids).pluck(:child_id)
      self.class.find child_ids
    end
  end

end