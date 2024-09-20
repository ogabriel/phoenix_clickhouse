defmodule ClickWeb.CarJSON do
  alias Click.Cars.Car

  @doc """
  Renders a list of cars.
  """
  def index(%{cars: cars}) do
    %{data: for(car <- cars, do: data(car))}
  end

  @doc """
  Renders a single car.
  """
  def show(%{car: car}) do
    %{data: data(car)}
  end

  defp data(%Car{} = car) do
    %{
      name: car.name,
      horse_power: car.horse_power,
      weight: car.weight,
      drivetrain: car.drivetrain,
      body_style: car.body_style,
      fuel_type: car.fuel_type,
      brand: car.brand,
      transmission: car.transmission
    }
  end
end
