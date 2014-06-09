class Allocation < ActiveRecord::Base
  INVESTMENT = {'Stocks' => 'Stocks', 'Bonds' => 'Bonds', 'Cash' => 'Cash'}

  scope :stocks, -> {where(type_investments: 'Stocks').order(:year)}
  scope :bonds, -> {where(type_investments: 'Bonds').order(:year)}
  scope :cash, -> {where(type_investments: 'Cash').order(:year)}


  def self.serialize_allocation(type_investment)
    self.send(type_investment).collect { |x| {x.year => x.bills}}.to_json
  end
end
