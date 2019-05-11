class TaxBillController < ActionController::Base
  
  def home
    render :tax
  end

  def get_taxes
    if params[:name].present? && params[:tax_code].present? && params[:price].present?
      new_item = Item.save_item(params)
    end
    render :tax
  end

  def calculate
    result = []
    Item.all.each do |item|
      temp_item = {}
      if item.tax_code == 1
        temp_item = Item::TAX_CODES[1]
        temp_item["tax_code"] = 1
        temp_item["name"] = item.name
        temp_item["price"] = item.price
        temp_item["tax"] = 0.1*item.price
        temp_item["amount"] = temp_item["tax"] + item.price
      elsif item.tax_code == 2
        temp_item = Item::TAX_CODES[2]
        temp_item["tax_code"] = 2
        temp_item["name"] = item.name
        temp_item["price"] = item.price
        temp_item["tax"] = (0.02*item.price) + 10
        temp_item["amount"] = temp_item["tax"] + item.price
      elsif item.tax_code == 3
        temp_item = Item::TAX_CODES[3]
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
      result.push temp_item
    end
    render :json => result
  end
end