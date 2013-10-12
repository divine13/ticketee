admin_user = User.create(email: "superdivine@dube.org", password: "verylongpasscode..")

admin_user.admin = true
admin_user.save

user = User.create(email: "normaldivine@ticketee.org", password: "password")
user.save

Project.create(name: "ticketee beta")