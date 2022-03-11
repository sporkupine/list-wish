class AddSellerToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :seller, :string
  end
end
