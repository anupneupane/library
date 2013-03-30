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
                              {title: "Flatiron School"}, #1
                              {title: "Funny"}, #2
                              {title: "Music"}, #3
                              {title: "Prework"}, #4
                              {title: "Social"} #5
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
                      {url: 'http://ruby-doc.org/core-2.0/Hash.html'}, #43
                      {url: 'http://myspace.com'} #44
                      ])

topics = Topic.create([
                        {title: "Best place to eat near school", category_id: 1, user_id: 1}, #1
                        {title: "Best shit that Avi says", category_id: 1, user_id: 1}, #2
                        {title: "Funniest cat videos", category_id: 2, user_id: 1}, #3
                        {title: "Best songs/albums to listen to while coding", category_id: 3, user_id: 1}, #4
                        {title: 'Objects', category_id: 4, user_id: 2}, #5
                        {title: 'Classes', category_id: 4, user_id: 2}, #6
                        {title: "Variables", category_id: 4, user_id: 2}, #7
                        {title: "Strings", category_id: 4, user_id: 2}, #8
                        {title: 'Numbers', category_id: 4, user_id: 3}, #9
                        {title: 'Arrays', category_id: 4, user_id: 3}, #10
                        {title: 'Hashes', category_id: 4, user_id: 3}, #11
                        {title: 'Methods', category_id: 4, user_id: 3}, #12
                        {title: 'Loops', category_id: 4, user_id: 4}, #13
                        {title: 'Blocks', category_id: 4, user_id: 4}, #14
                        {title: 'Modules', category_id: 4, user_id: 4}, #15
                        {title: 'Best Social Network', category_id: 5, user_id: 4}, #16
                        {title: 'Best Place to Find Local Bands', category_id: 3, user_id: 4}, #17
                        {title: 'Best site to meet people', category_id: 5, user_id: 3} #18
                        ])

topic_links = TopicLink.create([
                                {link_id: 1, topic_id: 1, user_id: 1, title: "Shake Shack", description: "Burgers, fries"},
                                {link_id: 2, topic_id: 1, user_id: 1, title: "Kobeyaki", description: "Japanese Chipotle"},
                                {link_id: 3, topic_id: 2, user_id: 1, title: "Pandas", description: "Avi explaining why he doesn't like pandas"},
                                {link_id: 4, topic_id: 2, user_id: 1, title: "Art and programming", description: "Typical Avi eloquence"},
                                {link_id: 5, topic_id: 5, user_id: 1, title: "Treehouse Course on Ruby Objects, Classes, and Variables", description: "Video course on Treehouse to learn about Objects, Classes, and Variables in Ruby"},
                                {link_id: 5, topic_id: 6, user_id: 1, title: "Treehouse Course on Ruby Objects, Classes, and Variables", description: "Video course on Treehouse to learn about Objects, Classes, and Variables in Ruby"},
                                {link_id: 5, topic_id: 7, user_id: 1, title: "Treehouse Course on Ruby Objects, Classes, and Variables", description: "Video course on Treehouse to learn about Objects, Classes, and Variables in Ruby"},
                                {link_id: 6, topic_id: 8, user_id: 1, title: "Team Treehouse Presents Videos About Strings", description: "An in depth look at strings from Treehouse"},
                                {link_id: 7, topic_id: 9, user_id: 1, title: "Team Treehouse: Ruby Foundations: Numbers", description: "How to code with numbers in ruby"},
                                {link_id: 8, topic_id: 10, user_id: 2, title: "Team Treehouse: Ruby Foundations: Arrays", description: "Understanding Arrays in Ruby"},
                                {link_id: 9, topic_id: 11, user_id: 3, title: "Team Treehouse: Ruby Foundations: Hashes", description: "How to use Hashes in Ruby"},
                                {link_id: 10, topic_id: 12, user_id: 4, title: "Team Treehouse: Ruby Foundations: Methods", description: "An exploration of how to use Methods"},
                                {link_id: 11, topic_id: 13, user_id: 1, title: "Team Treehouse: Ruby Foundations: Loops", description: "Loops, Iteration, in Ruby"},
                                {link_id: 12, topic_id: 14, user_id: 2, title: "Team Treehouse: Ruby Foundations: Blocks", description: "Understanding Blocks"},
                                {link_id: 13, topic_id: 15, user_id: 3, title: "Team Treehouse: Ruby Foundations: Modules", description: "An explanation of when to use Modules as wrappers"},
                                {link_id: 14, topic_id: 5, user_id: 4, title: "Class: Object (Ruby 1.9.3)", description: "Official Ruby Documentation on Objects"},
                                {link_id: 15, topic_id: 6, user_id: 1, title: "Ruby Classes and Objects", description: "Tutorials Point provides a good overview of Ruby Classes and Objects"},
                                {link_id: 16, topic_id: 5, user_id: 2, title: "Do You Understand Ruby Objects, Messages and Blocks?", description: "A good introductory explanation of Ruby Objects"},
                                {link_id: 17, topic_id: 5, user_id: 3, title: "Skilldrick: Understanding the Ruby object model", description: "Detailed explanation with visuals of ruby objects"},
                                {link_id: 18, topic_id: 6, user_id: 4, title: "Ruby Class Tutorial | Juixe Techknow", description: "An intro tutorial on Ruby classes"},
                                {link_id: 19, topic_id: 6, user_id: 1, title: "Ruby Best Practices- Fun with Class.new", description: "Clear explanation of best practices for dealing with classes in Ruby"},
                                {link_id: 20, topic_id: 6, user_id: 2, title: "Programming Ruby: The Pragmatic Programmer's Guide", description: "An Overview of Working with Classes, Objects and Variables"},
                                {link_id: 21, topic_id: 6, user_id: 3, title: "RubyMonk - Ruby Primer - Classes", description: "Quiz style site about Ruby Classes"},
                                {link_id: 22, topic_id: 6, user_id: 4, title: "Classes in Ruby Using Getters and Setters", description: "How getters and setters work in ruby"},
                                {link_id: 23, topic_id: 6, user_id: 1, title: "Introducing Classes", description: "An Intro to Classes from About.com"},
                                {link_id: 24, topic_id: 7, user_id: 2, title: "Understanding Ruby Variables - Techotopia", description: "An explanation of Variables"},
                                {link_id: 25, topic_id: 7, user_id: 3, title: "Variables | The Bastards Book of Ruby", description: "A great explanation of variables in Ruby"},
                                {link_id: 26, topic_id: 6, user_id: 4, title: "Class and Instance Variables In Ruby // RailsTips by John Nunemaker", description: "Class Variables and Instance Variables covered in detail"},
                                {link_id: 27, topic_id: 7, user_id: 1, title: "Instance variables", description: "Very brief explanation of instance variables"},
                                {link_id: 28, topic_id: 8, user_id: 2, title: "Class: String (Ruby 2.0)", description: "Very detailed documentation about Ruby Strings"}, 
                                {link_id: 29, topic_id: 8, user_id: 3, title: "Strings in Ruby", description: "Thorough explanation of Strings in Ruby and the methods to use with them"},
                                {link_id: 30, topic_id: 8, user_id: 4, title: "Strings | The Bastards Book of Ruby", description: "How to work with Strings in Ruby"},
                                {link_id: 31, topic_id: 8, user_id: 1, title: "Ruby Strings", description: "Details on all the methods available for Strings in Ruby"},
                                {link_id: 32, topic_id: 8, user_id: 2, title: "Strings", description: "Rails API Documentation about Strings"},
                                {link_id: 33, topic_id: 9, user_id: 3, title: "Numbers in Ruby: Ruby Study Notes - Best Ruby Guide, Ruby Tutorial", description: "How to work with Numbers and their operators"},
                                {link_id: 34, topic_id: 9, user_id: 4, title: "Class: Integer (Ruby 2.0)", description: "Integers from Official Ruby Documentation"},
                                {link_id: 35, topic_id: 9, user_id: 1, title: "Numbers | The Bastards Book of Ruby", description: "Ruby's basic data objects for counting and math"},
                                {link_id: 36, topic_id: 9, user_id: 2, title: "Ruby's Class Hierarchy for Numbers", description: "About.com explaining Numbers"},
                                {link_id: 37, topic_id: 9, user_id: 3, title: "Numbers", description: "Using Numbers in Ruby"},
                                {link_id: 38, topic_id: 9, user_id: 4, title: "Exercise 3: Numbers And Math: Learn Ruby The Hard Way", description: "Exercises from learn ruby the hard way"},
                                {link_id: 39, topic_id: 10, user_id: 1, title: "Class: Array (Ruby 2.0)", description: "Ruby-Doc Info on Arrays"},
                                {link_id: 40, topic_id: 15, user_id: 2, title: "Class: Module (Ruby 2.0)", description: "Ruby documentation about Modules"},
                                {link_id: 41, topic_id: 14, user_id: 3, title: "Programming Ruby: The Pragmatic Programmer's Guide", description: "Containers, Blocks, and Iterators Explained"},
                                {link_id: 42, topic_id: 12, user_id: 4, title: "Class: Method (Ruby 2.0)", description: "Ruby docs about Methods"},
                                {link_id: 43, topic_id: 11, user_id: 1, title: "Class: Hash (Ruby 2.0)", description: "Ruby docs about Hashes"},
                                {link_id: 44, topic_id: 16, user_id: 2, title: "Myspace | Social Entertainment", description: "A place to connect with people"},
                                {link_id: 44, topic_id: 17, user_id: 3, title: "Myspace | Social Entertainment", description: "Find great bands in your area"},
                                {link_id: 44, topic_id: 18, user_id: 2, title: "Myspace | Social Entertainment", description: "Tons of people on Myspace. Sign up"}
                                ])