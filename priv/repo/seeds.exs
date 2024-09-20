# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Click.Repo.insert!(%Click.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Click.Cars.Car
alias Click.Repo

drivetrain = {"AWD", "RWD", "FWD"}
transmission = {"Manual", "Automatic"}

rows =
  Enum.map(1..1000, fn _ ->
    brand = Faker.Vehicle.make()

    %{
      name: Faker.Vehicle.model(brand),
      brand: brand,
      drivetrain: elem(drivetrain, Enum.random(0..2)),
      transmission: elem(transmission, Enum.random(0..1)),
      fuel_type: Faker.Vehicle.fuel_type(),
      body_style: Faker.Vehicle.body_style(),
      horse_power: Enum.random(1..2000),
      weight: Enum.random(1..10000),
      options: Faker.Vehicle.options()
    }
  end)

Repo.insert_all(Car, rows)
