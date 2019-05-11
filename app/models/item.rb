class Item < ApplicationRecord

  TAX_CODES = { 
    1 => { "type" => "Food and Beverage", "refundable" => "Yes" },
  2 => { "type" => "Tobacco", "refundable" => "No" },
  3 => { "type" => "Entertainment", "refundable" => "No" } }

  def self.save_item(item)
    if TAX_CODES.keys.include? item[:tax_code].to_i
      new_item = Item.create(
        name: item[:name],
        tax_code: item[:tax_code],
        price: item[:price]
      )
      new_item
    end
  end
end
