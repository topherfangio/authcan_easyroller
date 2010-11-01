module AuthcanEasyroller
  class Configuration

    attr_accessor :provider_images

    def initialize
      @provider_images ||= {}
    end

    def provider_images=(image_hash = {})
      @provider_images.merge!(image_hash)
    end

  end
end
