class TransactionHistoriesController < ApplicationController
  before_action :set_transaction_history, only: %i[ show edit update destroy ]
  before_action :set_current_user, only: %i[ index ]

  # GET /transaction_histories or /transaction_histories.json
  def index
    if params[:user_code].present?
      @transaction_histories  = TransactionHistory.where(owner_id: params[:user_code]).all
      current_user = User.find_by_code(params[:user_code])
    elsif params[:team_code].present?
      @transaction_histories  = TransactionHistory.where(owner_id: params[:team_code]).all
      current_user = Team.find_by_code(params[:team_code])
    elsif params[:stock_code].present?
      @transaction_histories  = TransactionHistory.where(owner_id: params[:stock_code]).all
      current_user = Stock.find_by_code(params[:wallet_code])
    end

    @wallet_balance = current_user.transaction_histories.sum(:amount).to_i
  end

  def debit
    sender_wallet = params[:debit][:sender_id].present? ? Wallet.find_by_address(params[:debit][:sender_id]) : nil
    receiver_wallet = params[:debit][:receiver_id].present? ? Wallet.find_by_address(params[:debit][:receiver_id]) : nil

    params[:debit][:receiver_id] = params[:debit][:sender_id] unless params[:debit][:receiver_id].present? 
    debit = Debit.new(params[:debit])
    if debit.valid?
      debit.save
    end

    redirect_back_or_to root_path
  end

  def credit
    params.permit!

    params[:credit][:receiver_id] = params[:credit][:sender_id] unless params[:credit][:receiver_id].present? 
    credit = Credit.new(params[:credit])
    if credit.valid?
      credit.save
    end

    redirect_back_or_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_history
      @team = TransactionHistory.find_by_number(params[:number])
    end

    def set_current_user
      if params[:user_code].present?
        @current_user = User.find_by_code(params[:user_code])
        @user_type = 'user'
      elsif params[:team_code].present?
        @current_user = Team.find_by_code(params[:team_code])
        @user_type = 'team'
      elsif params[:stock_code].present?
        @current_user = Stock.find_by_code(params[:stock_code])
        @user_type = 'stock'
      end

      set_available_transfer
    end

    def set_available_transfer
      @transfer_list = []
      @transfer_list << User.all.pluck(:code)
      @transfer_list << Team.all.pluck(:code)
      @transfer_list << Stock.all.pluck(:code)
      @transfer_list.flatten!
      @transfer_list.delete_at(@transfer_list.find_index(@current_user.code))
      @debit  = Debit.new
      @credit = Credit.new
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :email, :type)
    end
end
