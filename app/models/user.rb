class User < ActiveRecord::Base

  # Constant variable storing roles in the system
  ROLES_MASK = %w[developer admin moderator user]

  HUMANIZED_COLUMNS = {
    :email => 'E-mail'
  }


  # Authentication and Authorization 
  acts_as_authentic do |config|
    config.logged_in_timeout = 1.hour
  end

  easy_roles :roles_mask, :method => :bitmask


  # Ensure the user has the proper roles
  before_create :assign_user_roles


  # Validations
  validates_each :roles do |record, attr, value|
    begin
      # If the roles changed, and it's not a new record whose only role is "user" and there is at least 1 user already in the system...
      if record.roles_mask_changed? and not (record.new_record? and record.roles == ["user"]) and User.count > 0
        session = UserSession.find
        current_user = session.user unless session.nil?

        record.errors.add attr, ' can only be modified by an administrator.' if (not current_user.is_developer? and not current_user.is_admin?)
      end
    rescue Authlogic::Session::Activation::NotActivatedError
      # Do nothing, we are in a console session
    end
  end


  # Allows us to easily humanize our attributes in one location
  # so we don't have to do it in every view
  def self.human_attribute_name(attribute)
    HUMANIZED_COLUMNS[attribute.to_sym] || super
  end

  private
    def assign_user_roles
      self.roles += ["user"]

      if User.count == 0
        self.roles += ["admin"]
        self.roles += ["moderator"]
      end
    end
end
