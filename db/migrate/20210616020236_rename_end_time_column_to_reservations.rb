class RenameEndTimeColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :end_time, :end_date
  end
end
