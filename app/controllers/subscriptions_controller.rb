class SubscriptionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    subscriber.subscribe
  end

  private
  def gibbon_params
    params.permit(:email, :name)
  end

  def subscriber
    MailchimpSubscriber.new(gibbon_params)
  end
end
