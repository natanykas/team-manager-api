class CreateTypeContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :type_contracts do |t|
      t.integer :name, null: false
      t.integer :duration, null: false
      t.integer :role, null: false
      t.references :member, null: false

      t.timestamps
    end
  end
end
