module CitizensHelper

  # Returns the Gravatar (http://gravatar.com/) for the given citizen.
  def gravatar_for(citizen, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(citizen.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"

    image_tag(gravatar_url, alt: citizen.name, class: "gravatar")
  end


end
