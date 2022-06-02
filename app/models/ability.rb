# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, Book
      can %i(read update), BookRequest
    else
      can :read, Book
      can %i(read create delete), BookRequest, user: user
    end
  end 
end