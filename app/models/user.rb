class User < ActiveRecord::Base

  # Constant variable storing roles in the system
  ROLES_MASK = %w[developer admin moderator user]

  HUMANIZED_COLUMNS = {
    :email => 'E-mail'
  }


  # Associations
  has_many :prayer_topics


  # Authentication and Authorization 
  acts_as_authentic
  easy_roles :roles_mask, :method => :bitmask


  # Ensure the first user of the system is an administrator
  before_save :make_first_user_admin


  # Validations
  validates_each :roles do |record, attr, value|
    begin
      session = UserSession.find
      current_user = session.user unless session.nil?

      record.errors.add attr, ' can only be modified by an administrator.' if (User.count > 0 and record.roles_mask_changed? and not current_user.is_developer? and not current_user.is_admin?)
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
    def make_first_user_admin
      if User.count == 0
        self.roles=["admin"]
      end
    end
end
