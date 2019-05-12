class Item < ApplicationRecord

  belongs_to :tax_type
  belongs_to :user

  def self.save_item(item)
    if TaxType.pluck('code').include?(item[:tax_code].to_i) && User.find(item[:userid].to_i).present?
      new_item = Item.create(
        name: item[:name],
        tax_code: item[:tax_code],
        price: item[:price],
        user_id: item[:userid],
        tax_type_id: item[:tax_code]
      )
      new_item
    end
  end
end
