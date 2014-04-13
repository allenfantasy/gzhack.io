class AddPricesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :prices, :text
  end
end
