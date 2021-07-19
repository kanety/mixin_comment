class Namespace::Item
  include Namespace::ItemA

  def method
  end

  def override_method
  end

  class << self
    def method
    end
  end
end
