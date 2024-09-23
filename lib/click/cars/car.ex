defmodule Click.Cars.Car do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :name}
  @primary_key false
  schema "cars" do
    field :name, :string
    field :brand, Ch, type: "LowCardinality(String)"
    field :drivetrain, Ch, type: "Enum8('AWD' = 1, 'RWD' = 2, 'FWD' = 3)"
    field :transmission, Ch, type: "Enum8('Manual' = 1, 'Automatic' = 2)"
    field :fuel_type, Ch, type: "LowCardinality(String)"
    field :body_style, Ch, type: "LowCardinality(String)"
    field :horse_power, Ch, type: "UInt16"
    field :weight, Ch, type: "UInt16"
    field :options, Ch, type: "Array(LowCardinality(String))"
  end

  def changeset(car, attrs) do
    car
    |> cast(attrs, [
      :name,
      :horse_power,
      :weight,
      :drivetrain,
      :fuel_type,
      :body_style,
      :fuel_type,
      :brand,
      :transmission,
      :options
    ])
    |> validate_required([
      :name,
      :horse_power,
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
