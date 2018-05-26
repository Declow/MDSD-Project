production MainTerminal

area ProductionFloor size 10 10
	obstacle Pole
		pos 2 2
		size 1 1
	endobstacle
	shelf TestShelf
		pos 9 1
		property PhysicalWeight default 100
	endshelf
endarea

terminatable WeightTooHigh, NotAtRightPlace

task goToShelf
	turn right
	forward 2
	if at TestShelf
		pickup
		turn left
		forward 1
		turn left
		forward 6
		turn right
	else
		terminate NotAtRightPlace
	endif
endtask

task d
	forward 10
endtask

task g
	backward 0
	forward 8
	if at TestShelf
		terminate NotAtRightPlace
	endif
endtask

task driveShelf
	pickup
	if at TestShelf
		if pickedUp PhysicalWeight < 130
			turn left
			backward 20
			
			if 10 = 4
				do g
			endif
		else
			terminate WeightTooHigh
		endif
	endif
endtask

robot r
	startpoint 1 1
	mission
		g terminated {
			NotAtRightPlace {
				do d
			}
		}
	endmission
endrobot

/* 
robot Rob1
	startpoint 0 0
	mission
		goToShelf
	endmission
endrobot
* 
*/

