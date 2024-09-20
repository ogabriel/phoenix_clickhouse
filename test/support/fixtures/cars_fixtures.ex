defmodule Click.CarsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Click.Cars` context.
  """

  @doc """
  Generate a car.
  """
  def car_fixture(attrs \\ %{}) do
    {:ok, car} =
      attrs
      |> Enum.into(%{
        name: "some name",
        brand: "some brand",
        body_style: "some body_style",
        drivetrain: "AWD",
        transmission: "Manual",
        fuel_type: "some fuel_type",
        horse_power: 42,
        weight: 42,
        options: ["some option"]
      })
      |> Click.Cars.create_car()

    car
  end
end
