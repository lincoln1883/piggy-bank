class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc).limit(3)
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
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(transaction_params)
    @transaction.user_id = current_user.id

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to categories_path, notice: 'Transaction created successfully.' }
      else
        format.html { render action: 'new', unprocessable_entity: @transaction }
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id, :user_id)
  end
end
