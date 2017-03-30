class PricePresenter < SimpleDelegator
  def season_type
    Price.human_attribute_name(__getobj__.season_type.to_sym)
  end
end
