class AddColumnToMobile < ActiveRecord::Migration
  def change
    add_column :mobiles, :user_id, :integer
  end
end
