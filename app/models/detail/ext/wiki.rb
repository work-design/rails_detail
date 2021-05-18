module Detail
  module Ext::Wiki
    extend ActiveSupport::Concern

    included do
      has_one :wiki, as: :reportable, dependent: :destroy
      has_many :wikis, as: :reportable, dependent: :destroy
    end

    module ClassMethods

      def define_report(name)

        define_method "#{name}_id" do
          self.report_lists.find_or_create_by_reportable_name(name).id
        end

      end

    end

  end
end
