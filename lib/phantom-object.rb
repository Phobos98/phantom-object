require 'hash_converter'
class PhantomObject

  def initialize args = {}
    assign_attributes args
  end

  def assign_attributes args = {}
    args.each do |key, value|
      raise ArgumentError, 'Your hash has keys with whitespaces' if key.match(/\s/i)
      raise ArgumentError, 'Your hash has keys with Capital letters at the beginning' if key.match(/\A[A-Z]/)
      self.class.class_eval("attr_accessor :#{key}") unless self.respond_to?(key.to_sym)
      if value.is_a?(Array)
        self.send("#{key}=", value.map{ |v| self.class.new(v) })
      elsif value.is_a?(Hash)
        self.send("#{key}=", self.class.new(value))
      else
        self.send("#{key}=", value.is_a?(String) ? value.strip : value)
      end
    end
  end

end