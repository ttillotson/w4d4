class FixBandsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :bands
  end
end
