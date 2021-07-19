class Record < ActiveRecord::Base
  include RecordA

  belongs_to :assoc
end
