class PaymentsController < ApplicationController
  
    skip_before_action :verify_authenticity_token, only: [:webhook]
  
    def webhook
      p params
      p "-----------------param------------------"
      payment_intent_id = params[:data][:object][:payment_intent]
      payment = Stripe::PaymentIntent.retrieve(payment_intent_id)
  
      listing_id = payment.metadata.listing_id
      buyer_id = payment.metadata.user_id
  
      p "-----------------receipt----------------"
      receipt_url = payment.charges.data[0].receipt_url

      p receipt_url

      #Create a payment from database and declared attributes
      Payment.create(user_id: buyer_id, listing_id: listing_id, payment_intent_id: payment_intent_id, receipt_url: receipt_url)

      p params
      p "---------------test-------------------"
   
      puts "test"
  
      # Order.create(user_id: buyer_id, listing_id: listing_id, payment_intent_id: payment_intent_id, receipt_url: receipt_url)
  
      # # pp payment
  
    end
  
    def success
      listing_id = params[:listingId]
      @listing = Listing.find(listing_id)
      @purchase = Order.find_by_listing_id(listing_id)
    end
  
end