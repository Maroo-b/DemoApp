class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.class.name == "Admin"
      can :manage, :all
    else
      can :read, :all
      can :update ,Article, :user_id => user.id
      can :manage, Article
    end
  end
  
end
