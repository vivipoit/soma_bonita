class Admin::TransfersController < Admin::BaseController
  def new
    @transfer = Transfer.new
    @seat_types = seat_types
  end

  def create
    @transfer = Transfer.new(transfer_params)
    if @transfer.save
      redirect_to ([:admin, @transfer])
    else
      flash[:error] = "Não foi possível criar transporte."
      @seat_types = seat_types
      render :new
    end
  end

  def show
    @transfer = TransferPresenter.new(Transfer.find(params[:id]))
  end

  private

  def transfer_params
    params.require(:transfer).permit(:name, :tour_id, :seat_type)
  end

  def seat_types
    Transfer.seat_types.map do |key, _|
      [Transfer.human_attribute_name(key.to_sym), key]
    end
  end
end