reguler = Role.create({name: "Regular", description: "Can read items"})
seller = Role.create({name: "Seller", description: "Can read and create items. Can update and destroy own items"})
admin = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

john = User.create(email: 'john@moka.com', password: '000000', password_confirmation: '000000', first_name: 'John', last_name: 'Doe',role_id: reguler.id)
jane = User.create(email: 'jane@moka.com', password: '111111', password_confirmation: '111111', first_name: 'Jane', last_name: 'Doe',role_id: seller.id)
nazmy = User.create(email: 'nazmy@moka.com', password: 'password', password_confirmation: 'password', first_name: 'Achmad', last_name: 'Nazmy',role_id: admin.id)


jj_cafe = Business.create(name: 'JJ Cafe', address: 'JL Gatot Subroto 25F', city: 'Jakarta Pusat', user_id: john.id)
xo_shop = Business.create(name: 'XO Shop', address: 'JL Kebon Jeruk 55', city: 'Jakarta Barat', user_id: jane.id)

jj_cafe_items = Item.create([
  { name: 'Americano', price: 15000, business_id: jj_cafe.id },
  { name: 'Cappucino', price: 30000, business_id: jj_cafe.id },
  { name: 'Latte', price: 25000, business_id: jj_cafe.id },
  { name: 'Mocha', price: 30000, business_id: jj_cafe.id },
  { name: 'Apple Pie', price: 30000, business_id: jj_cafe.id }
])

xo_shop_items = Item.create([
  { name: 'T-Shirt', price: 25000, business_id: xo_shop.id },
  { name: 'Long Sleeve', price: 40000, business_id: xo_shop.id },
  { name: 'Short Pants', price: 35000, business_id: xo_shop.id },
  { name: 'Long Pants', price: 40000, business_id: xo_shop.id },
  { name: 'Underwear', price: 25000, business_id: xo_shop.id }
])
