module Detail
  class Knowledge < ApplicationRecord
    include Model::Knowledge
    include Com::Ext::Taxon
  end
end
