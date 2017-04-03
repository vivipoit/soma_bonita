class TransferPresenter < SimpleDelegator
  def seat_type
    Transfer.human_attribute_name(__getobj__.seat_type.to_sym)
  end
end
