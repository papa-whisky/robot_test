require 'process_input'

describe 'process_input' do
  context 'given argument "PLACE 0,0,NORTH REPORT"' do
    it 'should print 0,0,NORTH' do
      expect { process_input "PLACE 0,0,NORTH REPORT" }
        .to output("0,0,NORTH\n").to_stdout
    end
  end

  context 'given argument "PLACE 2,4,WEST REPORT"' do
    it 'should print 2,4,WEST' do
      expect { process_input "PLACE 2,4,WEST REPORT" }
        .to output("2,4,WEST\n").to_stdout
    end
  end

  context 'given argument "MOVE LEFT LEFT MOVE BLAH BLAH,.PLACE 0,2,EAST REPORT"' do
    it 'should print 0,2,EAST' do
      expect { process_input "MOVE LEFT LEFT MOVE BLAH BLAH,.PLACE 0,2,EAST REPORT" }
        .to output("0,2,EAST\n").to_stdout
    end
  end

  context 'given agrument "PLACE 0,0,NORTH MOVE REPORT"' do
    it 'should print 0,1,NORTH' do
      expect { process_input "PLACE 0,0,NORTH MOVE REPORT" }
        .to output("0,1,NORTH\n").to_stdout
    end
  end

  context 'given agrument "PLACE 0,0,NORTH LEFT REPORT"' do
    it 'should print 0,0,WEST' do
      expect { process_input "PLACE 0,0,NORTH LEFT REPORT" }
        .to output("0,0,WEST\n").to_stdout
    end
  end

  context 'given agrument "PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT"' do
    it 'should print 3,3,NORTH' do
      expect { process_input "PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT" }
        .to output("3,3,NORTH\n").to_stdout
    end
  end

  context 'given agrument "PLACE 3,4,SOUTH MOVE REPORT LEFT MOVE REPORT PLACE 0,0,EAST MOVE MOVE RIGHT REPORT"' do
    it 'should print 3,3,SOUTH => 4,3,EAST => 2,0,SOUTH' do
      expect { process_input "PLACE 3,4,SOUTH MOVE REPORT LEFT MOVE REPORT PLACE 0,0,EAST MOVE MOVE RIGHT REPORT" }
        .to output("3,3,SOUTH\n4,3,EAST\n2,0,SOUTH\n").to_stdout
    end
  end

  context 'given argument "PLACE 3,4,SOUTH sfdaT somethin REPORT blah, right move report"' do
    it 'should print 3,4,SOUTH => 2,4,WEST' do
      expect { process_input "PLACE 3,4,SOUTH sfdaT somethin REPORT blah, right move report" }
        .to output("3,4,SOUTH\n2,4,WEST\n").to_stdout
    end
  end

  context 'given argument "kscdl joicjsae place csdjkla move report place 3,3,south move right move report"' do
    it 'should print 2,2,WEST' do
      expect { process_input "kscdl joicjsae place csdjkla move report place 3,3,south move right move report" }
        .to output("2,2,WEST\n").to_stdout
    end
  end

  context 'given argument "PLACE 5,1,NORTH REPORT' do
    it 'should not print anything' do
      expect { process_input "PLACE 5,1,NORTH REPORT" }
        .to output("").to_stdout
    end
  end

  context 'given argument "PLACE 3,-1,EAST REPORT' do
    it 'should not print anything' do
      expect { process_input "PLACE 3,-1,EAST REPORT" }
        .to output("").to_stdout
    end
  end

  context 'given argument "PLACE 4,1,invalid REPORT' do
    it 'should not print anything' do
      expect { process_input "PLACE 5,1,invalid REPORT" }
        .to output("").to_stdout
    end
  end

  context 'given argument "something not valid place 0,3,south move report nothing PLACE 1,2,WEST MOVE RIGHT RIGHT REPORT blahblah report"' do
    it 'should print 0,2,SOUTH => 0,2,EAST => 0,2,EAST' do
      expect { process_input "something not valid place 0,3,south move report nothing PLACE 1,2,WEST MOVE RIGHT RIGHT REPORT blahblah report" }
        .to output("0,2,SOUTH\n0,2,EAST\n0,2,EAST\n").to_stdout
    end
  end
end
