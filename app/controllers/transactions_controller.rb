class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions
  end

  def show
    @category = Category.find(params[:category_])
    @transaction = Transaction.find(params[:id]).where(:name, :amount)
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  def create
    @user = current_user
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(transaction_params)
    @transaction.user_id = current_user.id

    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction created successfully.'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id, :user_id)
  end
end
