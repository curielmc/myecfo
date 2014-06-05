class Allocation < ActiveRecord::Base
  INVESTMENT = {'Stocks' => 'Stocks', 'Bonds' => 'Bonds', 'Cash' => 'Cash'}
  scope :stocks, -> {where(type_investments: 'Stocks')}
  scope :bonds, -> {where(type_investments: 'Bonds')}
  scope :cash, -> {where(type_investments: 'Cash')}
end
