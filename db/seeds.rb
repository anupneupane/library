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

twitter_auths = TwitterAuth.create([
  { :user_id => 3,
    :twitter_id => 1327166216,
    :twitter_handle => "LauraLibrary1",
    :token => "1327166216-Lk5keTQlnKKZvukrRyGtYv7Fd57rgCm43AN3qBp",
    :secret => "XhjlAidR3mT47zwgChr0LvP15YhYShDG0hzFvTqkdA"},
  { :user_id => 2,
    :twitter_id => 1327184551,
    :twitter_handle => "RahulLibrary1",
    :token => "1327184551-40LXIl9rVqAFakw1O0jWwhT11CVt4eMXWnjCgKQ",
    :secret => "h4sqMFBwZ3ScMELh9KUM18W3EK5FTOBvGES8AE2Ro"},
  { :user_id => 1,
    :twitter_id => 1327164006,
    :twitter_handle => "JohnLibrary1",
    :token => "1327164006-k79hKLlGkcP2jnmtfCinPfLiWyhV0s6kVDgwOeD",
    :secret => "52Dw9Fg31RuMUGrkQtK7T3LPqRc890tGUAf4XxJE"}
  ])

channels = Channel.create([
                            {title: "Flatiron School"},
                            {title: "Electronics"}
                          ])

categories = Category.create([
                              {title: "Social", channel_id: 1}, #1
                              {title: "Funny", channel_id: 1}, #2
                              {title: "Music", channel_id: 1}, #3
                              {title: "Prework", channel_id: 1}, #4
                              {title: "TVs", channel_id: 2}, #5
                              {title: "Cameras", channel_id: 2}, #6
                              {title: "Laptops", channel_id: 2}, #7
                              {title: "Headphones", channel_id: 2}, #8
                              {title: "Smartphones", channel_id: 2}, #9
                              {title: "Theater Audio", channel_id: 2}, #10
                              {title: "Projectors", channel_id: 2}, #11
                              {title: "Printers", channel_id: 2}, #12
                              {title: "Tablets", channel_id: 2} #13
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
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B00752VKBY/thewire06-20'}, #44
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B0078LSTWU/thewire06-20'}, #45
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B0042X9LC4/thewire06-20'}, #46
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B008MB719C/thewire06-20'}, #47
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B00894YWD0/thewire06-20'}, #48
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B00746YD24/thewire06-20'}, #49
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B007471PZQ/thewire06-20'}, #50
                      {url: 'http://www.lenovo.com/products/us/laptop/thinkpad/t-series/t430/?AID=10499647&PID=6146871&SID=ptwzf5xtgda7&CJURL=http%3A%2F%2Fwww.lenovo.com%2Fproducts%2Fus%2Flaptop%2Fthinkpad%2Ft-series%2Ft430%2F&PUBNAME=Skimlinks&NID=CJ'}, #51
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B007VEQ2UU/thewire06-20'}, #52
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B006CVF1P0/thewire06-20'}, #53
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B0054JJ0QW/thewire06-20'}, #54
                      {url: 'http://www.apple.com/iphone/'}, #55
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B004E10JZW/thewire06-20'}, #56
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B005P99KX4/thewire06-20'}, #57
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B0077V88YU/thewire06-20'}, #58
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B005C982NG/thewire06-20'}, #59
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B002G0CWSU/thewire06-20'}, #60
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B006JGHF70/thewire06-20'}, #61
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B00450DVDY/thewire06-20'}, #62
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B00507NEBA/thewire06-20'}, #63
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B0036TGGJQ/thewire06-20'}, #64
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B007M4ZGZG/thewire06-20'}, #65
                      {url: 'http://www.amazon.com/exec/obidos/ASIN/B007PRHNHO/thewire06-20'}, #66
                      {url: 'http://www.google.com/nexus/#/7'} #67
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
                        {title: 'Best Big HDTV', category_id: 5, user_id: 1}, #16
                        {title: 'The Best TV', category_id: 5, user_id: 2}, #17
                        {title: 'Best Small TV', category_id: 5, user_id: 3}, #18
                        {title: 'Great Mid Range DSLR', category_id: 6, user_id: 4}, #19
                        {title: 'The Best Compat Camera For Less Than $450', category_id: 6, user_id: 1}, #20
                        {title: 'Best Cheap DSLR', category_id: 6 , user_id: 2}, #21
                        {title: 'Best Laptop', category_id: 7 , user_id: 3}, #22
                        {title: 'Best Power Laptop', category_id: 7 , user_id: 4}, #23
                        {title: 'Best Workhorse Laptop', category_id: 7, user_id: 1}, #24
                        {title: 'Best Cheap Earphones', category_id: 8, user_id: 2}, #25
                        {title: 'The Best $100 Earbuds', category_id: 8, user_id: 3}, #26
                        {title: 'Noise Cancelling Headphones', category_id: 8, user_id: 4}, #27
                        {title: 'The Best Smartphone', category_id: 9, user_id: 1}, #28
                        {title: 'Great Soundbar', category_id: 10, user_id: 2}, #29
                        {title: 'Best Cheap Soundbar', category_id: 10, user_id: 3}, #30
                        {title: 'Solid Audio Receiver', category_id: 10, user_id: 4}, #31
                        {title: 'A Good Projector', category_id: 11, user_id: 1}, #32
                        {title: 'Best Projector Under $1000', category_id: 11, user_id: 2}, #33
                        {title: 'A Great Home Theater Projector', category_id: 11, user_id: 3}, #34
                        {title: 'Best Cheap Laser Printer', category_id: 12, user_id: 4}, #35
                        {title: 'A Solid Photo Printer', category_id: 12, user_id: 1}, #36
                        {title: 'Best Multifunction Printer', category_id: 12, user_id: 2}, #37
                        {title: 'The Best iPad Case', category_id: 13, user_id: 3}, #38
                        {title: 'The iPad Keyboard Case to Buy', category_id: 13, user_id: 4}, #39
                        {title: 'Best Cheap Tablet', category_id: 13, user_id: 1} #40
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
                                {link_id: 44, topic_id: 16, user_id: 1, title: "Panasonic VIERA TC-P60ST50 60-Inch 1080p 600Hz Full HD 3D Plasma TV", description: "The ST50 series features 1080p Full HD resolution, an Infinite Black Pro Panel, and VIERA Connect with web browser and built-in Wi-Fi. Other unique features include 2D to 3D conversion and 2500 focused field drive."},
                                {link_id: 44, topic_id: 17, user_id: 2, title: "Panasonic VIERA TC-P50ST50 50-Inch 1080p 600Hz Full HD 3D Plasma TV", description: "The ST50 series features 1080p Full HD resolution, an Infinite Black Pro Panel, and VIERA Connect with web browser and built-in Wi-Fi. Other unique features include 2D to 3D conversion and 2500 focused field drive."},
                                {link_id: 45, topic_id: 18, user_id: 3, title: "Samsung UN32EH4003 32-inch 720p 60Hz LED HDTV (Black)", description: "With LED technology, the energy-efficient, Samsung Series 4 TV produces a brilliant, clear picture. The Dolby Digital Plus/Dolby Pulse is an advanced surround sound feature that optimizes the TVs audio from connected devices. The Wide Color Enhancer Plus features lets you see picture with vibrant, natural-looking images."},
                                {link_id: 46, topic_id: 19, user_id: 4, title: "Nikon D7000 16.2MP DX-Format CMOS Digital SLR with 3.0-Inch LCD", description: "Meet the new Nikon D7000, a camera ready to go wherever your photography or cinematography takes you. Experience stunning images with sharp resolution and smooth tonal gradation, thanks to the 16-megapixel DX-format CMOS image sensor and a powerful EXPEED 2 image processing engine. Take advantage of its wide ISO range of 100 to 6400 (expandable to 25,600) and its incredibly low levels of noise. Expect your images tack-sharp and accurately exposed, thanks to the cameras 39-point AF and Scene Recognition System using a 2,016-pixel RGB matrix metering sensor. And with an approx.  0.052-second release time lag and approx. 6 frames-per-second shooting, you wont miss a moment."},
                                {link_id: 47, topic_id: 20, user_id: 1, title: "Panasonic LUMIX DMC-LX7K 10.1 MP Digital Camera with 7.5x Intelligent zoom and 3.0-inch LCD", description: "The Panasonic LUMIX DMC-LX7 10.1 MP Digital Camera comes with a newly developed 24mm ultra-wide angle LEICA DC VARIO-SUMMILUX lens that boasts a F1.4 brightness at wide-end and F2.3 at tele-end. Pictures will be sharp and blur-free, even in poorly lit environments. An advanced lens system - which has never been adapted to any Panasonic LUMIX digital camera or interchangeable lens - of 11 elements in 10 groups; 5 aspherical lenses with 9 aspherical surfaces, including the dual-sided aspherical surface ED (Extra-low Dispersion) lens, is what makes it easy to produce beautiful high resolution photos with minimal distortion and a pleasing, soft-focused background to the human eye."},
                                {link_id: 48, topic_id: 21, user_id: 2, title: "Canon EOS Rebel T4i 18.0 MP CMOS Digital SLR with 18-55mm EF-S IS II Lens", description: "Canon is proud to introduce its most sophisticated Rebel ever, the EOS Rebel T4i DSLR! Built to make advanced photography simple and fun, the new Rebel T4i delivers phenomenal image quality, high performance, and fast, intuitive operation. This EOS Rebel amps up the speed with the powerful DIGIC 5 Image Processor that helps make high-speed continuous shooting of up to 5.0 fps possible, great for capturing fast action. An 18.0 Megapixel CMOS sensor ensures that every image is shot in superb, high resolution; and an extended ISO range of 100 12800 gives photographers the opportunities to take the Rebel T4i into more shooting situations than ever before. A 9point all crosstype AF system (including a highprecision dual cross f/2.8 center point) delivers improved autofocus performance, and a new Hybrid CMOS AF System increases autofocus speed when shooting photos and video in Live View. For users interested in creating impressive videos, the Rebel T4i is ready to help you create your next masterpiece. Movie Servo AF provides continuous focus of moving subjects, so you never miss a moment. A builtin stereo microphone and manual audio level adjustment helps ensure that your audio will match the stunning quality of your video. First ever for an EOS Rebel, the Rebel T4i features a Variangle Touch Screen 3.0inch Clear View LCD monitor II, which allows fast and intuitive camera operation. Add compatibility with Canons proven EF and EFS lenses and a slew of EOS accessories, the Rebel T4i is an incredibly versatile tool for creating the images and videos you envision."},
                                {link_id: 49, topic_id: 22, user_id: 3, title: "Apple MacBook Air MD232LL/A 13.3Inch Laptop", description: "The ultimate everyday notebook is better than ever. The Apple MacBook Air now features the latest Intel processors and graphics, faster flash storage, and a 720p FaceTime HD camera. All packed into a notebook that's incredibly thin and light. With up to 60 percent faster graphics performance, it makes everything you do feel quicker and more fluid than ever. And the latest flash storage is up to 4x faster than a traditional hard drive, making MacBook Air remarkably responsive."},
                                {link_id: 50, topic_id: 23, user_id: 4, title: "Apple MacBook Pro MC975LL/A 15.4Inch Laptop with Retina Display", description: "The allnew MacBook Pro pushes the limits of notebook performance. It has a stunning Retina display with over 5 million pixels. An allflash architecture built for speed. The latest quadcore Intel Core i7 processor and nextgeneration NVIDIA graphics. And an incredibly thin and light design. You've never seen anything like it. Because there's never been anything like it. The MacBook Pro with Retina display is available in a 15.4inch model."},
                                {link_id: 51, topic_id: 24, user_id: 1, title: "Lenovo ThinkPad T430 Ultraportable Business Laptop", description: "The rocksolid build and high productivity of the T430 make it the perfect laptop for any business. It's reliable, durable, and designed to work hard in every business environment."},
                                {link_id: 52, topic_id: 25, user_id: 2, title: "Monoprice 108320 Enhanced Bass HiFi Noise Isolating Earphones", description: "With a stylish design and a premium fabriccovered cord, these Monoprice earphones will prompt complete strangers to ask you where you got them, but you won't hear a word they say as you rock on down the highway! "},
                                {link_id: 53, topic_id: 26, user_id: 3, title: "Velodyne vPulse Black InEar Headphones with Inline Microphone", description: "Bring the bass with vPulse inear headphones by Velodyne. A combination of quality construction, comfortable fit and superior audio quality offer an exceptional listening experience."},
                                {link_id: 54, topic_id: 27, user_id: 4, title: "Bose QuietComfort 15 Acoustic Noise Cancelling Headphones", description: "They're the best Bose headphones, period. QuietComfort 15 headphones feature exclusive Bose advancements in noise reduction technology. You hear less noise and more of your music and movieswith quality sound and a longlasting comfortable fit. You won't find this combination of benefits in any other headphone."},
                                {link_id: 55, topic_id: 28, user_id: 1, title: "iPhone 5", description: "A remarkably slim design that still makes room for a larger display and a faster chip. Ultrafast wireless that doesnt sacrifice battery life. And allnew headphones designed to sound great and fit comfortably. So much went into this iPhone. So you could get even more out of it."},
                                {link_id: 56, topic_id: 29, user_id: 2, title: "Yamaha YSP2200 Digital Sound Projector", description: "The extremely convenient Yamaha YSP2200 Digital Sound Projector is low profile enough to fit neatly in front of a TV and is 3D compatible (HDMI V.1.4a). Enjoy distinct, immersive surround sound from a single speaker bar, along with exclusive Yamaha technologies such as CINEMA DSP, Music Enhancer, and Intellibeam automatic calibration."},
                                {link_id: 57, topic_id: 30, user_id: 3, title: "VIZIO VHT215 Home Theater Sound Bar with Wireless Subwoofer", description: "Immerse yourself in your own home theater with VIZIO's Home Theater Sound Bar with Wireless Subwoofer. It delivers exceptional audio performance in a stylishly slim design  a perfect complement for 40 inches and larger TVs. This compact sound bar is packed with advanced audio technology, including Dolby Digital, SRS Studio Sound HD and SRS TruVolume. It features a full range of inputs, including HDMI for HD audio and video through one simple cable to your entire home theater. The wireless subwoofer allows you to place the speaker anywhere in your home theater*. With the Sound Bar's tablestand or wallmount options, this powerful system is and versatile addition to any home theater.Subwoofer"},
                                {link_id: 58, topic_id: 31, user_id: 4, title: "http://www.amazon.com/exec/obidos/ASIN/B0077V88YU/thewire0620", description: "TopEnd Features at a Realistic and Nice Price Home networking for PC and cloudbased audio. Six HDMI inputs. WRAT noisereduction suite. Powerful and immersive 5.1 surround. HighDefinition audio decoding and 3D video support. If all this sounds like an AVR thats beyond your budget, get ready to be pleasantly surprised. Onkyos TXNR414 Network A/V Receiver boasts all this and more. For a start, the receiver incorporates InstaPrevue technology, a new pictureinpicture HDMI input source preview system that greatly simplifies the operation of your home theater. Or try the HDMIlinked overlaid onscreen display, making midprogram setting adjustments quick and easy. Theres also a USB port for directdigital iPod/iPhone connection, Zone 2 lineouts for playback of a different stereo source in another room, digital music file enhancement, topshelf build quality, and the purity of sound for which our brand is famous. And the price tag? Lets just say HD playback isnt the only realistic thing about this potent AVR."},
                                {link_id: 59, topic_id: 32, user_id: 1, title: "Optoma HD33, HD (1080p), 1800", description: "The Optoma HD33 DLP projector provides amazing and brilliant color performance at an unbeatable price. These home theater projectors integrate musthave features that allow users to project images of up to 300 inches without investing in a moreexpensive, smallerscreened television. The HD33 is bright at 1800 ANSI lumens and delivers clear images with a contrast ratio of 4000:1."},
                                {link_id: 60, topic_id: 33, user_id: 2, title: "Optoma HD20, HD (1080p), 1700 ANSI Lumens, Home Theater Projector", description: "The Optoma HD20 redefines the highdefinition home theater/multimedia experience with a new level of flexibility and quality. With true 1080p resolution, the HD20 delivers excellent color saturation and subtle details for excellent images. With its sleek design and diminutive size, the Optoma HD20 is perfect for sharing bigscreen movies, sporting events and concerts with friends or taking video gaming to the next level."},
                                {link_id: 61, topic_id: 34, user_id: 3, title: "Epson 5010 PowerLite Home Cinema 3D Front Projector", description: "The PowerLite Home Cinema 5010 brings the power of 3D right to your living room with Bright 3D Drive technology and full HD, 1080p performance. Immerse yourself in eyepopping 3D adventures, 2400 lumens color and white light output1 and an astounding contrast ratio up to 200,000:1. This stateoftheart performer also features a builtin cinema filter and Fujinon lens, for movie viewing the way filmmakers intended. This highvalue home theater projector also features great 2D performance as well as 2Dto3D conversion. It's never been easier to entertain family and friends with a truetolife cinematic experience."},
                                {link_id: 62, topic_id: 35, user_id: 4, title: "Brother HL2270DW Compact Laser Printer with Wireless Networking and Duplex", description: "The Brother HL2270DW is a compact, monochrome laser printer includes builtin wireless and Ethernet network interfaces for small office or home office printer sharing. Offering a fast print speed and automatic duplex capability, you can print professionallooking twosided documents and booklets with ease. In addition, its stylish, spacesaving design fits virtually anywhere and complements any environment. Affordable to own and operate, the HL2270DW uses a highyield replacement toner cartridge to help reduce your operating costs."},
                                {link_id: 63, topic_id: 36, user_id: 1, title: "Epson Stylus Photo R2000 Wireless WideFormat Color Inkjet Printer (C11CB35201)", description: "Take your creativity and productivity to the next level with the advanced features and uncompromising quality of the Epson Stylus Photo R2000."},
                                {link_id: 64, topic_id: 37, user_id: 2, title: "HP LaserJet Pro M1212nf  Printer", description: "Share a printing network, using builtin Ethernet, and save office space with the compact size. Print highquality documents with bold text and sharp images, using Original HP print cartridges. Send and receive faxes from your PC, using the 33.6 kbps fax. Print documents at up to 19 ppm letter/18 ppm A4. Start printing fast with Instanton Technology. Install in a flash on your PC or Netbook, without a CD, using HP Smart Install. Set up and start printing fast with an easytouse control panel. Copy a duplex ID onto one page with ID Copy. Connect the MFP directly to a PC or Netbook via the included HiSpeed USB 2.0 port. Ensure reliable printing with an HP allinone print cartridge. Easily replace it with HP SureSupply"},
                                {link_id: 65, topic_id: 38, user_id: 3, title: "The Joy Factory SmartSuit3", description: "The SmartSuit 3 from the Joy Factory is an ideal companion for your iPad. The SmartSuit's cover provides wake/sleep functionality, holds the case open for comfortable longterm use, and converts into a stand for portrait or landscape viewing. Its textured covering feels great in your hand while protecting your iPad from scratches and scrapes. Packaging includes an inspirational mouse pad and waterproof sleeve. Compatible with New iPad (3rd Generation) and iPad 2."},
                                {link_id: 66, topic_id: 39, user_id: 4, title: "Logitech Ultrathin Keyboard Cover Black for iPad 2 and iPad", description: "Builtin Bluetooth wireless keyboard: Type with precision and get up to six months of battery power on a full charge (based on average use of 2 hours per day)"},
                                {link_id: 67, topic_id: 40, user_id: 1, title: "Google Nexus 7 16GB", description: "Priced at $200, the 16GB Google Nexus 7 offers a great balance of power, performance and price that wont break the bank."}
                                ])