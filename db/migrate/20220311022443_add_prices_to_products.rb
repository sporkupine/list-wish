class AddPricesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :price, :int
  end
end
