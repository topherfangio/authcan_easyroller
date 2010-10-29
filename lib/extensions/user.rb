module AuthcanEasyroller
  module User

    # Allows us to easily humanize our attributes in one location
    # so we don't have to do it in every view
    def self.human_attribute_name(attribute)
      self.class::HUMANIZED_COLUMNS[attribute.to_sym] || super
    end

    private

    def assign_user_roles
      if self.class.count == 0
        self.class::ROLES_MASK.each do |mask|
          self.roles += [mask];
        end
      else
        self.roles += ["user"]
      end
    end

    def self.included(base)

      # Constant variable storing roles in the system
      base.const_set('ROLES_MASK', %w[developer admin moderator user]) unless base.const_defined? 'ROLES_MASK'
      base.const_set('HUMANIZED_COLUMNS', { }) unless base.const_defined?  'HUMANIZED_COLUMNS'

      base.class_eval {

        easy_roles :roles_mask, :method => :bitmask

        # Ensure the user has the proper roles
        before_create :assign_user_roles

        # Validations
=begin
        validates_each :roles do |record, attr, value|
          # If the roles changed, and it's not a new record whose only role is "user" and there is at least 1 user already in the system...
          if record.roles_mask_changed? and not (record.new_record? and record.roles == ["user"]) and base.count > 0
            record.errors.add attr, ' can only be modified by an administrator.' if (not current_user.is_developer? and not current_user.is_admin?)
          end
        end
=end
      }
    end

  end

end
