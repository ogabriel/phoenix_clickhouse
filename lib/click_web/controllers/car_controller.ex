defmodule ClickWeb.CarController do
  use ClickWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias Click.Cars
  alias Click.Cars.Car
  alias ClickWeb.Schemas.Car

  action_fallback ClickWeb.FallbackController

  operation :index, false

  def index(conn, _params) do
    cars = Cars.list_cars()
    render(conn, :index, cars: cars)
  end

  operation :create,
    summary: "Create car",
    request_body: {"Car params", "application/json", Car},
    responses: [
      created: {"Car response", "application/json", Car}
    ]

  def create(conn, %{"car" => car_params}) do
    with {:ok, %Car{} = car} <- Cars.create_car(car_params) do
      conn
      |> put_status(:created)
      |> render(:show, car: car)
    end
  end
end
