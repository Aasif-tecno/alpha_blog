module ApplicationHelper
  def gravatar_for(current_user, option = {size: 80})
    email_address = current_user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = option[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: current_user.email, class:"rounded  mx-auto d-block")
  end
end
