# [required columns] column, column2
# [required associations] assoc, assoc2
module RecordA
  extend ActiveSupport::Concern

  def call_column
    column
  end

  def call_column2
    column2
  end
end
