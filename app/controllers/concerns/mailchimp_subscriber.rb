class MailchimpSubscriber
  attr_accessor :email, :fname, :lname, :errors

  def initialize(args)
    @email = args[:email]
    @fname, @lname = args[:name].split(' ')
    self
  end

  def subscribe
    begin
      gb.lists.subscribe(subscribe_params)
    rescue Gibbon::MailChimpError => e
      @errors = e
    end
  end

  private
  def gibbon_list_id
    Rails.application.secrets.mailchimp_list_id
  end

  def gb
    Gibbon::API.new
  end

  def subscribe_params
    { id: gibbon_list_id,
      email: { email: email },
      merge_vars: { FNAME: fname, LNAME: lname }
    }
  end
end
