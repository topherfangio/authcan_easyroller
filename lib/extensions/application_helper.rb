ApplicationHelper.class_eval {

  def provider_authenticate_link(provider)
    images = AuthcanEasyroller.config.provider_images
    link = "/auth/#{provider.to_s}"

    if images.includes?(provider.to_sym)
      link_to images[provider.to_sym], link
    else
      link_to provider.to_s, link
    end
  end

}
