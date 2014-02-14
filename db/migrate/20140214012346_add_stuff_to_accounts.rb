class AddStuffToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :began, :datetime
    add_column :accounts, :status, :string
    add_column :accounts, :mode, :string
  end
end
