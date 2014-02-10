class AddDepositToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :deposit, :decimal, :precision => 6, :scale => 2, :default => 0.00
  end
end
