class CreateCatalogue < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :collections do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :collections, :name, unique: true

    create_table :collection_assignments do |t|
      t.references :product, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true
      t.timestamps
    end
    add_index :collection_assignments, [ :product_id, :collection_id ], unique: true
  end
end
