class CreateItems < ActiveRecord::Migration[5.2]
  def up
    create_table :items do |t|
      t.string "name"
      t.integer "tax_code"
      t.integer "price"
      t.timestamps
    end
  end

  def down
    drop_table :items
  end
end
