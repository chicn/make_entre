class AddMainImageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :main_image, :text
  end
end
