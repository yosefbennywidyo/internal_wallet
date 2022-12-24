class Credit < TransactionHistory
  before_create do
    self.amount = self.amount * -1
  end

  after_commit(on: :create) do
    self.wallet.update(balance: self.wallet.balance + self.amount)
    
    receiver_wallet = Wallet.find_by_address(self.receiver_id)
    receiver_wallet.update(balance: receiver_wallet.balance + (self.amount * -1))

    sender_wallet = Wallet.find_by_address(self.sender_id)
    sender_wallet.update(balance: sender_wallet.balance - (self.amount * -1))
    
    test = Debit.create(
      amount: (self.amount * -1).to_d,
      owner_id: receiver_wallet.user.code,
      sender_id: self.sender_id,
      receiver_id: self.receiver_id,
      description: self.description
    )
  end
end
