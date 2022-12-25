# README

## Internal Wallet

### Requirements

* Ruby version: 3.1.2p20
* Rails version: 7.0.4

### Test

```bash
rails db:create
rails db:migrate

rails assets:precompile

rails test
# 47.48% covered
```

### Development

```bash
rails db:create
rails db:migrate

foreman start -f Procfile.dev
```
