class Expense < ApplicationRecord
  include Status
  belongs_to :employee

  def self.sum_amount_per_month
    select("DATE_TRUNC('month', date) AS month, SUM(amount) AS total_amount")
      .group("month")
      .order("month")
  end
end
