# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "admin",
       email: "admin@sdk.com",
       role: 'admin',
       password: "admin",
       password_confirmation: "admin",
       confirmed_at: Time.zone.now)

User.create!(username: "testuser",
			 email: "testuser@skd.com",
       role: 'client',
			 password: "password",
			 password_confirmation: "password",
			 confirmed_at: Time.zone.now)


category1 = Category.create(name: 'Designphase')
category2 = Category.create(name: 'Time Dependency')
category3 = Category.create(name: 'Duration')
category4 = Category.create(name: 'User Participation')
category5 = Category.create(name: 'Evaluation Types')
sub_category1 = category4.sub_categories.create(name: 'User Participation-User Involved')
sub_category2 = category5.sub_categories.create(name: 'User Participation-Without Real User')
sub_category3 = category1.sub_categories.create(name: 'Design Phase-Planning')
sub_category4 = category1.sub_categories.create(name: 'Design Phase-Draft Prototype')
sub_category5 = category1.sub_categories.create(name: 'Design Phase-Detailed Prototype')
sub_category6 = category1.sub_categories.create(name: 'Design Phase-Launching')
sub_category7 = category2.sub_categories.create(name: 'Time Dependency-Real Time')
sub_category8 = category2.sub_categories.create(name: 'Time Dependency-Retrospective')
sub_category9 = category3.sub_categories.create(name: 'Duration-Long Term')
sub_category10 = category3.sub_categories.create(name: 'Duration-Short Term')
sub_category11 = category5.sub_categories.create(name: 'Evaluation Type-Test-Questionnaire')
sub_category12 = category5.sub_categories.create(name: 'Evaluation Type-Interview')
sub_category13 = category5.sub_categories.create(name: 'Evaluation Type-Experiment')
sub_category14 = category5.sub_categories.create(name: 'Evaluation Type-Observation')
sub_category15 = category5.sub_categories.create(name: 'Evaluation Type-Group Discussion')


technique1 = Post.new(title: '3-12-3 Brainstorming',
             body: '3-12-3 Brainstorming is a time-limited brainstorming technique, which enables a group (not exceed 10 group members) to focus on generating, collecting, and discussing ideas.',
             instruction: '<ol>' + 
             '<li>Define a topic or a problem.</li>'+
             '<li>Everyone uses 3 minutes to generate characteristics of the topic and write the characteristics on the cards.</li>'+
             '<li>Split a large group into small groups (each group 3-4 people).</li>'+
             '<li>Each group takes three cards from step 2 and use 12 minutes to develop concepts (sketches, rough prototypes) for each card.</li>'+
             '<li>Each group uses 3 minutes to present concepts</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://image.slidesharecdn.com/uxmethodsfull-140105132445-phpapp01/95/ux-methods-training-45-638.jpg?cb=1388928713</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Evaluation Type-Group Discussion, User Participation-Without Real User, Duration-Short Term, Time Dependency-Real Time, Design Phase-Planning',
             freetag_list: 'Idea Generation, Only Designer, Short Term')
technique1.save!

technique2 = Post.new(title: '3E- Expressing Emotion and Experience',
             body: '3E technique seeks to collect users’ emotion feedback without too much burden on the user. This technique helps users to express emotions after using a product or a service by writing and drawing on a 3E template.',
             instruction: '<ol>' + 
             '<li>Ask users to use a functional prototype.</li>'+
             '<li>After users performed a given task, they will be asked to write and draw their experience on a 3E template (e.g., draw a face to the human figure).</li>'+
             '<li>Analyze users’ emotion feedback from the writing and drawing.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Tähti, M. and Niemelä, M. (2006) ‘3E – Expressing Emotions and Experiences’, in Proceeding of WP9 Workshop on Innovative Approaches for Evaluating Affective </li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Questionnaire',
             freetag_list: 'Evaluation, Prototype Evaluation, Feedback Collection, User Participation, Short Term')
technique2.save!

technique3 = Post.new(title: '6-3-5 Brainwriting',
             body: '6-3-5 Brainwriting seeks to develop 108 ideas by silent writing or sketching in 30 minutes within a group of six participants.',
             instruction: '<ol>' + 
             '<li>Define a topic or a problem.</li>'+
             '<li>Give everyone a pen and pieces of paper.</li>'+
             '<li>Ask everyone to write or sketch three ideas in 5 minutes without discussion.</li>'+
             '<li>After 5 minutes, ask everyone to slide his or her paper to the adjacent people in the same direction.</li>'+
             '<li>Repeat step 3 and 4 5 times</li>'+
             '<li>Discuss the generated ideas and eliminate duplicates and select appropriate solutions.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://gpm-blog.de/wp-content/uploads/2013/07/Bild-2-Sechs-Personen_325Px.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion ',
             freetag_list: 'Idea Generation, Only Designer, Short Term')
technique3.save!

technique4 = Post.new(title: 'A/B Testing',
             body: 'A/B testing seeks to compare two versions of a design to see which one can meet the business goal. The technique is useful for comparing a new design with the existing design before it is released to the public.',
             instruction: '<ol>' + 
             '<li>Prepare two versions of a design.</li>'+
             '<li>Decide what to test of the two versions (e.g., features, functions, etc.).</li>'+
             '<li>Recruit people for the testing.</li>'+
             '<li> After 5 minutes, ask everyone to slide his or her paper to the adjacent people in the same direction.</li>'+
             '<li>Repeat step 3 and 4 5 times.</li>'+
             '<li>Discuss the generated ideas and eliminate duplicates and select appropriate solutions.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://kickofflabs.com/wp-content/uploads/2015/01/Intro-AB-Testing.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'Evaluation, Prototype Evaluation, Feedback Collection, User Participation, Flexible')
technique4.save!

technique5 = Post.new(title: 'Actors Map',
             body: 'Actors map visualizes how actors are related to each other and functions/roles of different actors in a service system by building a network of actors.Actors map visualizes how actors are related to each other and functions/roles of different actors in a service system by building a network of actors.',
             instruction: '<ol>' + 
             '<li>Prepare interviews with different actors.</li>'+
             '<li>Interview different actors by asking them how they are involved in a service system and what are their goals.</li>'+
             '<li>Decide a central actor in a service system.</li>'+
             '<li>Write actors and their function on a big sheet of paper (or use a mapping tool) and connect all the actors.</li>'+
             '<li>Analyze how different actors are related to each other.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.servicedesigntools.org/sites/default/files/res_images/ACTORS_MAP_04_0.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Collected Information Organization, Collaboration With Stakeholders, Short Term')
technique5.save!

technique6 = Post.new(title: 'Affinity Diagramming',
             body: 'Affinity diagramming enables a team to gather, organize, and analyze requirements from interviews or ideas from brainstorming to support the collaborative decision-making process.',
             instruction: '<ol>' + 
             '<li>Write collected data from interviews or brainstorming on sticky notes.</li>'+
             '<li> Stick notes on a wall that is covered with large-format paper.</li>'+
             '<li>Read and sort the information on the notes (the notes can be classified to show a common idea or problem or solution based on the similarity of the cards).</li>'+
             '<li>Discuss notes on the wall and come to a shared decision.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://cdn-images-1.medium.com/max/800/1*TdlEHUJm2l05oaJCR9yAMQ.jpeg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Collected Information Organization, Only Designer, Flexible')
technique6.save!

technique7 = Post.new(title: 'Attribute Listing',
             body: 'Attribute listing seeks to improve a product or a service by decomposing a product or a service into attributes to analyze and improve the quality of each attribute.',
             instruction: '<ol>' + 
             '<li>Identify a service or a product to improve.</li>'+
             '<li>List all of the attributes of a product, or a service (an attribute is a characteristic of a design).</li>'+
             '<li>Choose the attributes to improve.</li>'+
             '<li>Generate ideas to improve the attributes.</li>'+
             '<li>Discuss ideas in a group and decide how to improve the attributes.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Observation',
             freetag_list: 'Evaluation, Released Version Evaluation, Collected Information Organization, Only Designer, Short Term')
technique7.save!

technique8 = Post.new(title: 'Behavioral Mapping',
             body: 'Behavioral Mapping seeks to record and track user behavior within an environment by observing how participants interact with a design space unobtrusively.',
             instruction: '<ol>' + 
             '<li>Prepare a floor plan of the given environment.</li>'+
             '<li>List behaviors that will be recorded.</li>'+
             '<li> Record the behaviors by observing each participant respectively, and make notes on the floor plan.</li>'+
             '<li>Aggregate behaviors of many participants and analyze the result. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.intechopen.com/source/html/40505/media/image10.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation ',
             freetag_list: 'User Habit Investigation, Prototype Evaluation, Observation, User Participation, Flexible')
technique8.save!

technique9 = Post.new(title: 'Bodystorming',
             body: 'Bodystorming combines role-play with paper prototypes. Designers immerse themselves in user situations and use paper prototypes to help designers to collect emotion feedback and improve the prototypes.',
             instruction: '<ol>' + 
             '<li>Prepare some concept ideas as paper prototypes.</li>'+
             '<li>Define some scenes.</li>'+
             '<li>Act as different roles when using paper prototypes in a group in each scene.</li>'+
             '<li>Take a break for discussion after each scene to generate design ideas and draw some sketches.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://i.vimeocdn.com/video/476981959_1280x720.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Evaluation, User Simulation, Only Designer, Short Term')
technique9.save!

technique10 = Post.new(title: 'Business Origami',
             body: 'Business origami enables teams to analyze interactions and value exchange among people, environments, and artifacts in early phases of a design process.',
             instruction: '<ol>' + 
             '<li>Define a scenario.</li>'+
             '<li>Include a multidisciplinary group (4 to 6 participants).</li>'+
             '<li>Use paper-cutout tokens to represent the actors, artifacts, environments, and technologies.</li>'+
             '<li>Put the tokens on a horizontal board and connect the tokens with arrows to show the interaction in between</li>'+
             '<li>Label the arrows with the value exchange of the interaction</li>'+
             '<li>Analyze the current system and suggest future systems.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://c1.staticflickr.com/3/2523/3995914375_76226df1b9_b.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Collected Information Organization, Collaboration With Stakeholders, Short Term')
technique10.save!

technique11 = Post.new(title: 'Closed Card Sorting',
             body: 'Closed card sorting is a useful technique to reflect users’ finding patterns and to structure information to suggest navigations when adding content to an existing structure.',
             instruction: '<ol>' + 
             '<li>Select content and pre-define categories.</li>'+
             '<li>Prepare cards (30-100 cards, use paper-based cards or an online tool), and recruit participants.</li>'+
             '<li>Ask the participants to sort content into the pre-defined categories</li>'+
             '<li>Analyze the results to find similarities and differences between cards.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.flickr.com/photos/rosenfeldmedia/3344341528</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Collected Information Organization, User Participation, Short Term')
technique11.save!

technique12 = Post.new(title: 'Co-discovery',
             body: 'Co-discovery seeks to gather experiential data in a relaxed manner by observing how two participants explore the usage of a product together. ',
             instruction: '<ol>' + 
             '<li>Prepare materials, such as functional prototypes and cameras</li>'+
             '<li>Recruit participants (2 for each session, participants are expected to be friends or familiar with each other).</li>'+
             '<li>Decide a moderator to guide the discussion</li>'+
             '<li>Use camera to record the exploratory process</li>'+
             '<li>Analyze the video data and use the data to communicate with other roles.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Jordan, P. W., Thomas, B., McClelland, I. L. and Weerdmeester, B. (1996) Usability Evaluation In Industry. Taylor & Francis Ltd.</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation ',
             freetag_list: 'Evaluation, Prototype Evaluation, Observation, User Participation, Short Term')
technique12.save!

technique13 = Post.new(title: 'Cognitive Mapping',
             body: 'Cognitive mapping visualizes the cause-effect relationship between related concept to understand how people make sense of a goal. The technique can be used to develop strategies.',
             instruction: '<ol>' + 
             '<li>Write results from interviews in separated sentences (10-12 words long phases that are separated by concept).</li>'+
             '<li>Determine a goal from the sentences and put the goal in the middle of the map.</li>'+
             '<li>Identify concepts based on phrases and put them around the goal</li>'+
             '<li>Connect concepts and the goal with arrows (cause and effect).</li>'+
             '<li>Determine the options and outcomes within each pair of concepts</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://blog.tutorhub.com/wp-content/uploads/2013/11/shutterstock_123625033.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Collected Information Organization, Only Designer, Short Term')
technique13.save!

technique14 = Post.new(title: 'Cognitive Walkthrough',
             body: 'Cognitive walkthrough enables design teams to evaluate prototypes from a potential user’s perspective. A fully functional prototype and users are not necessary. ',
             instruction: '<ol>' + 
             '<li>Describe a fictive user as a targeted user.</li>'+
             '<li>Identify an overall task and sub-tasks for the fictive user.</li>'+
             '<li>List all the correct actions to accomplish each task</li>'+
             '<li>Interface designers and stakeholders perform tasks from the perspective of the fictive user</li>'+
             '<li>Examine each step in the correct actions from step 3 and consider whether the user will select each of the correct actions.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://zxid.org/tas3/ui-index.html</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Prototyping, User Simulation, Only Designer, Short Term')
technique14.save!

technique15 = Post.new(title: 'Collaborative Sketching',
             body: 'Collaborative sketching technique seeks to generate, evaluate, and refine user interface design. It enhances the collaborative process between designers and clients, and dramatically reduced the time required to achieve the desired results. ',
             instruction: '<ol>' + 
             '<li>Set up a big blank canvas to stick inputs (information that guide sketching) and sketches.</li>'+
             '<li>Stick information (flowchart, sitemap, user needs, etc.) as input on the canvas.</li>'+
             '<li>Draw 6 thumbnail sketches (6-up-template) in 10-15 minutes and pick the preferred one.</li>'+
             '<li>Refine the preferred sketch from step 3 (1-up-template)</li>'+
             '<li>Stick up sketches from step 3 and 4</li>'+
             '<li>Discuss and evaluate sketches with colleagues and then involve clients to gather feedback and annotate sketches.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.boxuk.com/insight/blog-posts/using-sketchboards-to-design-great-user-interfaces</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Prototyping, User Participation, Short Term')
technique15.save!

technique16 = Post.new(title: 'Concept Mapping',
             body: 'A concept map is used to organize concepts, which are connected by arrows and link words to visualize a complex system or to explain a new concept. Concepts in a concept map are presented in a downward hierarchy. General concepts are at the top of the map, and specific concepts are at the bottom.',
             instruction: '<ol>' + 
             '<li>Involve stakeholders in the early phase of a design process and prepare pieces of paper and pens (or online tool).</li>'+
             '<li>Determine a problem.</li>'+
             '<li>Ask stakeholders questions that clearly specify the problem in step 2 and make notes of the answers</li>'+
             '<li>Select 15-20 concepts from answers and put most general concepts at the top and most specific concepts at the bottom</li>'+
             '<li>Discuss the concept map and get insights on how to solve the problem. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://cmap.ihmc.us/docs/theory-of-concept-maps.php</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'Idea Generation, Collected Information Organization, Only Designer, Short Term')
technique16.save!

technique17= Post.new(title: 'Content Inventory & Auditing',
             body: 'A content inventory is a list of content on a website (text, images, etc.). Based on the existing content, a content audit can be made to recommend further improvement of the website. ',
             instruction: '<ol>' + 
             '<li>Involve stakeholders in the early phase of a design process and prepare pieces of paper and pens (or online tool).</li>'+
             '<li>Determine a problem.</li>'+
             '<li>Ask stakeholders questions that clearly specify the problem in step 2 and make notes of the answers</li>'+
             '<li>Select 15-20 concepts from answers and put most general concepts at the top and most specific concepts at the bottom</li>'+
             '<li>Discuss the concept map and get insights on how to solve the problem. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Adjusted from http://4.bp.blogspot.com/-MyGA_2p1eUk/UkGFZnmfbvI/AAAAAAAAAGQ/WyMyKsRzcg8/s1600/handy-dandy-content-audit-template.png
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Observation',
             freetag_list: 'Evaluation, Released Version Evaluation, Collected Information Organization, Only Designer, Flexible')
technique17.save!

technique18 = Post.new(title: 'Contextual Laddering',
             body: 'Contextual Laddering',
             instruction: '<ol>' + 
             '<li>Plan a contextual laddering interview early in the design process before fixated features are decided.</li>'+
             '<li>Prepare an interview protocol with several questions to start with “Why.”</li>'+
             '<li>Analyze the results to understand how people make purchasing decisions.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Martin, B., & Hanington, B. (2012). Universal Methods of Design. Beverly: Rockport Publisher.</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Interview',
             freetag_list: 'User Habit Investigation, Feedback Collection, User Participation, Short Term')
technique18.save!

technique19= Post.new(title: 'Critical Incident Technique',
             body: 'Critical incident technique seeks to gain an understanding of the existing incident from the perspective of the individual and learn how users behave during the incident to generate recommendations for improving further designs. ',
             instruction: '<ol>' + 
             '<li>Gain access to participants.</li>'+
             '<li> Define a problem and determine data collection instrument (e.g., clear instruction, story-triggering questions).</li>'+
             '<li>Collect data through diary study or interviews.</li>'+
             '<li>Analyze and interpret data (create descriptions of categories, such as incidents, behaviors) and understand service conditions.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.mattheweziashi.com/images/Projects/Pandemic/criticalincident.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Launching, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Interview',
             freetag_list: 'User Habit Investigation, User Participation, Long Term')
technique19.save!

technique20 = Post.new(title: 'Concurrent Think-aloud',
             body: 'Concurrent Think-aloud is used to reveal how participants are thinking when they are performing a task. By asking the participants to verbalize their doing and thinking, designers will get insights on how users evaluate detail functions of an interface design.',
             instruction: '<ol>' + 
             '<li>Recruit participant and organize a think-aloud session.</li>'+
             '<li>Give a participant a task and oral instructions before performing the task.</li>'+
             '<li>Ask participant to verbalize their thinking when they are performing their tasks.</li>'+
             '<li>After a participant finishes the task, he or she will be asked to describe their overall experience of the task</li>'+
             '<li></li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.netizenexperience.com/images/Lab-Usability-Testing-Observer-User-Moderator-1024x795.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'User Habit Investigation, User Participation, Short Term')
technique20.save!

technique21 = Post.new(title: 'Desirability Testing with Product Research Cards',
             body: 'Desirability testing with product reaction cards seeks to help designers to understand the nebulous, critical feeling of desirability in user experience. It can be used to compare the iterative designs.Desirability testing with product reaction cards seeks to help designers to understand the nebulous, critical feeling of desirability in user experience. It can be used to compare the iterative designs.',
             instruction: '<ol>' + 
             '<li>Decide which product reaction cards (60% positive, 40% negative) to use to test desirability.</li>'+
             '<li>Recruit people for the test.</li>'+
             '<li>Tell participants to pick up 3-5 cards that match their experience after they use a product</li>'+
             '<li>Ask participants to tell what the cards mean to them</li>'+
             '<li>Collect the selected cards and note the number of times the same cards are selected by more than one participant to see overall feelings.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Barnum, M.C., Palmer, A.L., 2010. More Than A Feeling: Understanding the Desirability Factor in User Experience. CHI’10 Ext. Abstr. Hum. Factors Comput. Syst. 4703–4716. </li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Questionnaire',
             freetag_list: 'Evaluation, Prototype Evaluation, Feedback Collection, User Participation, Short Term')
technique21.save!

technique22 = Post.new(title: 'Diary Studies',
             body: 'Diary studies enable designers to capture users’ thoughts, feelings, and behaviors throughout a few days or weeks to understand the users’ long-term habits. ',
             instruction: '<ol>' + 
             '<li>Determine the purpose and a timeline of the diary study. </li>'+
             '<li>Recruit participants.</li>'+
             '<li>Give participants an instruction and a template (include key questions according to the defined purpose) for writing diaries (or using an online tool).</li>'+
             '<li>Regularly check the diaries.</li>'+
             '<li>Evaluate the collected data to understand user habits.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://s-media-cache-ak0.pinimg.com/736x/da/a9/a4/daa9a47b93eb84549205c24885c3a91e.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Launching, Time Dependency-Retrospective, Duration-Long Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'User Habit Investigation, Only Designer, Long Term')
technique22.save!

technique23 = Post.new(title: 'Directed Storytelling',
             body: 'Directed storytelling enables designers to easily gather rich data of users’ experiences to understand users. The technique is useful when time and budget are at a premium.',
             instruction: '<ol>' + 
             '<li>Prepare guiding questions for the storyteller to tell a story.</li>'+
             '<li>Recruit participants. </li>'+
             '<li>Start a storytelling session with questions like “Tell me a story about...” </li>'+
             '<li>Document the session (affinity diagramming can be used) with a goal of finding consistent patterns within and across experiences.</li>'+
             '<li>Evaluate the cluster information and come to design ideas.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Martin, B., & Hanington, B. (2012). Universal Methods of Design. Beverly: Rockport Publisher.</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Interview',
             freetag_list: 'User Habit Investigation, User Participation, Short Term')
technique23.save!

technique24 = Post.new(title: 'Experience Clip',
             body: 'Experience clip technique seeks to collect user experience of the usage of location-based outdoor mobile Apps without disturbance from user researchers. The technique is conducted by two users. One user uses a mobile App; another user takes video clips.',
             instruction: '<ol>' + 
             '<li>Prepare devices and materials and recruit participants.</li>'+
             '<li>Introduce the procedure of the test: i) 2 participants work in a group (one uses the App, one take clips). ii) explain the technical constraints, such as the best distance for shooting.</li>'+
             '<li>Encourage participants to tell their experience. </li>'+
             '<li>Analyze data to know users’ emotional changes during the usage.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Isomursu, M., Kuutti, K. and Väinämö, S. (2004) ‘Experience Clip : Method for User Participation and Evaluation of Mobile Concepts’, in Proceedings of the eighth conference on Participatory design: Artful integration: interweaving media, materials and practices, pp. 83–92. doi: 10.1145/1011870.1011881.
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit Investigation, Observation, User Participation, Short Term')
technique24.save!

technique25 = Post.new(title: 'Experience Prototyping',
             body: 'Experience prototyping is conducted when specific artifacts or elements are available (no need to be a functional prototype, but specific elements and situation are needed). The technique enhances the understanding of what it would be like when a user uses the design.',
             instruction: '<ol>' + 
             '<li>Finalize a low-fidelity prototype (specific elements need to be included.</li>'+
             '<li>Define a specific situation for simulation.</li>'+
             '<li>Design team members act as different roles in the simulation (pre-defined personas need to be included).</li>'+
             '<li>Understand the essential factors of an existing experience and improve the design of the low-fidelity prototype.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://static1.squarespace.com/static/51e4cafce4b07dc946a784bf/t/52e04dbbe4b0c72a91e5dc06/1390431677232/week-11-experience-prototypes-11.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Prototyping, User Simulation, Only Designer, Short Term')
technique25.save!

technique26 = Post.new(title: 'Eye-tracking',
             body: 'The eye-tracking technique reveals users’ attention to a web page by measuring where eyes are looking, how long they are looking, and how their focus are moving.',
             instruction: '<ol>' + 
             '<li>Prepare eye-tracking devices and materials.</li>'+
             '<li>Recruit participants.</li>'+
             '<li>Set up an eye-tracking lab study.</li>'+
             '<li>Analyze results (heat maps, fixations, etc.) to understand user browsing habits.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.usability.gov/sites/default/files/images/eye-tracking-full-option1.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Launching, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Experiment',
             freetag_list: 'User Habit Investigation, Observation, User Participation, Short Term')
technique26.save!

technique27 = Post.new(title: 'Flexible Modeling',
             body: 'The flexible modeling technique helps designers to create a prototype with users by applying a predefined set of elements of an interface. ',
             instruction: '<ol>' + 
             '<li>Prepare a set of predetermined feature elements.</li>'+
             '<li>Recruit participants.</li>'+
             '<li>Set up a meeting with users to explain how to design with the predefined elements.</li>'+
             '<li>Observe how participants combine elements and take photos of the combined elements to a document.</li>'+
             '<li>Ask participants about their design decisions.</li>'+
             '<li>Analyze the results to get an insight of popular interface options and preferred combinations. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Curtis, N. (2009) Modular Web Design: Creating Reusable Components for User Experience Design and Documentation. Berkeley, CA: New Riders. </li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Group Discussion',
             freetag_list: 'Prototyping, Observation, User Participation, Short Term')
technique27.save!

technique28 = Post.new(title: '"Fly-on-the-Wall" Observation',
             body: 'The "Fly on the Wall" (FOTW) technique is an unobtrusive observation technique where the observer observes user behaviors without interfering the representation.',
            instruction: '<ol>' + 
             '<li>Decide which form of observation to use.</li>'+
             '<li>i. Secret outsider: distant observer, minimize any influence from the observer
ii. Recognized outsider: participants know they are being observed by an observer</li>'+
             '<li>Develop an observation framework with defined themes, questions, etc..</li>'+
             '<li>Develop an observation timeline.</li>'+
             '<li>Collect observations.</li>'+
             '<li>Analyze results to understand user behaviors.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Martin, B., and Hanington, B. 2012. Universal Methods of Design, Beverly: Rockport Publisher.</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'User Habit Investigation, Observation, User Participation, Flexible')
technique28.save!

technique29 = Post.new(title: 'Graffiti Walls',
             body: 'Graffiti walls enable participants to provide their comments freely by writing or drawing on an open canvas. This technique is very useful to reflect user behaviors in the situation that privacy and ethical issues need to be considered.',
             instruction: '<ol>' + 
             '<li>Define a theme and decide an environmental space to adhere a large-format paper as a graffiti wall.</li>'+
             '<li>Adhere the large-format paper on the wall.</li>'+
             '<li>Take photos of each graffiti wall at regular intervals.</li>'+
             '<li>Remove the graffiti wall at the end of the study.</li>'+
             '<li>Compare and analyze the “walls” with “walls” collected from other locations.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.slideshare.net/peterroessler/g-wall-presentation Page 28</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Long Term, User Participation-User Involved, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit Investigation, Observation, User Participation, Flexible')
technique29.save!

technique30 = Post.new(title: 'Heuristic Evaluation',
             body: 'Heuristic evaluation enables designers to go through their website’s interface and get feedback and detect usability problems early in the design process.  ',
             instruction: '<ol>' + 
             '<li>Determine an appropriate list of heuristics.</li>'+
             '<li>Select professionals (not end users) as evaluators.</li>'+
             '<li>Give instructions to evaluators. </li>'+
             '<li>Ask evaluators to use the product freely and to select specific elements to evaluate. </li>'+
             '<li>Let evaluators use the product again and then apply the chosen heuristics.</li>'+
             '<li>The evaluators should record problems independently. </li>'+
             '<li>Encourage evaluators to suggest potential solutions to these problems.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: 
https://s-media-cache-ak0.pinimg.com/originals/0a/8f/e0/0a8fe0c85ca04b0ba9bf28433997c8bb.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Observation',
             freetag_list: 'Evaluation, Prototype Evaluation, Feedback Collection, Only Designer, Flexible')
technique30.save!

technique31 = Post.new(title: 'Kano Analysis',
             body: 'Kano analysis not only enables designers to assign design features to five product attributes (required, desired, delighter, neutral, anti-feature), but also to determine which attributes have the greatest impact on customer satisfaction.',
             instruction: '<ol>' + 
             '<li>Choose target features and users.</li>'+
             '<li>Write a questionnaire that includes target features. </li>'+
             '<li>Pre-test the questionnaire with team members.</li>'+
             '<li>Get 20-30 customers to answer the questionnaire.</li>'+
             '<li>Analyze the results and plot each attribute into a Kano Category (see the Figure).</li>'+
             '<li>Fulfill requirements start from bottom-left of the Kano Category.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://upload.wikimedia.org/wikipedia/commons/1/14/Kano_Model.gif</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Questionnaire',
             freetag_list: 'User Habit Investigation, User Participation, Short Term')
technique31.save!

technique32 = Post.new(title: 'LEGO Serious Play',
             body: 'LEGO Serious Play is an innovative process that enhances the generation of ideas and innovative solutions within a group by using LEGO.',
             instruction: '<ol>' + 
             '<li>Identify a question for LEGO serious play.</li>'+
             '<li>Organize a group for 4-8 people.</li>'+
             '<li>Decide some shared model (e.g., what kind of a model represents a colleague, customer).</li>'+
             '<li>Build a model (e.g., to show the team goal, to show your role in the team, etc.).</li>'+
             '<li>Give meaning to the model and share the story with others.</li>'+
             '<li>Discuss and come to a shared solution.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://seriousplaypro.com/wp-content/uploads/2015/09/LEGO-SERIOUS-PLAY-workshop-by-Rafiq-Elmansy.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, User Simulation, Collaboration With Stakeholders, Short Term')
technique32.save!

technique33 = Post.new(title: 'Mental Model Diagrams',
             body: 'Mental mood diagrams are applied to analyze whether existing design features align with users’ behaviors, emotions, and beliefs and helps designers to make development strategies.',
             instruction: '<ol>' + 
             '<li>Review results from interviews, diary studies, etc..</li>'+
             '<li>Build the diagram (top half of the diagram includes behaviors, beliefs, or emotions. bottom half of the diagram includes available design features, services).</li>'+
             '<li>Group similar behaviors and features.</li>'+
             '<li>Identify the opportunities from the diagram for future design.</li>'+
             '<li>Use the mental model diagram for further design work. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.slideshare.net/cwodtke/design-your-way-to-productmarket-fit</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Interview',
             freetag_list: 'Evaluation, Released Version Evaluation, Collected Information Organization, User Participation, Flexible')
technique33.save!

technique34 = Post.new(title: 'Mind Mapping',
             body: 'Mind mapping seeks to visualize the relationships among many pieces of related information on a problem or a topic, which helps to generate ideas and concepts.',
             instruction: '<ol>' + 
             '<li>Write a topic in the center (use a piece of paper or online tool). </li>'+
             '<li>Create and connect branches, and link connected ideas together.</li>'+
             '<li>Use images and colors to make mind map more interesting. </li>'+
             '<li>Discuss the mind map.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://lifehacker.com/how-to-use-mind-maps-to-unleash-your-brains-creativity-1348869811</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Only Designer, Short Term')
technique34.save!

technique35 = Post.new(title: 'Mood Boards',
             body: 'A mood board is a collage of collected pictures that helps the visualization of some information that is difficult to describe by words. This technique helps a design team to reach a consensus goal concept early in the design process.  ',
             instruction: '<ol>' + 
             '<li>Prepare materials like card or paper sheets, a preset collection of images, words, shapes, and glue sticks.</li>'+
             '<li>Recruit participants to collect their views.</li>'+
             '<li>Present their collages to the group or researcher, to provide clarity and insight about image choices and meaning.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://blog.printsome.com/wp-content/uploads/15.Moodboard-makes-use-of.com_.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit InvestigationUser Participation, Short Term')
technique35.save!

technique36 = Post.new(title: 'Motivation Matrix',
             body: 'Motivation matrix technique seeks to identify and visualize the connection between actors as well as the motivation of each actor, which helps to understand the connection between each stakeholder. ',
             instruction: '<ol>' + 
             '<li>Give a group a blank matrix: pre-defined stakeholders at the top and the left-hand side. </li>'+
             '<li>Ask actors to fill out the matrix from the top left corner square and moving towards the bottom right corner square with their motivations.</li>'+
             '<li>Ask actors to fill out the remaining squares with explanations on how they connect and interact with others. </li>'+
             '<li>Use the matrix to reflect the roles of each actor and how they are connected.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.slideshare.net/seremiru/service-design-tools-desis-workshop</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Collected Information Organization, Collaboration With Stakeholders, Short Term')
technique36.save!

technique37 = Post.new(title: 'Offering Map',
             body: 'An offering map seeks to systematically describe how a service is offered to its users, which helps to detail a design idea or generate solution ideas for a service design.',
             instruction: '<ol>' + 
             '<li>Define a purpose for making an offering map.</li>'+
             '<li>Prepare large paper, markers, and sticky notes to create the map.</li>'+
             '<li>Discuss within a group about the overall scope of the service design.</li>'+
             '<li>Draw an offering map. start with large concepts and then go into detail elements.</li>'+
             '<li>Discuss the results and plan for the implementation of the offering map to the service design. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.servicedesigntools.org/sites/default/files/res_images/L-15_schema%20persone.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Collected Information Organization, Only Designer, Short Term')
technique37.save!

technique38 = Post.new(title: 'Open Card Sorting',
             body: 'Open card sorting means there are no pre-defined categories. Rather, participants create their names for the categories they create. The technique is useful for sorting user research findings and structuring content.',
             instruction: '<ol>' + 
             '<li>Prepare the cards and recruit participants.</li>'+
             '<li>Ask the participants to group the cards into categories based on the similarities and differences of the cards.</li>'+
             '<li>Let participants give each category a name and explain the meaning.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://image.slidesharecdn.com/bwtbcuxtechniques-131109124221-phpapp02/95/bram-wessel-on-ux-techniques-for-better-information-modeling-6-638.jpg?cb=1384001044
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit Investigation, Collected Information Organization, User Participation, Short Term')
technique38.save!

technique39 = Post.new(title: 'Parallel Prototyping',
             body: 'Parallel prototyping means simultaneously creating multiple designs, which helps design teams keep from fixating on a design direction too early and lead to more effective design results.',
             instruction: '<ol>' + 
             '<li>Start prototyping with multiple alternative designs (>=3) at the same time.</li>'+
             '<li>Recruit users and conduct user test.</li>'+
             '<li>Compare the designs and create a single merged design.</li>'+
             '<li>Iterate the merged design.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.nngroup.com/articles/parallel-and-iterative-design/</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion ',
             freetag_list: 'Prototyping, User Participation, Long Term')
technique39.save!

technique40 = Post.new(title: 'Personas',
             body: 'Personas are profiles that describe user behavior patterns to collect experiences, which humanize the design focus, test scenarios, and aid design communications.',
             instruction: '<ol>' + 
             '<li>Collect information of targeted users. </li>'+
             '<li>Group similar users together.</li>'+
             '<li>Create personas for 3-6 user groups.</li>'+
             '<li>Decide what information (name, age, hobbies, etc.) should be included for personas and create a template for persona. </li>'+
             '<li>Create personas.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.keepitusable.com/blog/wp-content/uploads/2016/06/ExPersona_Jill.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit Investigation, Collected Information Organization, User Participation, Flexible')
technique40.save!

technique41 = Post.new(title: 'Photo Diary',
             body: 'Photo diary seeks to help designers to understand users’ surroundings by inviting users to take photos of their lives and interactions. ',
             instruction: '<ol>' + 
             '<li>Identify the purpose of a photo diary. </li>'+
             '<li>Recruit participants.</li>'+
             '<li>Ask participants to photograph their surroundings when they are feeling a particular way (energized, sad, overwhelmed), or human interactions.</li>'+
             '<li>Document collected photo diaries, pay attention to uncomfortable situations.</li>'+
             '<li>Suggest having follow-up interviews with users and asking them to explain positive–negative interactions. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://s9.favim.com/orig/131030/diary-photography-scrapbook-Favim.com-1024901.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Long Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'User Habit Investigation, User Participation, Long Term')
technique41.save!

technique42 = Post.new(title: 'Photo Elicitation Interview',
             body: 'Photo elicitation interview technique seeks to help to understand user communities, their experiences, and desires by using photos that relate to the context of everyday activities to recall people’s experience.',
             instruction: '<ol>' + 
             '<li>Identify the purpose and recruit participants.</li>'+
             '<li>Prepare interview protocol (time of use, location, relationships, life events, mental states, and other resources associated with the product or service).</li>'+
             '<li>Instruct participants to sort photos and recall a story about an experience (photos may come from a predefined set or photo diaries).</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Hatten, K., Forin, T.R., Adams, R., 2013. A picture elicits a thousand meanings: Photo elicitation as a method for investigating cross-disciplinary identity development, in: 120th ASEE Annual Conference & Exposition. pp. 1–21.
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Interview',
             freetag_list: 'User Habit Investigation, User Participation, Short Term')
technique42.save!

technique43 = Post.new(title: 'Private Camera Conversation',
             body: 'Private camera conversation seeks to avoid the bias from interviewers by asking participants to talk to a camera about a given topic after using a prototype or a product without influence from interviewers.',
             instruction: '<ol>' + 
             '<li>Decide a topic and recruit participants.</li>'+
             '<li>Brief participant and explain the task and the process.</li>'+
             '<li>Ask participants to take a camera to a booth and report their opinions.</li>'+
             '<li>Analyze the recordings.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Vries, G. de, Hartevelt, M., Oosterholt, R., 1995. Private Camera Conversation: a new method for eliciting user responses? Behav. Inf. Technol. 14, 358–360. doi:10.1080/01449299508914654
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'Evaluation, Prototype Evaluation, Feedback Collection, User Participation, Short Term')
technique43.save!

technique44 = Post.new(title: 'Product Experience Tracker',
             body: 'Product experience tracker means surveys are sent "immediately" (e.g. minutes, hours, or even a few days) after product use. Questionnaires are regularly sent (monthly). Results from the regularly sent surveys report the changes of the user satisfaction over time.',
             instruction: '<ol>' + 
             '<li>Prepare questionnaire.</li>'+
             '<li>Send an online questionnaire to participants immediately after real-world product use.</li>'+
             '<li>Run the survey periodically (weekly, monthly, etc.).</li>'+
             '<li>Analyze surveys to see how the changes of a product affect user experience.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.ennect.com/Survey/sample-and-example/sample-customer-satisfaction-survey.aspx
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Launching, Time Dependency-Retrospective, Duration-Long Term, User Participation-User Involved, Evaluation Type-Questionnaire',
             freetag_list: 'Evaluation, Released Version Evaluation, Feedback Collection, User Participation, Long Term')
technique44.save!

technique45 = Post.new(title: 'Repertory Grid Technique',
             body: 'Repertory grid technique seeks to identify the ways people interpret their experiences by interviewing people to elucidate their personal constructs (friendly–hostile, bad–good, etc.) when they are confronted with artifacts (i.e., prototypes in the design process).',
             instruction: '<ol>' + 
             '<li>Prepare prototypes (6-12) and recruit participants.</li>'+
             '<li>Give each participant three prototypes randomly.</li>'+
             '<li>Ask the participants to identify how two of the three prototypes are different from the third and name the two polar opposites of the construct, as well as identify which is good and which is bad.</li>'+
             '<li>Let participant rate all of the prototypes on a scale 1 to 5 based on the proposed construct.</li>'+
             '<li>Analyze the result, both qualitatively and quantitatively.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://cdn.morguefile.com/imageData/public/files/j/jade/preview/fldr_2012_09_11/file6461347376319.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Interview',
             freetag_list: 'Evaluation, Prototype Evaluation, Feedback Collection, User Participation, Short Term')
technique45.save!

technique46 = Post.new(title: 'Retrospective Think-aloud',
             body: 'Retrospective think-aloud gathers participants’ feedback after a task has been accomplished. Participants are asked to recall their thoughts when they are using the interface. ',
             instruction: '<ol>' + 
             '<li>Identify a task and recruit participants.</li>'+
             '<li>Give participants tasks and oral instructions. </li>'+
             '<li>Tell participants to carry out the tasks in silence and record the process. </li>'+
             '<li>After completing the task, ask participants to make comments on the process retrospectively while watching their recorded performance on video. </li>'+
             '<li>Ask participants to indicate what they think about their participation experience.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://courses.iicm.tugraz.at/hci/practicals/materials/de/ta/images/testroom01.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'Evaluation, Prototype Evaluation, Feedback Collection, User Participation, Short Term')
technique46.save!

technique47 = Post.new(title: 'Roadmapping',
             body: 'A design roadmap is a canvas that allows design teams to strategically visualize and map out user experience and design elements over time.',
             instruction: '<ol>' + 
             '<li>Analyze results from interview, observation, or questionnaire.</li>'+
             '<li>Extract common themes for future design.</li>'+
             '<li>Prioritize functions and technologies based on stages of development.</li>'+
             '<li>Analyze how the prioritized technologies can apply to opportunities.</li>'+
             '<li>Combine elements from the analysis and create a shared vision for a design team.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.prodpad.com/wp-content/uploads/Roadmap_-_with_annotations-600x395.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Only Designer, Flexible')
technique47.save!

technique48 = Post.new(title: 'Role-playing',
             body: 'Role-playing seeks to get a deep understanding of users’ habit and design challenges and opportunities by simulating the users’ role in a scenario.',
             instruction: '<ol>' + 
             '<li>Decide a scenario and a task to accomplish.</li>'+
             '<li>Invite some team members who are willing to join a role play session.</li>'+
             '<li>Play the roles of users.</li>'+
             '<li>Other team members record the sessions using photos, notes, or videos.</li>'+
             '<li>Discussion.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.news-medical.net/image.axd?picture=Simulated%20Role%20Playing%20with%20Actors.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit Investigation, User Simulation, Only Designer, Short Term')
technique48.save!

technique49 = Post.new(title: 'Scenarios',
             body: 'A scenario is to use narratives to explain the future use of a service from a user’s point of view, which seeks to help design teams to understand service environment of people’s daily life.',
             instruction: '<ol>' + 
             '<li>Have a basic understanding of the tasks.</li>'+
             '<li>Describe a task in simple language. </li>'+
             '<li>Include all relevant aspects of the interaction (e.g., the reason that Jane is continually interrupted by telephone calls may be relevant to the software platform.).</li>'+
             '<li>Review the scenario. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://s-media-cache-ak0.pinimg.com/originals/de/ab/a4/deaba4995fc5b4e809f221080ce35782.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit Investigation, User Simulation, Only Designer, Short Term')
technique49.save!

technique50 = Post.new(title: 'Sentence Completion',
             body: 'Sentence completion is a technique for creating a questionnaire that includes a set of beginnings of sentences, which enables users to think about their experience after using a service.',
             instruction: '<ol>' + 
             '<li>Identify the purpose.</li>'+
             '<li>Create a questionnaire with a set of beginnings of sentences.</li>'+
             '<li>Recruit participants.</li>'+
             '<li>Send out questionnaire.</li>'+
             '<li>Collect sentences.</li>'+
             '<li>Analyze user experience.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Kujala, S., Walsh, T., Nurkka, T., Crisan, M. (2013). Sentence Completion for Understanding Users and Evaluating User Experience. Interacting with Computers, 26, 3, 238-255.
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Detailed Prototype, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Questionnaire',
             freetag_list: 'User Habit Investigation, Feedback Collection, User Participation, Short Term')
technique50.save!

technique51 = Post.new(title: 'Service Blueprint',
             body: 'Service blueprinting seeks to visualize key activities and connections between the activities in service processes from customers’ perspective, which helps to generate service innovations, improve service qualities and customer experience.',
             instruction: '<ol>' + 
             '<li>Invite people to create a service blueprint (people from cross-functional teams and customers are suggested to be involved if possible).</li>'+
             '<li>Articulate the service process.</li>'+
             '<li>Delineate customers actions.</li>'+
             '<li>Delineate employers frontstage and backstage actions.</li>'+
             '<li>Add underlying support processes in the blueprint.</li>'+
             '<li>Link customers’ actions and employees’ actions and support processes.</li>'+
             '<li>Use the service blueprint to develop a new service or optimize existing service.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.cooper.com/journal/2014/08/service-blueprints-laying-the-foundation</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'User Habit Investigation, Collected Information Organization, User Participation, Short Term')
technique51.save!

technique52 = Post.new(title: 'Shadowing',
             body: 'The shadowing technique enables designers to understand existing user behaviors by observing users in a natural environment.',
             instruction: '<ol>' + 
             '<li>Locate a venue and the appropriate person(s) within that venue to observe. </li>'+
             '<li>Closely follow an individual over a set period of time. </li>'+
             '<li>Record and compile the field notes.</li>'+
             '<li>Analyze data that has been accumulated during the shadowing period. </li>'+
             '<li>Data can be summarized or presented by using storyboards, scenarios, personas, etc.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://pbs.twimg.com/media/CRb5SXGWwAEa2fc.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'User Habit Investigation, Observation, User Participation, Long Term')
technique52.save!

technique53 = Post.new(title: 'Speed Dating',
             body: 'Speed dating seeks to support low-cost, rapid comparison of design opportunities before expensive prototypes are built.',
             instruction: '<ol>' + 
             '<li>Need validation
i. Present storyboards and a set of target users.
ii. Conduct sessions with small groups of target users, presenting boards serially and following each with a lead question. </li>'+
             '<li> User enactments
i. Depict the design issues on the axes of a speed dating matrix.
ii. Build a fictional environment and ask participants to walk through simulated daily routines.</li>'+
             '<li>Follow-up interviews.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Davidoff, S., Lee, M.K., Dey, A.K., Zimmerman, J., 2007. Rapidly Exploring Application Design Through Speed Dating, in: Proceedings of The International Conference on Ubiquitous Computing (UbiComp’07). pp. 429–446. doi:10.1007/11853565_2
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Experiment',
             freetag_list: 'Evaluation, Prototype Evaluation, Observation, User Participation, Short Term')
technique53.save!

technique54 = Post.new(title: 'Stakeholder Maps',
             body: 'Stakeholder maps enable a team to visualize the consolidate and communication between key constituents of a design project at the beginning of the design process.',
             instruction: '<ol>' + 
             '<li>Invite people who will benefit from the project.</li>'+
             '<li>Start with team brainstorming. </li>'+
             '<li>List roles (students, managers, etc.) of stakeholders.</li>'+
             '<li>Sketch relationships between stakeholders into an organized structure, defining possible hierarchies between roles.</li>'+
             '<li>Use the stakeholder map to guide appropriate communication with stakeholders throughout the project development process.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://payload194.cargocollective.com/1/9/316073/6187564/2%20stakeholder%20map.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Observation',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Collected Information Organization, Collaboration With Stakeholders, Short Term')
technique54.save!

technique55 = Post.new(title: 'Stakeholder Walkthrough',
             body: 'Stakeholder walkthrough enables end users, stakeholders, and the design team together to evaluate early prototypes, which provides an opportunity for users and stakeholders to provide actionable recommendations for improvements and building empathy.',
             instruction: '<ol>' + 
             '<li>Define the walkthrough’s scope and objectives. </li>'+
             '<li>Invite participants (representative end users, the interdisciplinary development team, and project stakeholders (less than 20 people) together in a conference room).</li>'+
             '<li>Stakeholders and the development team listen to how people use the interface to accomplish tasks.</li>'+
             '<li>Discuss and analyze how to solve problems during the walkthrough.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://cdn-images-1.medium.com/max/800/1*_t7mKqQ0rf6fg4MEgTzXsQ.jpeg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Group Discussion',
             freetag_list: 'Evaluation, Prototype Evaluation, Collaboration With Stakeholders, Short Term')
technique55.save!

technique56 = Post.new(title: 'Storyboards',
             body: 'A storyboard is a visual representation of the interaction between users and products or services, which includes a sequence of images that describe environments, users, and products. This technique helps to generate design alternatives in the early phase of a design process.',
             instruction: '<ol>' + 
             '<li>Brainstorm about design alternatives and sketch storyboards individually (need to consider the environment, visual cues, audible cues, tactile cues, user input, interface output, user emotion, technology, quality of experience).</li>'+
             '<li>Designers meet in front of a whiteboard (as a timeline to present creation process).</li>'+
             '<li>Stick storyboards to the whiteboards.</li>'+
             '<li>Compare storyboards, discuss ideas, and decide a shared understanding.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.ac4d.com/b/wp-content/uploads/2013/12/FaF_PSD.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Only Designer, Short Term')
technique56.save!

technique57 = Post.new(title: 'Story Sharing',
             body: 'Story sharing enables a design team to seek out same contents within different use contexts to generate opportunities and solutions.',
             instruction: 'From IDEOS HCD Toolkit' +
             '<ol>' + 
             '<li>Gather the design team together in a room with plenty of wall space.</li>'+
             '<li>Distribute post-it notes and markers.</li>'+
             '<li>Tell the team to capture their thoughts on the post-its as they speak.</li>'+
             '<li>Ask each team member to share the story of the person(s) they met.</li>'+
             '<li>Line up many sheets on the wall with many post-it notes at the end of Story Sharing.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://news.emory.edu/slideshows/rushdie_cola_conversation1/0021903-15AB139.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Only Designer, Short Term')
technique57.save!

technique58 = Post.new(title: 'Territory Maps',
             body: 'Territory maps seek to present a shared version of the contribution of each team member in a design team. Creating territory maps at the early stage of the design process cannot only visualize the collaboration between team members, but also fosters and maintains the focus of design activities.',
             instruction: '<ol>' + 
             '<li>Tell each member to consider their contributions on their own (consider the trends, ideas, and stakeholders they deem important to the topic to provide context for their choices).</li>'+
             '<li>Bring the collected contributions together in a group.</li>'+
             '<li>Based on the contributions of each person come to a shared vision.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://s-media-cache-ak0.pinimg.com/originals/76/3e/e8/763ee80bbc6eff778eae370d4829d2da.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Only Designer, Short Term')
technique58.save!

technique59 = Post.new(title: 'The Love Letter & Breakup Letter',
             body: 'The love letter and the breakup letter enable people to express their sentiments about a product or a service, which gain insights into values and expectations in daily life.',
             instruction: '<ol>' + 
             '<li>Decide how many letters you would like to have and what the character is of the insights you are gathering.</li>'+
             '<li> Gather a group of people.</li>'+
             '<li>Tell participants to spend no more than 10 minutes to write a love letter or a breakup letter to a product or a service.</li>'+
             '<li>Ask participants to present their letters and record the process.</li>'+
             '<li>Go through all letters and videos (nonverbal cues like voices) to find out what elements influence the relationships between people and a product or a service.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://cdn.morguefile.com/imageData/public/files/j/jade/preview/fldr_2012_09_11/file6461347376319.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Interview',
             freetag_list: 'User Habit Investigation, Feedback Collection, User Participation, Short Term')
technique59.save!

technique60 = Post.new(title: 'Tomorrow Headlines',
             body: 'Tomorrow’s headlines are fictional articles that seek to illustrate how a new service idea or concept will influence people’s daily life or the society in the future. ',
             instruction: '<ol>' + 
             '<li>Gather a group of people.</li>'+
             '<li>Tell the participants to imagine themselves in the future.</li>'+
             '<li>Ask participants to write headlines of newspaper articles. headlines should reflect the vision of a product or a service.</li>'+
             '<li>Post headlines on the wall and present the headlines.</li>'+
             '<li>Get a feel of the different directions of visions of a product or a service.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.tomorrowtodayglobal.com/wp-content/uploads/Headlines1.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, User Participation, Short Term')
technique60.save!

technique61 = Post.new(title: 'Touchpoints Matrix',
             body: 'A touchpoint matrix visualizes how users interact with different touchpoints in the product-service system. The techniques can be used to analyze existing service system as well as support a concept design phase.',
             instruction: '<ol>' + 
             '<li>Define components (listing the different touchpoints in the vertical axis and system supported main actions in the horizontal axis).</li>'+
             '<li>Build a touchpoint matrix.</li>'+
             '<li>Add dots in the intersection to present potential interactions with touchpoints.</li>'+
             '<li>Put a specific persona inside and imagine his or her journey through the different touchpoints, connecting the related dots.</li>'+
             '<li>Highlight design opportunities and user requirements.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: Brugnoli, G. (2011) ‘Connecting the Dots of User Experience’, Journal of Information Architecture, 1(1), pp. 6–15.
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Observation',
             freetag_list: 'User Habit Investigation, Collected Information Organization, Only Designer, Short Term')
technique61.save!

technique62 = Post.new(title: 'User Journey Maps',
             body: 'A user journey map visualizes the process that people would interact with a service from the perspective of users, which enable designers to see the magic moments and pain points. A shared version of a user journey map helps a design team to optimize a service process before comes to a released version. ',
             instruction: '<ol>' + 
             '<li>The create of user journey map starts with the first time users aware of the service.</li>'+
             '<li>Identify individual touchpoints (people, information, products, etc.) within each stage.</li>'+
             '<li>Draw a timeline for period of time corresponding to an activity of interest.</li>'+
             '<li>Link the touchpoints.</li>'+
             '<li>Discuss the user journey map in a cross-functional team and identify problems and solutions.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://s3.amazonaws.com/sitesusa/wp-content/uploads/sites/212/2015/07/1000-x-800-USAgov-Personas-and-Journey-Maps.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'User Habit Investigation, Collected Information Organization, User Participation, Short Term')
technique62.save!

technique63 = Post.new(title: 'UX Curve',
             body: 'UX curve supports users to recall details of interactive experience with a product or a service, which reveals how relationships between users and products or services evolve over time. ',
             instruction: '<ol>' + 
             '<li>Recruit participants for a long-term study (3-12 months).</li>'+
             '<li>Ask participants to use a product or a service and hand out the first empty UX curve template and advise participants to draw a curve to describe their experience towards a product or a service.</li>'+
             '<li>Tell participants to draw four other curves from different UX perspectives: attractiveness, ease of use, utility, and degree of usage.</li>'+
             '<li>Collect and analyze the results to see how user experience changes over time.</li>'+
             '</ol>',
             user: User.first,
             references: '<ol>' + 
             '<li>image: Kujala, S., Roto, V., Kaisa Väänänen-Vainio-Mattila, E.K., Sinnelä, A., 2011. UX Curve: A method for evaluating long-term user experience. Interact. Comput. 23, 473–483. doi:10.1016/j.intcom.2011.06.005
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             subcategory_list: 'Design Phase-Launching, Time Dependency-Retrospective, Duration-Long Term, User Participation-User Involved, Evaluation Type-Questionnaire',
             freetag_list: 'Evaluation, Released Version Evaluation, Feedback Collection, User Participation, Long Term')
technique63.save!

technique64 = Post.new(title: 'Value Mapping',
             body: 'c',
             instruction: '<ol>' + 
             '<li>Individually write down most valuable works for oneself and the organization on cards.</li>'+
             '<li>Place cards on a value map template and rank the cards from always important to never important.</li>'+
             '<li>Share value maps with others and get feedback.</li>'+
             '<li>Gather all team members and set up a meeting to determine important values of the organization. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://diytoolkit.org/media/value-mapping_preview.png</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Idea Generation, Processe And Role Relations Analysis, Only Designer, Short Term')
technique64.save!

technique65 = Post.new(title: 'Value Opportunity Analysis',
             body: 'c',
             instruction: '<ol>' + 
             '<li>Decide what to analyze. </li>'+
             '<li>Analyze the product from seven value opportunities in a team:
Emotion: adventure, independence, security, sensuality, confidence, power 
Ergonomics: comfort, safety, ease of use
Aesthetics: visual, auditory, tactile, olfactory, taste
Identity: point in time, sense of place, personality
Impact: social, environmental
Core Technology: reliable, enabling
Quality: craftsmanship, durability</li>'+
             '<li>Discuss the results and see how to improve the current version.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://static1.squarespace.com/static/57e5c7c3b3db2b1dd1139b84/t/580400d7579fb3a0f45ded84/1476657372234/
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-User Involved, Evaluation Type-Group Discussion',
             freetag_list: 'Evaluation, Released Version Evaluation, Feedback Collection, Only Designer, Short Term')
technique65.save!

technique66 = Post.new(title: 'Web Analytics',
             body: 'Web analytics enables an organization to understand how and what users are doing online by collecting, analyzing, and reporting Internet data.',
             instruction: '<ol>' + 
             '<li>Articulate goals of what information is needed.</li>'+
             '<li>Collect raw data by using a service such as Google Analytics.</li>'+
             '<li>Regular report data to internal stakeholders. </li>'+
             '<li>Determine what to change. </li>'+
             '<li>Track the results of the changes.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.google.com/analytics/#?modal_active=none</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Launching, Time Dependency-Real Time, Duration-Long Term, User Participation-User Involved, Evaluation Type-Observation',
             freetag_list: 'Evaluation, Released Version Evaluation, Collected Information Organization, User Participation, Long Term')
technique66.save!

technique67 = Post.new(title: 'Web of Abstraction',
             body: 'Web of Abstraction seeks to examine the challenges associated with a vision or desired outcome, which helps to generate ideas and solutions and support decision-making process. Ideas and solutions can be generated by continuously asking two questions, “Why” and “What is stopping me/us?”',
             instruction: '<ol>' + 
             '<li>Identify the original challenge and write the challenge in the center of a piece of paper. </li>'+
             '<li>Begin asking “Why?” Why is this a problem? Why is it important? Ask “Why else?” Try to think of another reason for why to reach this goal. Keep asking “Why?” at each level (write why questions above the original challenge).</li>'+
             '<li>Ask “What’s stopping me?” What else is stopping me? Repeat at each level (write what questions below the original challenge).</li>'+
             '<li>Look at the web and choose a line of questions to converge. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: https://www.google.com/analytics/#?modal_active=none
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Planning, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Observation',
             freetag_list: 'Idea Generation, Only Designer, Short Term')
technique67.save!

technique68 = Post.new(title: 'Weighted Matrix',
             body: 'A weighted matrix enables the comparison of importance level of multiple criteria in order to make a shared decision on alternatives in a multidisciplinary team. ',
             instruction: '<ol>' + 
             '<li>Gather team members and brainstorm the evaluation criteria.</li>'+
             '<li>Identify the criteria that must be included to refine the list of criteria. </li>'+
             '<li>Assign a weight factor to each criterion based on the importance of each.</li>'+
             '<li>Construct a two-dimensional table (design options as rows and the design criteria as columns).</li>'+
             '<li>Calculate weighted scores for each design options. </li>'+
             '<li>Evaluate each choice and come to a shared decision.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://cdn.morguefile.com/imageData/public/files/j/jade/preview/fldr_2012_09_11/file6461347376319.jpg</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Evaluation, Released Version Evaluation, Collected Information Organization, Only Designer, Short Term')
technique68.save!

technique69 = Post.new(title: 'Wireframe',
             body: 'Wireframes depict simplified outlines of all the different elements on a user interface, which serve as low-fidelity prototypes that allow designers to have a clear understanding of the architecture and functions of an interface. ',
             instruction: '<ol>' + 
             '<li>Prepare content for a wireframe. </li>'+
             '<li>Identify main elements of a website or an application.</li>'+
             '<li>Start sketches as early wireframes. </li>'+
             '<li>Share wireframes with stakeholders for feedback and iterate wireframes. </li>'+
             '<li>Test iterated wireframes and move to high-fidelity prototypes. </li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://www.pixeden.com/media/k2/galleries/894/001-wire-frame-blue-print-project-app-screens-presentation-mockup-psd-vector.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Retrospective, Duration-Short Term, User Participation-Without Real User, Evaluation Type-Group Discussion',
             freetag_list: 'Prototyping, Only Designer, Flexible')
technique69.save!

technique70 = Post.new(title: 'Wizard of Oz',
             body: 'Wizard of Oz technique enables users to interact with a low-cost and non-functional prototype by having a “wizard” behind-the-scenes to operate the interaction, which tests users’ willingness to new things before building costly prototypes. ',
             instruction: '<ol>' + 
             '<li>Create a low-cost and non-functional prototype for the simulation.</li>'+
             '<li>Develop a test plan.</li>'+
             '<li>Recruit participants for the test. </li>'+
             '<li>Assign a researcher as the wizard who hides from view to react to users’ action and observe the users’ interaction.</li>'+
             '<li>Take notes on how people perform during the interaction process. </li>'+
             '<li>Have a feedback session with participants to understand their impression of the system.</li>'+
             '</ol>',
             references: '<ol>' + 
             '<li>image: http://bwang29.github.io/offshore/gesture/wizard_testing_2.jpg
</li>'+
             '<li></li>'+
             '<li></li>'+
             '<li></li>'+
             '</ol>',
             user: User.first,
             subcategory_list: 'Design Phase-Draft Prototype, Time Dependency-Real Time, Duration-Short Term, User Participation-User Involved, Evaluation Type-Experiment',
             freetag_list: 'Prototyping, Observation, User Participation, Flexible')
technique70.save!



# 15.times do

# post = Post.new(title: Faker::StarWars.character,
#              body: Faker::StarWars.quote,
#              instruction: Faker::StarWars.wookie_sentence,
#              user: User.first,
#              freetag_list: Faker::StarWars.vehicle)

# post.categories = [ category1, category2, category3, category4, category5]
# post.save!



# end