# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
user = User.create!( email: 'admin@example.com',
              password: 'admin123',
              password_confirmation: 'admin123',
              name: 'Someone',
              title: 'Administrator',
              phone: '628123456789')

user = User.create!( email: 'editor@example.com',
              password: 'editor123',
              password_confirmation: 'editor123',
              name: 'Someone',
              title: 'Editor',
              phone: '628123456789')

user = User.create!( email: 'author@example.com',
              password: 'author123',
              password_confirmation: 'author123',
              name: 'Someone',
              title: 'Author',
              phone: '628123456789')

Setting.delete_all
Setting.create!(name: "Global",
                config: {first_time: false,
                         site_title: "Schyte Blog",
                         site_description: "Schyte Blog",
                         site_keywords: "schyte, blog",
                         google_analytics_tracking_id: "UA-XXXXXXXX-X",
                         site_footer: "Schyte Blog. Built with Ruby on Rails & Semantic UI."})
Setting.create!(name: "Social",
                config: {email: "someone@example.com",
                         whatsup: "+62-812-345-6789",
                         network: {github: {handle: "github", url: "https://github.com"},
                                   facebook: {handle: "facebook", url: "https://facebook.com"},
                                   twitter: {handle: "twitter", url: "https://twitter.com"}}
                        })
portfolio = Portfolio.create!(slug: "main",
                  title: "Someone's Portfolio",
                  description: "Someone's Portfolio",
                  keywords: "someone, portfolio",
                  name: "Someone",
                  job: "Web Developer",
                  overview: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
                  email: "someone@example.com",
                  phone: "+62-812-345-6789",
                  social: "github",
                  address: "Somewhere.",
                  address_line1: "Somewhere",
                  address_line2: "Somewhere")

Skill.create!(name: "Skill 1",
              position: 1,
              mastery: 86,
              info: nil,
              portfolio: portfolio)

Skill.create!(name: "Skill 2",
              position: 2,
              mastery: 88,
              info: nil,
              portfolio: portfolio)

Skill.create!(name: "Skill 3",
              position: 3,
              mastery: 75,
              info: nil,
              portfolio: portfolio)

Skill.create!(name: "Skill 4",
              position: 4,
              mastery: 70,
              info: nil,
              portfolio: portfolio)

Skill.create!(name: "Skill 5",
              position: 5,
              mastery: 76,
              info: nil,
              portfolio: portfolio)

Skill.create!(name: "Skill 6",
              position: 6,
              mastery: 81,
              info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
              portfolio: portfolio)

Project.create!(name: "Project 1",
                position: 1,
                timeline: "2017",
                info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                url: "#",
                portfolio: portfolio)

Project.create!(name: "Project 2",
                position: 2,
                timeline: "2017",
                info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                url: "#",
                portfolio: portfolio)

Project.create!(name: "Project 3",
                position: 3,
                timeline: "2017",
                info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                url: "#",
                portfolio: portfolio)

Project.create!(name: "Project 4",
                position: 4,
                timeline: "2017",
                info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                url: "#",
                portfolio: portfolio)

Project.create!(name: "Project 5",
                position: 5,
                timeline: "2017",
                info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                url: "#",
                portfolio: portfolio)

Post.delete_all
Post.create(title: "Lorem Ipsum",
            body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
            tags: "Lorem, Ipsum",
            visibility: "Public",
            draft: false,
            published_at: Time.zone.now,
            description: "Lorem Ipsum",
            keywords: "lorem, ipsum",
            user: user)

Post.create(title: "Lorem Ipsum Dolor",
            body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
            tags: "Lorem, Ipsum, Dolor",
            visibility: "Private",
            draft: true,
            published_at: Time.zone.now,
            description: "Lorem Ipsum",
            keywords: "lorem, ipsum",
            user: user)

Post.create(title: "Lorem Ipsum Dolor Sit",
            body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
            tags: "Lorem, Ipsum, Dolor, Sit",
            visibility: "Public",
            draft: false,
            published_at: Time.zone.now,
            description: "Lorem Ipsum",
            keywords: "lorem, ipsum",
            user: user)

Post.create(title: "Lorem Ipsum Dolor Sit Amet",
            body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>",
            tags: "Lorem, Ipsum, Dolor, Sit, Amet",
            visibility: "Public",
            draft: false,
            published_at: Time.zone.now,
            description: "Lorem Ipsum",
            keywords: "lorem, ipsum",
            user: user)