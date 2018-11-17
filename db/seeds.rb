# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Resource.create(
  [
    { path: "https://www.texastribune.org", subtype: :domain },
    { path: "https://www.google.com", subtype: :domain },
    { path: "https://www.washingtonpost.com/world/national-security/cia-concludes-saudi-crown-prince-ordered-jamal-khashoggis-assassination/2018/11/16/98c89fe6-e9b2-11e8-a939-9469f1166f9d_story.html?utm_term=.b9db8b0b3657", subtype: :url}
  ]
)
