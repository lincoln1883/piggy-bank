class TransactionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @category = Category.includes(:user, :transactions).find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc).limit(3)
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(transaction_params)
    @transaction.user_id = current_user.id

    if @transaction.save
      redirect_to categories_path, notice: 'Transaction created successfully.'
    else
      flash[:alert] = 'Transaction could not be saved validation errors.'
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.find(params[:id])
    @transaction.destroy
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id, :user_id)
  end
end
