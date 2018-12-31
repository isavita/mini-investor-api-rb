class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.bigint :amount_pennies, null: false
      t.references :campaign, foreign_key: true, null: false

      t.timestamps
    end
  end
end
