# frozen_string_literal: true

class CreateMoons < ActiveRecord::Migration[7.0]
  def change
    create_table :moons do |t|
      t.string :name, null: false, default: ''
      t.decimal :mass, null: false, default: 0
      t.decimal :distance_from_planet, null: false, default: 0
      t.decimal :orbital_period, null: false, default: 0
      t.boolean :tidally_locked, null: false, default: false

      t.references :planet, null: false, foreign_key: true

      t.timestamps

      t.index %i[name planet_id], unique: true
    end
  end
end
