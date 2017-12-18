require_relative('../models/eateries')
require_relative('../models/burgers')
require_relative('../models/days')
require_relative('../models/burger_deals')
require('pry-byebug')

BurgerDeal.delete_all()
Burger.delete_all()
Day.delete_all()
Eatery.delete_all()

eatery1 = Eatery.new({'name' => 'Five-Guys'})
eatery2 = Eatery.new({'name' => 'Bread-Meats-Bread'})
eatery3 = Eatery.new({'name' => 'Byron Burgers'})
eatery4 = Eatery.new({'name' => 'Belted Burgers'})
eatery5 = Eatery.new({'name' => 'Handmade Burger Co'})
eatery6 = Eatery.new({'name' => 'Braw'})
eatery7 = Eatery.new({'name' => 'McDonalds'})

eatery1.save
eatery2.save
eatery3.save
eatery4.save
eatery5.save
eatery6.save
eatery7.save


day1 = Day.new({'name' => 'Monday'})
day2 = Day.new({'name' => 'Tuesday'})
day3 = Day.new({'name' => 'Wednesday'})
day4 = Day.new({'name' => 'Thursday'})
day5 = Day.new({'name' => 'Friday'})
day6 = Day.new({'name' => 'Saturday'})
day7 = Day.new({'name' => 'Sunday'})

day1.save
day2.save
day3.save
day4.save
day5.save
day6.save
day7.save

burger1 = Burger.new({
  'name' => 'Cheeseburger',
  'price' => 6,
  'eatery_id' => eatery1.id
})
burger2 = Burger.new({
  'name' => 'Chickenburger',
  'price' => 7,
  'eatery_id' => eatery1.id
})

burger3 = Burger.new({
  'name' => 'Cheeseburger',
  'price' => 10,
  'eatery_id' => eatery2.id
})
burger4 = Burger.new({
  'name' => 'Chickenburger',
  'price' => 12,
  'eatery_id' => eatery2.id
})

burger5 = Burger.new({
  'name' => 'Cheeseburger',
  'price' => 6,
  'eatery_id' => eatery3.id
})
burger6 = Burger.new({
  'name' => 'Chickenburger',
  'price' => 10,
  'eatery_id' => eatery3.id
})

burger7 = Burger.new({
  'name' => 'Cheeseburger',
  'price' => 6,
  'eatery_id' => eatery4.id
})
burger8 = Burger.new({
  'name' => 'Chickenburger',
  'price' => 6,
  'eatery_id' => eatery4.id
})

burger9 = Burger.new({
  'name' => 'Cheeseburger',
  'price' => 6,
  'eatery_id' => eatery5.id
})
burger10 = Burger.new({
  'name' => 'Chickenburger',
  'price' => 10,
  'eatery_id' => eatery5.id
})

burger11 = Burger.new({
  'name' => 'Cheeseburger',
  'price' => 9,
  'eatery_id' => eatery6.id
})
burger12 = Burger.new({
  'name' => 'Chickenburger',
  'price' => 11,
  'eatery_id' => eatery6.id
})

burger13 = Burger.new({
  'name' => 'Cheeseburger',
  'price' => 4,
  'eatery_id' => eatery7.id
})
burger14 = Burger.new({
  'name' => 'Chickenburger',
  'price' => 4,
  'eatery_id' => eatery7.id
})

burger1.save
burger2.save
burger3.save
burger4.save
burger5.save
burger6.save
burger7.save
burger8.save
burger9.save
burger10.save
burger11.save
burger12.save
burger13.save
burger14.save

burger_deal1 = BurgerDeal.new({
  'deal_name' => '50% Off',
  'day_id' => day1.id,
  'burger_id' => burger1.id
})
burger_deal2 = BurgerDeal.new({
  'deal_name' => 'Two For Tuesday!',
  'day_id' => day2.id,
  'burger_id' => burger4.id
})
burger_deal3 = BurgerDeal.new({
  'deal_name' => 'FREE FRIES',
  'day_id' => day3.id,
  'burger_id' => burger5.id
})
burger_deal4 = BurgerDeal.new({
  'deal_name' => 'FREE FRIES & DRINK',
  'day_id' => day4.id,
  'burger_id' => burger8.id
})
burger_deal5 = BurgerDeal.new({
  'deal_name' => '25% OFF',
  'day_id' => day5.id,
  'burger_id' => burger9.id
})
burger_deal6 = BurgerDeal.new({
  'deal_name' => 'HALF PRICE',
  'day_id' => day6.id,
  'burger_id' => burger12.id
})
burger_deal7 = BurgerDeal.new({
  'deal_name' => 'BOGOF',
  'day_id' => day7.id,
  'burger_id' => burger13.id
})

burger_deal1.save
burger_deal2.save
burger_deal3.save
burger_deal4.save
burger_deal5.save
burger_deal6.save
burger_deal7.save


binding.pry
nil
