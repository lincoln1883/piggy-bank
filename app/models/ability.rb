class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Category, user_id: user.id
    can :manage, Transaction, user_id: user.id

    return unless user.admin?

    can :manage, :all
  end
end
