require "pry"
class CashRegister
    attr_accessor :total, :discount, :last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @item_list = []
    end

    def add_item(title, price, quantity=1)
        quantity.times {|i| @item_list << title} 
        @total += (quantity*price)
        @last_transaction = quantity*price
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            @total *= (1 - (@discount.to_f/100))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @item_list
    end

    def void_last_transaction
       @total -= @last_transaction
    end


end

