class TransferController < ApplicationController
  @error = ActiveModel::Errors.new(self)
  def transfer
    p params
    from_id = params[:from_id]
    unless from_id && from_id.is_a?(Integer)
      puts "HERE"
      render json: @error, status: :unprocessable_entity
      return
    end
    to_id = params[:to_id]
    puts "TO ID #{to_id}"
    unless to_id && to_id.is_a?(Integer)
      puts "HERE"
      render json: @error, status: :unprocessable_entity
      return
    end
    ammount = params[:ammount]
    unless ammount && ammount.is_a?(Numeric)
      puts "HERE"
      render json: @error, status: :unprocessable_entity
      return
    end
    puts from_id
    puts to_id
    puts ammount

    from_user = User.find(from_id)
    to_user = User.find(to_id)

    unless from_user.account_balance >= ammount
      render json: @error, status: :unprocessable_entity
      return
    end

    to_user.account_balance = to_user.account_balance + ammount
    to_user.save

    render :json => {status: "success"}
  end
end
