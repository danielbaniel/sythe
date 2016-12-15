class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.decimal :account_balance
      t.string :last_known_location

      t.timestamps
    end
  end
end
