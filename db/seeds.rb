# Clear existing data
PageTag.destroy_all
Page.destroy_all
Tag.destroy_all
User.destroy_all

# Create a user
user = User.create!(name: 'TestUser', email: 'test@example.com')

# Create tags
tag1 = Tag.create!(name: 'foo')
tag2 = Tag.create!(name: 'bar')

# Create published pages
page1 = Page.create!(
  title: '1 Page',
  content: 'This is the 1 page content',
  summary: 'Summary of the 1 page',
  user: user,
  published: true # Published page
)

page2 = Page.create!(
  title: '2 Page',
  content: 'This is the 2 page content',
  summary: 'Summary of the 2 page',
  user: user,
  published: true # Published page
)

# Create unpublished pages
page3 = Page.create!(
  title: '3 Page',
  content: 'This is the 3 page content',
  summary: 'Summary of the 3 page',
  user: user,
  published: false # Unpublished page
)

page4 = Page.create!(
  title: '4 Page',
  content: 'This is the 4 page content',
  summary: 'Summary of the 4 page',
  user: user,
  published: false # Unpublished page
)

# Create page tags
PageTag.create!(page: page1, tag: tag1)
PageTag.create!(page: page1, tag: tag2)
PageTag.create!(page: page2, tag: tag2)
PageTag.create!(page: page3, tag: tag1)
PageTag.create!(page: page4, tag: tag2)

p "Seeded with 2 published and 2 unpublished pages 😪"
