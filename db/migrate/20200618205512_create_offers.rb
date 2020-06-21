class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers, id: :uuid do |t|
      t.string :advertiser_name, null: false, unique: true
      t.string :url, null: false
      t.text :description, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.boolean :premium
      t.boolean :state, default: false, null: false

      t.timestamps
    end
  end
end
