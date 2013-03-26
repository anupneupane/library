# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { :username => "john",
    :email => "john.ferguson@flatironschool.com",
    :role => 10,
    :password => "flatiron"},
  { :username => "rahul",
    :email => "rahul.seshan@flatironschool.com",
    :role => 10,
    :password => "flatiron"},
  { :username => "laura",
    :email => "laura.brown@flatironschool.com",
    :role => 10,
    :password => "flatiron"},
  { :username => "basic",
    :email => "basic@basic.com",
    :role => 0,
    :password => "basic"}
  ])

categories = Category.create([
                              {title: "Flatiron School"},
                              {title: "Funny"},
                              {title: "Music"},
                              {title: "Prework"}
                              ])

links = Link.create([
                      {url: "http://www.shakeshack.com/location/madison-square-park/"}, #1
                      {url: "http://www.kobeyaki.com"}, #2
                      {url: "http://shitavisays.tumblr.com/post/46018587379/i-dont-like-pandas-do-you-know-that-they-cant"}, #3
                      {url: "http://shitavisays.tumblr.com/post/45690968517/just-try-a-bunch-of-shit-youre-trying-to-cover-a"}, #4
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/objects-classes-and-variables'}, #5
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/strings'}, #6
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/numbers'}, #7
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/arrays'}, #8
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/hashes'}, #9
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/methods'}, #10
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/loops'}, #11
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/blocks'}, #12
                      {url: 'http://teamtreehouse.com/library/programming/ruby-foundations/modules'}, #13
                      {url: 'http://ruby-doc.org/core-1.9.3/Object.html'}, #14
                      {url: 'http://www.tutorialspoint.com/ruby/ruby_classes.htm'}, #15
                      {url: 'http://rubylearning.com/blog/2010/11/03/do-you-understand-rubys-objects-messages-and-blocks/'}, #16
                      {url: 'http://skilldrick.co.uk/2011/08/understanding-the-ruby-object-model/'}, #17
                      {url: 'http://juixe.com/techknow/index.php/2007/01/22/ruby-class-tutorial/'}, #18
                      {url: 'http://blog.rubybestpractices.com/posts/gregory/anonymous_class_hacks.html'}, #19
                      {url: 'http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_classes.html'}, #20
                      {url: 'http://rubymonk.com/learning/books/1/chapters/7-classes/lessons/39-classes?section=159'}, #21
                      {url: 'http://justintallant.com/classes-in-ruby-using-getters-and-setters/'}, #22
                      {url: 'http://ruby.about.com/od/beginningruby/ss/Introducing-Classes.htm'}, #23
                      {url: 'http://www.techotopia.com/index.php/Understanding_Ruby_Variables'}, #24
                      {url: 'http://ruby.bastardsbook.com/chapters/variables/'}, #25
                      {url: 'http://www.railstips.org/blog/archives/2006/11/18/class-and-instance-variables-in-ruby/'}, #26
                      {url: 'http://www.rubyist.net/~slagell/ruby/instancevars.html'}, #27
                      {url: 'http://ruby-doc.org/core-2.0/String.html'}, #28
                      {url: 'http://zetcode.com/lang/rubytutorial/strings/'}, #29
                      {url: 'http://ruby.bastardsbook.com/chapters/strings/'}, #30
                      {url: 'http://www.tutorialspoint.com/ruby/ruby_strings.htm'}, #31
                      {url: 'http://api.rubyonrails.org/classes/String.html'}, #32
                      {url: 'http://rubylearning.com/satishtalim/numbers_in_ruby.html'}, #33
                      {url: 'http://www.ruby-doc.org/core-2.0/Integer.html'}, #34
                      {url: 'http://ruby.bastardsbook.com/chapters/numbers/'}, #35
                      {url: 'http://ruby.about.com/od/advancedruby/a/bignum_3.htm'}, #36
                      {url: 'http://pleac.sourceforge.net/pleac_ruby/numbers.html'}, #37
                      {url: 'http://ruby.learncodethehardway.org/book/ex3.html'}, #38
                      {url: 'http://www.ruby-doc.org/core-2.0/Array.html'}, #39
                      {url: 'http://ruby-doc.org/core-2.0/Module.html'}, #40
                      {url: 'http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_containers.html'}, #41
                      {url: 'http://ruby-doc.org/core-2.0/Method.html'}, #42
                      {url: 'http://ruby-doc.org/core-2.0/Hash.html'} #43
                      ])

topics = Topic.create([
                        {title: "Best place to eat near school", category_id: 1}, #1
                        {title: "Best shit that Avi says", category_id: 1}, #2
                        {title: "Funniest cat videos", category_id: 2}, #3
                        {title: "Best songs/albums to listen to while coding", category_id: 3}, #4
                        {title: 'Objects', category_id: 1}, #5
                        {title: 'Classes', category_id: 1}, #6
                        {title: "Variables", category_id: 1}, #7
                        {title: "Strings", category_id: 1}, #8
                        {title: 'Numbers', category_id: 1}, #9
                        {title: 'Arrays', category_id: 1}, #10
                        {title: 'Hashes', category_id: 1}, #11
                        {title: 'Methods', category_id: 1}, #12
                        {title: 'Loops', category_id: 1}, #13
                        {title: 'Blocks', category_id: 1}, #14
                        {title: 'Modules', category_id: 1} #15
                        ])

topic_links = TopicLink.create([
                                {link_id: 1, topic_id: 1, title: "Shake Shack", description: "Burgers, fries"},
                                {link_id: 2, topic_id: 1, title: "Kobeyaki", description: "Japanese Chipotle"},
                                {link_id: 3, topic_id: 2, title: "Pandas", description: "Avi explaining why he doesn't like pandas"},
                                {link_id: 4, topic_id: 2, title: "Art and programming", description: "Typical Avi eloquence"},
                                {link_id: 5, topic_id: 5, title: "Objects", description: "Objects"},
                                {link_id: 6, topic_id: 8, title: "Strings", description: "Strings"},
                                {link_id: 7, topic_id: 9, title: "Numbers", description: "Numnbers"},
                                {link_id: 8, topic_id: 10, title: "Arrays", description: "Arrays"},
                                {link_id: 9, topic_id: 11, title: "Hashes", description: "Hashes"},
                                {link_id: 10, topic_id: 12, title: "Methods", description: "Methods"},
                                {link_id: 11, topic_id: 13, title: "Loops", description: "Loops"},
                                {link_id: 12, topic_id: 14, title: "Blocks", description: "Blocks"},
                                {link_id: 13, topic_id: 15, title: "Modules", description: "Modules"},
                                {link_id: 14, topic_id: 5, title: "Objects", description: "Objects"},
                                {link_id: 15, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 16, topic_id: 5, title: "Objects", description: "Objects"},
                                {link_id: 17, topic_id: 5, title: "Objects", description: "Objects"},
                                {link_id: 18, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 19, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 20, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 21, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 22, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 23, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 24, topic_id: 7, title: "Variables", description: "Variables"},
                                {link_id: 25, topic_id: 7, title: "Variables", description: "Variables"},
                                {link_id: 26, topic_id: 6, title: "Classes", description: "Classes"},
                                {link_id: 27, topic_id: 7, title: "Variables", description: "Variables"},
                                {link_id: 28, topic_id: 8, title: "Strings", description: "Strings"}, 
                                {link_id: 29, topic_id: 8, title: "Strings", description: "Strings"},
                                {link_id: 30, topic_id: 8, title: "Strings", description: "Strings"},
                                {link_id: 31, topic_id: 8, title: "Strings", description: "Strings"},
                                {link_id: 32, topic_id: 8, title: "Strings", description: "Strings"},
                                {link_id: 33, topic_id: 9, title: "Numbers", description: "Numbers"},
                                {link_id: 34, topic_id: 9, title: "Numbers", description: "Numbers"},
                                {link_id: 35, topic_id: 9, title: "Numbers", description: "Numbers"},
                                {link_id: 36, topic_id: 9, title: "Numbers", description: "Numbers"},
                                {link_id: 37, topic_id: 9, title: "Numbers", description: "Numbers"},
                                {link_id: 38, topic_id: 9, title: "Numbers", description: "Numbers"},
                                {link_id: 39, topic_id: 10, title: "Arrays", description: "Arrays"},
                                {link_id: 40, topic_id: 15, title: "Modules", description: "Modules"},
                                {link_id: 41, topic_id: 14, title: "Blocks", description: "Blocks"},
                                {link_id: 42, topic_id: 12, title: "Methods", description: "Methods"},
                                {link_id: 43, topic_id: 11, title: "Hashes", description: "Hashes"}
                                ])