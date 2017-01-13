class Ability
  include CanCan::Ability

  def initialize(user)
      
      user ||= User.new # guest user (not logged in)

      if user.role.name == "Admin"
        #Admin can only manage his own business, items and users
         can :create, Business
         can :update, Business do |business|
            business.try(:user) == user
         end
         can :create, Item
         can :manage, Item do |item|
            item.try(:business).try(:user) == user
         end
         can :create, User
         can :manage, User do |user|
            user.try(:business).try(:user) == user
         end
      elsif user.role.name ==  "Seller"
        #Seller can only manage his own business and items.
         can :create, Business
         can :create, Item
         can :manage, Item do |item|
            item.try(:business).try(:user) == user
         end
      elsif user.role.name ==  "Regular"
        can :create, Business
        #Reguler can only read his own business and items.
        can :read, Item do |item|
            item.try(:business).try(:user) == user
         end
      end
    
    
  end
end
