# Stripe

Stripe API client for Elixir

** Work in progress **

## Scope

The goal is to map all objects in the Stripe API 1-1

### TODO

#### Resources

- [ ] Charges
- [ ] Refunds
- [ ] Customers
- [ ] Cards
- [ ] Subscriptions
- [ ] Plans
- [ ] Coupons
- [ ] Discounts
- [ ] Invoices
- [ ] Invoice Items
- [ ] Disputes
- [ ] Transfers
- [ ] Recipients
- [ ] Application Fees
- [ ] Application Fee Refunds
- [ ] Account
- [ ] Balance
- [ ] Events
- [ ] Tokens

#### Features

- [ ] Cast nested resources

## Authentication

Authentication for Stripe's API is done via a single Bearer token. The library will check the `STRIPE_SECRET_KEY` environment variable and fallback `to Application.get_env(:stripe, :secret_key)`.

## Usage

The RESTfulness of the Stripe API makes this easy. In essence, for every object
in the Stripe ecosystem, we should be able to make calls such as:

```Elixir
Stripe.start

customers = Stripe.Customers.get
# => [%Stripe.Customer{account_balance: 0,...]

length customers
# => 10

customer = List.first customers
  # => %Stripe.Customer{account_balance: 0,
  #      cards: %{"data" => [%{"address_city" => nil, "address_country" => nil,
  #            "address_line1" => nil, "address_line1_check" => nil,
  #            "address_line2" => nil, "address_state" => nil, "address_zip" => nil,
  #            "address_zip_check" => nil, "brand" => "Visa", "country" => "US",
  #            "customer" => "cus_5HYg9UxTAsC84D", "cvc_check" => "pass",
  #            "dynamic_last4" => nil, "exp_month" => 11, "exp_year" => 2016,
  #            "fingerprint" => "Xt5EWLLDS7FJjR1c", "funding" => "credit",
  #            "id" => "card_156zZS2eZvKYlo2CcevEs4Be", "last4" => "4242", "name" => nil,
  #            "object" => "card"}], "has_more" => false, "object" => "list",
  #         "total_count" => 1, "url" => "/v1/customers/cus_5HYg9UxTAsC84D/cards"},
  #      created: 1417937711, currency: nil,
  #      default_card: "card_156zZS2eZvKYlo2CcevEs4Be", delinquent: false,
  #      description: "erikyuzwa@gmail.com", discount: nil, id: "cus_5HYg9UxTAsC84D",
  #      livemode: false, metadata: %{}, object: "customer",
  #      subscriptions: %{"data" => [], "has_more" => false, "object" => "list",
  #         "total_count" => 0,
  #         "url" => "/v1/customers/cus_5HYg9UxTAsC84D/subscriptions"}}

# Get a customer by ID
customer_id = customer.id
Stripe.Customers.get %{id: customer_id}
# => %Stripe.Customer{account_balance: 0, ...

# Get a card (nested under customers)
Stripe.Cards.get %{customer_id: customer_id, id: customer.default_card}
# => %Stripe.Card{address_city: nil, address_country: nil, address_line1: nil,
#         address_line1_check: nil, address_line2: nil, address_state: nil,
#         address_zip: nil, address_zip_check: nil, brand: "Visa", country: "US",
#         customer: "cus_5HYg9UxTAsC84D", cvc_check: "pass", dynamic_last4: nil,
#         exp_month: 11, exp_year: 2016, fingerprint: "Xt5EWLLDS7FJjR1c",
#         funding: "credit", id: "card_156zZS2eZvKYlo2CcevEs4Be", last4: "4242",
#         name: nil, object: "card"}
```
