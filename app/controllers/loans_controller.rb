class LoansController < ApplicationController
  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      flash[:notice] = t('loan.create.success', return_date: @loan.return_by.strftime("%a, %d %b %Y"))
      redirect_to root_path
    else
      flash[:alert] = t('loan.create.error')
      redirect_to books_path
    end
  end

  def update
    @loan = Loan.find(params[:id])
    @loan.update!(loan_params)
    redirect_to profile_path
  end

  private

  def loan_params
    params.require(:loan)
          .permit(:loan_date, :status, :book_id, :user_id, :return_by, :returned_on)
  end
end
