class Robot
  BEARINGS = %w(north east south west)

  def initialize params
    @xpos, @ypos = params[:xpos].to_i, params[:ypos].to_i
    @bearing = BEARINGS.index(params[:bearing])
  end

  def report
    puts "#{@xpos},#{@ypos},#{BEARINGS[@bearing].upcase}"
  end

  def right
    @bearing = @bearing == 3 ? 0 : @bearing + 1
  end

  def left
    @bearing = @bearing == 0 ? 3 : @bearing - 1
  end

  def move
    case @bearing
    when 0
      @ypos += 1 unless @ypos == 4
    when 1
      @xpos += 1 unless @xpos == 4
    when 2
      @ypos -= 1 unless @ypos == 0
    when 3
      @xpos -= 1 unless @xpos == 0
    end
  end
end
