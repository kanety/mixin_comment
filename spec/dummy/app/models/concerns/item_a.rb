# [required methods] method, method2
# [required class methods] method, method2
# [required override methods] override_method, override_method2
module ItemA
  extend ActiveSupport::Concern

  def call_method
    method
  end

  def call_method2
    method2
  end

  def override_method
  end

  def override_method2
  end
  
  class_methods do
    def call_method
      method
    end

    def call_method2
      method2
    end
  end
end
