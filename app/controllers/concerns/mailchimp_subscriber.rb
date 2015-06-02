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
    ENV["MAILCHIMP_LIST_ID"]
  end

  def gb
    Gibbon::API.new ENV["MAILCHIMP_API_KEY"]
  end

  def subscribe_params
    { id: ENV["MAILCHIMP_LIST_ID"],
      email: { email: 'jparbros@gmail.com' },
      merge_vars: { FNAME: 'jorge', LNAME: 'pardinas' },
      double_optin: false
    }
  end
end
