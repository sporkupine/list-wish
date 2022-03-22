class AddImgPathToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :img_path, :string, :default => "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"
    #Ex:- :default =>''
  end
end
