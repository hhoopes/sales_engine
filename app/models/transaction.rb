class Transaction < ActiveRecord::Base
  belongs_to :invoice

  enum result: [ :success, :failed ]
end
