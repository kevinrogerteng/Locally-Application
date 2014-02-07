users = []
users << User.create(name: 'Kevin Teng', email_address: 'kevin@gmail.com', screen_name: "panda", hometown: "San Francisco, California", password: "123456", password_confirmation: "123456")
users << User.create(name: 'Sasha Tang', email_address: "sasha@gmail.com", screen_name: "penguin", hometown: "Manhattan, New York", password: "123456", password_confirmation: "123456")

trips = []

trips << Trip.create(name: 'SF Galore', destination: "San Francisco, California", description:"moving to SF!!",)
trips << Trip.create(name: 'New York Fun!', destination: "Manhattan, New York", description:"Visiting Sasha!")
trips << Trip.create(name: 'Port Port!',  destination: "Portland, Oregon", description:"Saying hi to Granny!")
trips << Trip.create(name: 'BBQ IT!', destination: "Dallas, Texas", description:"Let's be a cowboy!")
trips << Trip.create(name: 'Comic-con!', destination: "San Diego, California", description:"I'm going as a Star member from Resident Evil!")

users[0].trips << trips[0]
users[0].trips << trips[1]
users[1].trips << trips[2]
users[1].trips << trips[3]
users[0].trips << trips[4]

activities =[]

activities << Activity.create(name: 'Metreon', address: '4th and Mission Street, San Francisco, CA', phone: 'N/A', biz_url: "https://www.facebook.com", thumbnail_photo: "http://i.imgur.com/UpJfjiF.gif")
activities << Activity.create(name: 'Westfield', address: '5th and Market Street, San Francisco, CA', phone: 'N/A', biz_url: "https://www.google.com", thumbnail_photo: "http://i.imgur.com/UpJfjiF.gif")

trips[0].activities << activities[0]
trips[0].activities << activities[1]