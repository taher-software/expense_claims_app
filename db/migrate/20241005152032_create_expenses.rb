class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.text :description
      t.decimal :amount
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
