class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, :all
    can :manage, UserSession

    if current_user
      # Abilities for someone with an account (does not necessarily have a "user" role)
      can [:update, :destroy], User do |user|
        user == current_user
      end


      # User role abilities
      if current_user.is_user?
      end


      # Moderator role abilities
      if current_user.is_moderator?
      end


      # Admin role abilities
      if current_user.is_admin?
        can :manage, :all
      end


      # Developer role abilities
      if current_user.is_developer?
        can :manage, :all
      end
    else
      can :create, User
    end

  end

end
