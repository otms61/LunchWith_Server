app = Rpush::Apns::App.new
app.name = 'lunchwith'
app.certificate = File.read('/etc/aws/auth_pem/LunchWith.pem')
app.environment = 'sandbox'
app.password = 'bdd2015'
app.connections = 1
app.save!
