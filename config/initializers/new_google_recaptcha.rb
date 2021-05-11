=begin
if Object.const_defined?('NewGoogleRecaptcha')
  NewGoogleRecaptcha.setup do |config|
    config.site_key   = "6LfZn7AZAAAAAHUru9iaAqtj09vPHyh3LzrFgO9Q"
    config.secret_key = "6LfZn7AZAAAAANXWlZ8Nod9dT3VPnA0HzsX11YRm"
    config.minimum_score = 0.5
  end
end
=end
