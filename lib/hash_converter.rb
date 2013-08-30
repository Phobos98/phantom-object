class Hash
  def to_object
    PhantomObject.new self
  end
end