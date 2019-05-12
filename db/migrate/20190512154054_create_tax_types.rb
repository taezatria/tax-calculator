class CreateTaxTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_types do |t|
      t.integer "code"
      t.string "type_name"
      t.boolean "refundable"
      t.timestamps
    end
  end
end
