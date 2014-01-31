class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :manager_id
      t.integer :consultant_id
      t.datetime :received
      t.datetime :assigned
      t.datetime :completed
      t.datetime :sent
      t.datetime :filed
      t.boolean :basic
      t.boolean :state
      t.boolean :f1116
      t.boolean :a
      t.boolean :c
      t.boolean :d
      t.boolean :e
      t.boolean :extension
      t.boolean :f
      t.boolean :f8938
      t.boolean :f5471
      t.decimal :fee, :precision => 6, :scale => 2, :default => 0.00
      t.decimal :cost, :precision => 6, :scale => 2, :default => 0.00

      t.timestamps
    end
    add_index :accounts, [:manager_id]
    add_index :accounts, [:consultant_id]
  end
end
