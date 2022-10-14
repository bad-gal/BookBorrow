require 'faker'

puts "Create 10 users"
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: 'pa5sw03d',
    location: ['US', 'UK', ''].sample
  )
end

puts "Create Categories"
categories = [
  'Fairy tale', 'Fable', 'Fiction in verse',
  'Science', 'Computing', 'Fiction narrative',
  'Short story', 'Reference book', 'Suspense/Thriller',
  'Comic/Graphic Novel', 'Horror', 'Folklore'
]
categories.each do |genre|
  Category.create(topic: genre)
end

puts "Create Authors"
25.times do
  Author.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "Create Books"
15.times do
  Book.create(
    title: Faker::Book.title,
    publish_year: [1969, 1999, 2022, 1974, 2011, 2019, 2009, 2020, 1984, 1989].sample,
    description: Faker::Lorem.paragraphs,
    user_id: User.all.sample.id,
    category_id: Category.all.sample.id
  )
end

puts "Add book cover images"
Book.all.each_with_index do |book, index|
  book.book_cover.attach(io: Rails.root.join("spec/fixtures/files/#{index + 1}.png").open,
                         filename: "#{index + 1}.png",
                         content_type: 'image/png')
end

puts "Create join for Books and Authors"
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

puts "Create Loans"
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
  returned_on: 5.days.ago,
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