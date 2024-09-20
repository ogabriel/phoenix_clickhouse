defmodule Click.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field :name, :string
    field :brand, Ch, type: "LowCardinality(String)"
    field :drivetrain, Ch, type: "Enum8('AWD' = 1, 'RWD' = 2, 'FWD' = 3)"
    field :transmission, Ch, type: "Enum8('Manual' = 1, 'Automatic' = 2)"
    field :fuel_type, Ch, type: "LowCardinality(String)"
    field :body_style, Ch, type: "LowCardinality(String)"
    field :horse_power, Ch, type: "UInt16"
    field :weight, Ch, type: "UInt16"
    field :options, {:array, :string}
    field :inserted_at, Ch, type: "DateTime"
    field :updated_at, Ch, type: "DateTime"
  end

  def changeset(car, attrs) do
    car
    |> cast(attrs, [
      :name,
      :horsepower,
      :weight,
      :drivetrain,
      :fuel_type,
      :body_style,
      :fuel_type,
      :brand,
      :transmission
    ])
    |> validate_required([
      :name,
      :horsepower,
      :weight,
      :drivetrain,
      :fuel_type,
      :body_style,
      :fuel_type,
      :brand,
      :transmission
    ])
  end
end
