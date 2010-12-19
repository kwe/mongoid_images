require 'dragonfly'

app = Dragonfly[:images]

# Get database name from config/mongoid.yml
db = YAML.load_file(Rails.root.join('config/mongoid.yml'))[Rails.env]['database']

# Configure to use ImageMagick, Rails defaults, and the Mongo data store
app.configure_with(:imagemagick)
app.configure_with(:rails) do |c|
  c.datastore = Dragonfly::DataStorage::MongoDataStore.new :database => db
  c.protect_from_dos_attacks = true
  c.secret = 'duduhd dudgugsugd674683ydugdy8yw89t78e'
  
end

app.url_suffix = '.jpg'
# 
# Allow all mongoid models to use the macro 'image_accessor'
app.define_macro_on_include(Mongoid::Document, :image_accessor)

