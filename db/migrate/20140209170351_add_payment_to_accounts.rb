class AddPaymentToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :payment, :decimal, :precision => 6, :scale => 2, :default => 0.00
  end
end
