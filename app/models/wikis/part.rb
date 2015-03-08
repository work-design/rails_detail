class Part < Wiki

  has_many :part_solos, :dependent => :destroy
  has_many :solos, :through => :part_solos

end