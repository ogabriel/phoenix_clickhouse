defmodule Click.CarsTest do
  use Click.DataCase

  alias Click.Cars

  describe "cars" do
    alias Click.Cars.Car

    import Click.CarsFixtures

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

    test "list_cars/0 returns all cars" do
      Click.Repo.delete_all(Car)
      car = car_fixture()
      assert Cars.list_cars() == [car]
    end

    test "create_car/1 with valid data creates a car" do
      valid_attrs = %{
        name: "some name",
        brand: "some brand",
        body_style: "some body_style",
        drivetrain: "AWD",
        fuel_type: "some fuel_type",
        transmission: "Manual",
        weight: 42,
        horse_power: 42
      }

      assert {:ok, %Car{} = car} = Cars.create_car(valid_attrs)
      assert car.name == "some name"
      assert car.brand == "some brand"
      assert car.body_style == "some body_style"
      assert car.drivetrain == "AWD"
      assert car.fuel_type == "some fuel_type"
      assert car.transmission == "Manual"
      assert car.weight == 42
      assert car.horse_power == 42
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_car(@invalid_attrs)
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Cars.change_car(car)
    end
  end
end
