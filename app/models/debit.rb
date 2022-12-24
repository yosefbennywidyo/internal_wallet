class Debit < TransactionHistory
  after_commit(on: :create) do
    self.wallet.update(balance: self.wallet.balance + self.amount)
  end
end
