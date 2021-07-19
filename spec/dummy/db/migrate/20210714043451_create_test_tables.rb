class CreateTestTables < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string  :column
      t.timestamps
    end
  end
end
