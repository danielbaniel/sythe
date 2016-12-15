class TransferController < ApplicationController
  def transfer
    error = ActiveModel::Errors.new(self)

    from_id = params[:from_id]
    unless from_id && from_id.is_a?(Integer)
      error.add(:name, "InvalidFromId")
      return render json: error, status: :unprocessable_entity
    end
    to_id = params[:to_id]
    unless to_id && to_id.is_a?(Integer)
      error.add(:name, "InvalidToId")
      return render json: error, status: :unprocessable_entity
    end
    ammount = params[:ammount]
    unless ammount && ammount.is_a?(Numeric)
      error.add(:name, "InvalidAmmount")
      return render json: error, status: :unprocessable_entity
    end

    from_user = User.find(from_id)
    to_user = User.find(to_id)

    unless from_user.account_balance >= ammount
      error.add(:name, "InsufficientFunds")
      return render json: error, status: :unprocessable_entity
    end

    to_user.account_balance = to_user.account_balance + ammount
    to_user.save

    render :json => {status: "success"}
  end
end
