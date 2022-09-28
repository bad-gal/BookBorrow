require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create 10 users
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    location: ['US', 'UK', ''].sample
  )
end

# Create Categories
categories = [
  'Fairy tale', 'Fable', 'Fiction in verse',
  'Science', 'Computing', 'Fiction narrative',
  'Short story', 'Reference book', 'Suspense/Thriller',
  'Comic/Graphic Novel', 'Horror', 'Folklore'
]
categories.each do |genre|
  Category.create(topic: genre)
end

# Create Authors
25.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Create Books
15.times do
  Book.create(
    title: Faker::Book.title,
    publish_date: Faker::Time.backward(days: 500),
    user_id: User.all.sample.id,
    category_id: Category.all.sample.id
  )
end

# Create join for Books and Authors
Book.all.each do |book|
  counter = [1,2,3,4].sample
  author_sample = Author.all.sample(counter)

  counter.times do |index|
    BookAuthor.create(
      book_id: book.id,
      author_id: author_sample[index].id
    )
  end
end

# Create Loans
# books on loan
Loan.create(
  loan_date: Faker::Time.backward(days: 10),
  return_by: 30.days.from_now,
  status: 'on loan',
  user_id: User.all.sample.id,
  book_id: Book.last.id
)

# books returned
Loan.create(
  loan_date: 30.days.ago,
  return_by: 2.days.from_now,
  status: 'returned',
  user_id: User.all.sample.id,
  book_id: Book.first.id
)

# books overdue
Loan.create(
  loan_date: 60.days.ago,
  return_by: 30.days.ago,
  status: 'overdue',
  user_id: User.all.sample.id,
  book_id: Book.second.id
)