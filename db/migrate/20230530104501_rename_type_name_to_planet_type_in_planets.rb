class RenameTypeNameToPlanetTypeInPlanets < ActiveRecord::Migration[7.0]
  def change
    rename_column :planets, :type, :planet_type
  end
end
