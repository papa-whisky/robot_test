require 'robot'

describe Robot do
  describe '.new' do
    context 'given an argument {xpos: 0, ypos: 0, bearing: "north"}' do
      let(:robot) { Robot.new(xpos: 0, ypos: 0, bearing: 'north') }

      it 'should return a Robot object' do
        expect(robot).to be_an_instance_of(Robot)
      end

      it 'should set "bearing" as 0 for bearing value "north"' do
        expect(robot.instance_variable_get :@bearing).to eq 0
      end
    end
  end

  describe '#report' do
    context 'given xpos = 1, ypos = 3, bearing = "south"' do
      it 'should print "1,3,SOUTH"' do
        robot = Robot.new(xpos: 1, ypos: 3, bearing: 'south')
        expect { robot.report }.to output("1,3,SOUTH\n").to_stdout
      end
    end

    context 'given xpos = 4, ypos = 0, bearing = "north"' do
      it 'should print "4,0,NORTH"' do
        robot = Robot.new(xpos: 4, ypos: 0, bearing: 'north')
        expect { robot.report }.to output("4,0,NORTH\n").to_stdout
      end
    end
  end

  describe '#right' do
    context 'given xpos = 1, ypos = 3, bearing = "south"' do
      it 'should change bearing to "WEST"' do
        robot = Robot.new(xpos: 1, ypos: 3, bearing: 'south')
        robot.right
        expect { robot.report }.to output("1,3,WEST\n").to_stdout
      end
    end

    context 'given xpos = 1, ypos = 3, bearing = "west"' do
      it 'should change bearing to "NORTH"' do
        robot = Robot.new(xpos: 1, ypos: 3, bearing: 'west')
        robot.right
        expect { robot.report }.to output("1,3,NORTH\n").to_stdout
      end
    end
  end

  describe '#left' do
    context 'given xpos = 1, ypos = 3, bearing = "south"' do
      it 'should change bearing to "EAST"' do
        robot = Robot.new(xpos: 1, ypos: 3, bearing: 'south')
        robot.left
        expect { robot.report }.to output("1,3,EAST\n").to_stdout
      end
    end

    context 'given xpos = 1, ypos = 3, bearing = "north"' do
      it 'should change bearing to "WEST"' do
        robot = Robot.new(xpos: 1, ypos: 3, bearing: 'north')
        robot.left
        expect { robot.report }.to output("1,3,WEST\n").to_stdout
      end
    end
  end

  describe '#move' do
    context 'while bearing is "north"' do
      context 'given xpos = 1, ypos = 3' do
        it 'should change ypos to 4' do
          robot = Robot.new(xpos: 1, ypos: 3, bearing: 'north')
          robot.move
          expect { robot.report }.to output("1,4,NORTH\n").to_stdout
        end
      end

      context 'given xpos = 1, ypos = 4' do
        it 'should not change position' do
          robot = Robot.new(xpos: 1, ypos: 4, bearing: 'north')
          robot.move
          expect { robot.report }.to output("1,4,NORTH\n").to_stdout
        end
      end
    end

    context 'while bearing is "south"' do
      context 'given xpos = 1, ypos = 3' do
        it 'should change ypos to 2' do
          robot = Robot.new(xpos: 1, ypos: 3, bearing: 'south')
          robot.move
          expect { robot.report }.to output("1,2,SOUTH\n").to_stdout
        end
      end

      context 'given xpos = 1, ypos = 0' do
        it 'should not change position' do
          robot = Robot.new(xpos: 1, ypos: 0, bearing: 'south')
          robot.move
          expect { robot.report }.to output("1,0,SOUTH\n").to_stdout
        end
      end
    end

    context 'while bearing is "east"' do
      context 'given xpos = 1, ypos = 3' do
        it 'should change xpos to 2' do
          robot = Robot.new(xpos: 1, ypos: 3, bearing: 'east')
          robot.move
          expect { robot.report }.to output("2,3,EAST\n").to_stdout
        end
      end

      context 'given xpos = 4, ypos = 0' do
        it 'should not change position' do
          robot = Robot.new(xpos: 4, ypos: 0, bearing: 'east')
          robot.move
          expect { robot.report }.to output("4,0,EAST\n").to_stdout
        end
      end
    end

    context 'while bearing is "west"' do
      context 'given xpos = 1, ypos = 3' do
        it 'should change xpos to 0' do
          robot = Robot.new(xpos: 1, ypos: 3, bearing: 'west')
          robot.move
          expect { robot.report }.to output("0,3,WEST\n").to_stdout
        end
      end

      context 'given xpos = 0, ypos = 2' do
        it 'should not change position' do
          robot = Robot.new(xpos: 0, ypos: 2, bearing: 'west')
          robot.move
          expect { robot.report }.to output("0,2,WEST\n").to_stdout
        end
      end
    end
  end
end
