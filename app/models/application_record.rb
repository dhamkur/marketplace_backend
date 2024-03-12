class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.add_scope_and_check_method(constants:, field_name:)
    constants.each do |constant_value|
      define_method "is_#{constant_value}?" do
        send(field_name).eql?(constant_value)
      end
      scope "#{constant_value}", -> { where("#{field_name}": constant_value) }
    end
  end
end
