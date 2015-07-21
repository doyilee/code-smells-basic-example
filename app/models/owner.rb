class Owner < ActiveRecord::Base
  has_many :cats

  def update_cats(name, age, fur_color, eye_color, food_type, update_food = false)
    self.cats.each do |cat|
      cat.name = name
      cat.age = age
      cat.fur_color = fur_color
      cat.eye_color = eye_color
      cat.food_type = food_type
      cat.save
    end
  end
end
