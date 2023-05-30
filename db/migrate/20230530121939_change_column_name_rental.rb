class ChangeColumnNameRental < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :location_start, :rental_start
    rename_column :bookings, :location_end, :rental_end
  end
end
