class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.decimal :salary_per_year, null: false, precision: 10, scale: 2
      t.string :country, null: false
      t.jsonb :currency, null: false
      t.text :tags, array: true, default: []

      t.timestamps
    end
  end
end
