class TransactionsController < ApplicationController
 before_action :authenticate_user!

  def create
    user = current_user
    total_amount = params[:tot_amount].to_f

    if user.wallet.balance >= total_amount
      user.wallet.update(balance: user.wallet.balance.to_f - total_amount.to_f)        
      
      Trasaction.create(
        user: user,
        amount: -total_amount,
        transaction_type: "Debit",
        description: "Ticket purchase"
      )

      render json: { success: true }
    else
      render json: { success: false, error: "Insufficient wallet balance" }
    end
  end
end