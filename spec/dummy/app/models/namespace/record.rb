class Namespace::Record < ActiveRecord::Base
  include Namespace::RecordA

  self.table_name = 'records'

  belongs_to :assoc
end
