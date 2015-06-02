# Vigilente

El Vigilente es una aplicación apartidista y creada sin fines de lucro.

## Config

### Mailchimp:

Before configuring the Rails App, you'll need:

1. An API key.
2. An email list on MailChimp.
3. The given list ID.


**Steps:**

1. Once logged into your MailChimp account, go to [Account Settings][account]. Click the “Extras” and then [API Keys][api]. There, you'll need to create an API key.

2) To generate an email list, go to [Lists][lists]. In the top-right corner, click “Create List” to begin the process.

3) To get the ID of the list you just created, select your list; then, on the menu click "Settings" and select “List name & defaults”.
You'll need to create a [Mailchimp][mailchimp] account and to obtain:


### Rails:

Once you have both values (API Key and List Id), you'll need to set up the following env variables for production:

```
mailchimp_api_key: <%= ENV["MAILCHIMP_API_KEY"]%>
mailchimp_list_id: <%= ENV["MAILCHIMP_LIST_ID"]%>
```

_hint: You could take a look at secrets.yml if you have any doubt._

[mailchimp]:http://mailchimp.com
[account]:https://us4.admin.mailchimp.com/account/
[api]:https://us4.admin.mailchimp.com/account/api/
[lists]:https://us4.admin.mailchimp.com/lists/
