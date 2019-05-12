class TaxBillController < ActionController::Base
  
  def home
    render :tax
  end

  def save_item
    if params[:userid].present? && params[:name].present? && params[:tax_code].present? && params[:price].present?
      User.create unless User.ids.include? params[:userid].to_i
      new_item = Item.save_item(params)
    end
    render :json => { status: new_item.present? }
  end

  def get_bills
    if params[:userid].present? && User.ids.include?(params[:userid].to_i)
      result = []
      total = { "price_subtotal" => 0, "tax_subtotal" => 0, "grand_total" => 0 }
      Item.all.where(user_id: params[:userid].to_i).each do |item|
        temp_item = {}
        if item.tax_code == 1
          temp_item = TaxType.find(1).as_json
          temp_item["tax_code"] = 1
          temp_item["name"] = item.name
          temp_item["price"] = item.price
          temp_item["tax"] = 0.1*item.price
          temp_item["amount"] = temp_item["tax"] + item.price
        elsif item.tax_code == 2
          temp_item = TaxType.find(2).as_json
          temp_item["tax_code"] = 2
          temp_item["name"] = item.name
          temp_item["price"] = item.price
          temp_item["tax"] = (0.02*item.price) + 10
          temp_item["amount"] = temp_item["tax"] + item.price
        elsif item.tax_code == 3
          temp_item = TaxType.find(3).as_json
          temp_item["tax_code"] = 3
          temp_item["name"] = item.name
          temp_item["price"] = item.price
          if item.price.between?(0,100)
            temp_item["tax"] = 0
          elsif item.price >= 100
            temp_item["tax"] = (item.price-100)*0.01
          end
          temp_item["amount"] = temp_item["tax"] + item.price
        end
        total["price_subtotal"] += temp_item["price"]
        total["tax_subtotal"] += temp_item["tax"]
        total["grand_total"] += temp_item["amount"]
        result.push temp_item
      end
      result.push total
    end
    render :json => result
  end
end