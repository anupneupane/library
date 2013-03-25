# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
                              {title: "Flatiron School"},
                              {title: "Funny"},
                              {title: "Music"}
                              ])

links = Link.create([
                      {url: "http://www.shakeshack.com/location/madison-square-park/"},
                      {url: "http://www.kobeyaki.com"},
                      {url: "http://shitavisays.tumblr.com/post/46018587379/i-dont-like-pandas-do-you-know-that-they-cant"},
                      {url: "http://shitavisays.tumblr.com/post/45690968517/just-try-a-bunch-of-shit-youre-trying-to-cover-a"}
                      ])

topics = Topic.create([
                        {title: "Best place to eat near school", category_id: 1},
                        {title: "Best shit that Avi says", category_id: 1},
                        {title: "Funniest cat videos", category_id: 2},
                        {title: "Best songs/albums to listen to while coding", category_id: 3}
                        ])

topic_links = TopicLink.create([
                                {link_id: 1, topic_id: 1, title: "Shake Shack", description: "Burgers, fries"},
                                {link_id: 2, topic_id: 1, title: "Kobeyaki", description: "Japanese Chipotle"},
                                {link_id: 3, topic_id: 2, title: "Pandas", description: "Avi explaining why he doesn't like pandas"},
                                {link_id: 4, topic_id: 2, title: "Art and programming", description: "Typical Avi eloquence"}
                                ])



# topics = Topic.create([{title: 'Objects'}, {title: 'Classes'},
#                        {title: "Variables"}, {title: "Strings"},
#                        {title: 'Numbers'}, {title: 'Arrays'},
#                        {title: 'Hashes'}, {title: 'Methods'},
#                        {title: 'Loops'}, {title: 'Blocks'},
#                        {title: 'Modules'}])

# links = Link.create([{url: 'http://teamtreehouse.com/library/programming/ruby-foundations/objects-classes-and-variables', topic_id: 1},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/strings', topic_id: 4},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/numbers', topic_id: 5},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/arrays', topic_id: 6},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/hashes', topic_id: 7},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/methods', topic_id: 8},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/loops', topic_id: 9},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/blocks', topic_id: 10},
#                       {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/modules', topic_id: 11},
#                       {url: 'http://ruby-doc.org/core-1.9.3/Object.html', topic_id: 1},
#                       {url: 'http://www.tutorialspoint.com/ruby/ruby_classes.htm', topic_id: 2},
#                       {url: 'http://rubylearning.com/blog/2010/11/03/do-you-understand-rubys-objects-messages-and-blocks/', topic_id: 1},
#                       {url: 'http://skilldrick.co.uk/2011/08/understanding-the-ruby-object-model/', topic_id: 1},
#                       {url: 'http://juixe.com/techknow/index.php/2007/01/22/ruby-class-tutorial/', topic_id: 2},
#                       {url: 'http://blog.rubybestpractices.com/posts/gregory/anonymous_class_hacks.html', topic_id: 2},
#                       {url: 'http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_classes.html', topic_id: 2},
#                       {url: 'http://rubymonk.com/learning/books/1/chapters/7-classes/lessons/39-classes?section=159', topic_id: 2},
#                       {url: 'http://justintallant.com/classes-in-ruby-using-getters-and-setters/', topic_id: 2},
#                       {url: 'http://ruby.about.com/od/beginningruby/ss/Introducing-Classes.htm', topic_id: 2},
#                       {url: 'http://www.techotopia.com/index.php/Understanding_Ruby_Variables', topic_id: 3},
#                       {url: 'http://ruby.bastardsbook.com/chapters/variables/', topic_id: 3},
#                       {url: 'http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/', topic_id: 2},
#                       {url: 'http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/', topic_id: 3},
#                       {url: 'http://www.rubyist.net/~slagell/ruby/instancevars.html', topic_id: 3},
#                       {url: 'http://ruby-doc.org/core-2.0/String.html', topic_id: 4},
#                       {url: 'http://zetcode.com/lang/rubytutorial/strings/', topic_id: 4},
#                       {url: 'http://ruby.bastardsbook.com/chapters/strings/', topic_id: 4},
#                       {url: 'http://www.tutorialspoint.com/ruby/ruby_strings.htm', topic_id: 4},
#                       {url: 'http://api.rubyonrails.org/classes/String.html', topic_id: 4},
#                       {url: 'http://rubylearning.com/satishtalim/numbers_in_ruby.html', topic_id: 5},
#                       {url: 'http://www.ruby-doc.org/core-2.0/Integer.html', topic_id: 5},
#                       {url: 'http://ruby.bastardsbook.com/chapters/numbers/', topic_id: 5},
#                       {url: 'http://ruby.about.com/od/advancedruby/a/bignum_3.htm', topic_id: 5},
#                       {url: 'http://pleac.sourceforge.net/pleac_ruby/numbers.html', topic_id: 5},
#                       {url: 'http://ruby.learncodethehardway.org/book/ex3.html', topic_id: 5},
#                       {url: 'http://www.ruby-doc.org/core-2.0/Array.html', topic_id: 6},
#                       {url: 'http://ruby-doc.org/core-2.0/Module.html', topic_id: 11},
#                       {url: 'http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_containers.html', topic_id: 10},
#                       {url: 'http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_containers.html', topic_id: 9},
#                       {url: 'http://ruby-doc.org/core-2.0/Method.html', topic_id: 8},
#                       {url: 'http://ruby-doc.org/core-2.0/Hash.html', topic_id: 7}
#                       ])