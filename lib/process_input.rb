require_relative 'robot'

def process_input input
  sessions = input.downcase.sub(/.*?(?=place)/, '').split('place').slice(1..-1)

  sessions.each do |session|
    commands = session.split(' ')
    initial_pos = commands.shift.split(',')

    if initial_pos[0].to_i.to_s == initial_pos[0] && 
        initial_pos[0].to_i.between?(0, 4) && 
        initial_pos[1].to_i.to_s == initial_pos[1] && 
        initial_pos[1].to_i.between?(0, 4) &&
        %w(north east south west).include?(initial_pos[2])
      robot = Robot.new({ xpos: initial_pos[0], ypos: initial_pos[1], bearing: initial_pos[2] })
      commands.keep_if { |command| %w(move left right report).include? command }
        .each { |command| robot.send command }
    end
  end
end
