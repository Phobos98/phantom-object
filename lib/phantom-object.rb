require 'hash_converter'
class PhantomObject

  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Serializers
  extend ActiveModel::Naming

  def initialize args = {}
    assign_attributes args
  end

  def assign_attributes args = {}
    args.each do |key, value|
      self.class_eval("attr_accessor :#{key}") unless self.respond_to?(key.to_sym)
      if value.is_a?(Array)
        self.send("#{key}=", value.map{ |v| self.class.new(v) })
      elsif value.is_a?(Hash)
        self.send("#{key}=", self.class.new(value))
      else
        self.send("#{key}=", value.is_a?(String) ? value.strip : value)
      end
    end
  end

  def persisted?
    false
  end

end