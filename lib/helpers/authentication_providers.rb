module AuthenticationProviders

  def provider_authenticate_link(provider)
    images = AuthcanEasyroller.config.provider_images
    link = "/auth/#{provider.to_s}"

    if images.key?(provider.to_sym)
      return link_to(image_tag(images[provider.to_sym]), link)
    else
      return link_to provider.to_s, link
    end
  end

end
