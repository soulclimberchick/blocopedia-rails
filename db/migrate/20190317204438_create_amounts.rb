class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.timestamps null: false
    end
  end
end
