# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This will work find_choices
Attempt.delete_all  # since child of Puzzle, Attempt must be deleted first
Puzzle.delete_all
Puzzle.create( puzzle: "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--", level:1)
Puzzle.create(puzzle:"--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3", level:1)
Puzzle.create(puzzle:"29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9", level:1)
Puzzle.create(puzzle:"-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-", level:1)
Puzzle.create(puzzle:"6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--", level:1)
Puzzle.create(puzzle:"---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----", level:2)
Puzzle.create(puzzle:"-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--", level:2)
Puzzle.create(puzzle:"-96-4---11---6---45-481-39---795--43-3--8----4-5-23-18-1-63--59-59-7-83---359---7", level:2)
Puzzle.create(puzzle:"----754----------8-8-19----3----1-6--------34----6817-2-4---6-39------2-53-2-----", level:2)
Puzzle.create(puzzle:"3---------5-7-3--8----28-7-7------43-----------39-41-54--3--8--1---4----968---2--", level:2)
Puzzle.create(puzzle:"3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-", level:3)
Puzzle.create(puzzle:"-2-5----48-5--------48-9-2------5-73-9-----6-25-9------3-6-18--------4-71----4-9-", level:3)
Puzzle.create(puzzle:"--7--8------2---6-65--79----7----3-5-83---67-2-1----8----71--38-2---5------4--2--", level:3)
Puzzle.create(puzzle:"----------2-65-------18--4--9----6-4-3---57-------------------73------9----------", level:3)
Puzzle.create(puzzle:"---------------------------------------------------------------------------------", level:4)
