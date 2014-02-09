class AddMiscToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :misc, :decimal, :precision => 6, :scale => 2, :default => 0.00
  end
end
