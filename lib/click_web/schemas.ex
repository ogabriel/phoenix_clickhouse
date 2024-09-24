defmodule ClickWeb.Schemas do
  alias OpenApiSpex.Schema

  # field :name, :string
  # field :brand, Ch, type: "LowCardinality(String)"
  # field :drivetrain, Ch, type: "Enum8('AWD' = 1, 'RWD' = 2, 'FWD' = 3)"
  # field :transmission, Ch, type: "Enum8('Manual' = 1, 'Automatic' = 2)"
  # field :fuel_type, Ch, type: "LowCardinality(String)"
  # field :body_style, Ch, type: "LowCardinality(String)"
  # field :horse_power, Ch, type: "UInt16"
  # field :weight, Ch, type: "UInt16"
  # field :options, Ch, type: "Array(LowCardinality(String))"

  defmodule Car do
    require OpenApiSpex

    OpenApiSpex.schema(%{
      title: "Car",
      description: "A car",
      type: "object",
      properties: %{
        name: %Schema{
          type: "string",
          description: "The name of the car"
        },
        brand: %Schema{
          type: "string",
          description: "The brand of the car"
        },
        drivetrain: %Schema{
          type: "string",
          description: "The drivetrain of the car"
        },
        transmission: %Schema{
          type: "string",
          description: "The transmission of the car"
        },
        fuel_type: %Schema{
          type: "string",
          description: "The fuel type of the car"
        },
        body_style: %Schema{
          type: "string",
          description: "The body style of the car"
        },
        horse_power: %Schema{
          type: "integer",
          description: "The horse power of the car"
        },
        weight: %Schema{
          type: "integer",
          description: "The weight of the car"
        },
        options: %Schema{
          type: "array",
          items: %Schema{
            type: "string"
          },
          description: "The options of the car"
        }
      },
      required: [
        :name,
        :brand,
        :drivetrain,
        :transmission,
        :fuel_type,
        :body_style,
        :horse_power,
        :weight,
        :options
      ]
    })
  end
end
