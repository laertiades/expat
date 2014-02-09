class AddSchbToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :b, :boolean
  end
end
