defmodule ClickWeb.CarController do
  use ClickWeb, :controller

  alias Click.Cars
  alias Click.Cars.Car

  action_fallback ClickWeb.FallbackController

  def index(conn, _params) do
    cars = Cars.list_cars()
    render(conn, :index, cars: cars)
  end

  def create(conn, %{"car" => car_params}) do
    with {:ok, %Car{} = car} <- Cars.create_car(car_params) do
      conn
      |> put_status(:created)
      |> render(:show, car: car)
    end
  end
end
