class Ability
  include CanCan::Ability

  def initialize(current_user)
    can :read, :all
    can :manage, UserSession

    if current_user
      can [:update, :destroy], User do |user|
        user == current_user
      end

      if current_user.is_developer? || current_user.is_admin?
        can :manage, :all
      end
    else
      can :create, User
    end

  end

end
