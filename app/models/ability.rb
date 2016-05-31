class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Currently all users are only admins
    if user.persisted?
      can :manage, Post
      can :manage, Event
      can :manage, Sponsor
    end
  end
end
