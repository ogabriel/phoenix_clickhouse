defmodule Click.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars,
             primary_key: false,
             engine: "MergeTree",
             options: [order_by: "(brand,name)"]
           ) do
      add :name, :string
      add :brand, :"LowCardinality(String)"

      add :drivetrain, :"Enum('AWD', 'RWD', 'FWD')"
      add :transmission, :"Enum('Manual', 'Automatic')"
      add :fuel_type, :"LowCardinality(String)"
      add :body_style, :"LowCardinality(String)"

      add :horse_power, :UInt16
      add :weight, :UInt16
      add :foobar, :Float32

      add :options, :"Array(LowCardinality(String))"
    end
  end
end
