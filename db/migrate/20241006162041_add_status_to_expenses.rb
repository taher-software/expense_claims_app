class AddStatusToExpenses < ActiveRecord::Migration[7.2]
  def change
    add_column :expenses, :status, :string, default: 'pending'
    reversible do |dir|
      dir.up do
        Expense.update_all(status: "pending")
      end
    end
  end
end
