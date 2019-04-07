User.create!([
  {email: "john@mail.com", password: "demo123", first_name: "John", last_name: "Doe", is_instructor: false},
  {email: "tony@mail.com", password: "demo123", first_name: "Tony", last_name: "Stark", is_instructor: false},
  {email: "george@mail.com", password: "demo123", first_name: "George", last_name: "Bond", is_instructor: false},
  {email: "katty@mail.com", password: "demo123", first_name: "Katty", last_name: "Perry", is_instructor: false},
  {email: "emma@mail.com", password: "demo123", first_name: "Emma", last_name: "Stone", is_instructor: false},
  {email: "ava@mail.com", password: "demo123", first_name: "Ava", last_name: "Bella", is_instructor: false},
  {email: "grace@mail.com", password: "demo123", first_name: "Grace", last_name: "Butler", is_instructor: false},
  {email: "gordon@mail.com", password: "demo123", first_name: "Gordon", last_name: "Ramsey", is_instructor: false},
  {email: "jake@mail.com", password: "demo123", first_name: "Jake", last_name: "Blake", is_instructor: false},
  {email: "kevin@mail.com", password: "demo123", first_name: "Kevin", last_name: "Cameron", is_instructor: false},
  {email: "liam@mail.com", password: "demo123", first_name: "Liam", last_name: "Lambert", is_instructor: false},
  {email: "paul@mail.com", password: "demo123", first_name: "Paul", last_name: "Pogba", is_instructor: false},
  {email: "ryan@mail.com", password: "demo123", first_name: "Ryan", last_name: "Reynolds", is_instructor: false},
  {email: "ted@mail.com", password: "demo123", first_name: "Ted", last_name: "Mosby", is_instructor: false},
  {email: "robin@mail.com", password: "demo123", first_name: "Robin", last_name: "Scherbatsky", is_instructor: false},
  {email: "barney@mail.com", password: "demo123", first_name: "Barney", last_name: "Stinson", is_instructor: false},
  {email: "marshall@mail.com", password: "demo123", first_name: "Marshall", last_name: "Eriksen", is_instructor: false},
  {email: "lily@mail.com", password: "demo123", first_name: "Lily", last_name: "Aldrin", is_instructor: false},
  {email: "chris@mail.com", password: "demo123", first_name: "Chris", last_name: "Evans", is_instructor: false},
  {email: "joe@mail.com", password: "demo123", first_name: "Joe", last_name: "Russo", is_instructor: false},
  {email: "trevor@mail.com", password: "demo123", first_name: "Trevor", last_name: "Allan", is_instructor: false},
  {email: "simon@mail.com", password: "demo123", first_name: "Simon", last_name: "Carr", is_instructor: false},
  {email: "emily@mail.com", password: "demo123", first_name: "Emily", last_name: "Watson", is_instructor: true},
  {email: "frank@mail.com", password: "demo123", first_name: "Frank", last_name: "Arnold", is_instructor: true},
])

Course.create([{name: "CS6310", description: "Principles and concepts involved in the design and analysis of large software systems."},
               {name: "CS6460", description: "Introduction to educational technology, with an emphasis on theoretical foundations."},
               {name: "CS1372", description: "Design, analysis and implementation of programs for engineering problem-solving using ANSI Standard C, with an introduction to C++."},
               {name: "CS6330", description: "Introduction to methods and principles for programming, testing, and managing the evolution of software systems."}])

Group.create([{course_id: 1, name: "Design analysis principles study", instructor_allowed: true},
              {course_id: 1, name: "OOP Software Development", instructor_allowed: true},
              {course_id: 1, name: "OOP Software Performance", instructor_allowed: false},
              {course_id: 2, name: "Behaviour Analysis", instructor_allowed: true},
              {course_id: 2, name: "MOOC Attrition", instructor_allowed: false},
              {course_id: 2, name: "Learning Reminder Application", instructor_allowed: true},
              {course_id: 3, name: "Software Engineering Problem Analysis", instructor_allowed: true},
              {course_id: 3, name: "Software Engineering Techniques", instructor_allowed: true},
              {course_id: 4, name: "Principles of programming project", instructor_allowed: true},
              {course_id: 4, name: "Principles of programming research", instructor_allowed: false}])

State.create!([
  {id: 1, name: "Todo"},
  {id: 2, name: "In Progress"},
  {id: 3, name: "Done"},
])

puts "seed done"
