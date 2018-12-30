class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.bigint :target_amount_pennies, null: false
      t.bigint :multiplier_amount_pennies, null: false, default: 1
      t.bigint :raised_amount_pennies, null: false, default: 0
      t.string :image_url
      t.string :sector
      t.string :country_name

      t.timestamps
    end

    add_index :campaigns, :name, unique: true
  end
end
