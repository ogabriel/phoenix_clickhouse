defmodule ClickWeb.CarControllerTest do
  use ClickWeb.ConnCase

  import Click.CarsFixtures

  alias Click.Cars.Car

  @create_attrs %{
    name: "some name",
    brand: "some brand",
    body_style: "some body_style",
    drivetrain: "AWD",
    fuel_type: "some fuel_type",
    transmission: "Manual",
    weight: 42,
    horse_power: 42
  }

  @invalid_attrs %{
    name: nil,
    brand: nil,
    body_style: nil,
    drivetrain: nil,
    fuel_type: nil,
    transmission: nil,
    weight: nil,
    horse_power: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cars", %{conn: conn} do
      Click.Repo.delete_all(Car)
      conn = get(conn, ~p"/api/cars")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create car" do
    test "renders car when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/cars", car: @create_attrs)
      assert %{"name" => name} = json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/cars", car: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_car(_) do
    car = car_fixture()
    %{car: car}
  end
end
