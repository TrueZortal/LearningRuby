defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount), do: before_discount * ((100 - discount)/100)

  def monthly_rate(hourly_rate, discount) do
    trunc(
      Float.ceil(
          apply_discount((8 * 22 * hourly_rate), discount)
        )
      )
  end

  def days_in_budget(budget, hourly_rate, discount) do
    Float.floor(
        budget / apply_discount(daily_rate(hourly_rate),discount),1
      )
  end
end
