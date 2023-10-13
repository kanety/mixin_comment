class CreateTestTables < ActiveRecord::Migration::Current
  def change
    create_table :records do |t|
      t.string  :column
      t.timestamps
    end
  end
end
