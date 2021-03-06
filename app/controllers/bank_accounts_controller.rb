class BankAccountsController < ApplicationController
  before_action :authenticate_user!
  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.create(bank_account_params.merge(user: current_user))
    unless @bank_account.save
      flash[:alert] = 'Something went wrong. Please try again.'
      render :new
    end
  end

private

  def bank_account_params
    params.require(:bank_account).permit(:account_uri, :verification_uri)
  end
end
