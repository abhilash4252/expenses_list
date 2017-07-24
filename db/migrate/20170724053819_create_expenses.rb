class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.text :description
      t.float :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
