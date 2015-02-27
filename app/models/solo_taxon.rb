class SoloTaxon < ActiveRecord::Base

  belongs_to :child, :foreign_key => :child_id, :class_name => 'Solo'
  belongs_to :parent, :foreign_key => :parent_id, :class_name => 'Solo'

end