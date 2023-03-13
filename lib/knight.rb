class Knight
  attr_accessor :position, :parent

  def initialize(position = [], parent = nil)
    @position = position
    @parent = parent
  end

  def ==(other)
    if other.is_a?(Knight)
      @position[0] == other.position[0] && @position[1] == other.position[1]
    else
      @position[0] == other[0] && @position[1] == other[1]
    end
  end

  def legal_moves
    [-2, 2, -1, 1].permutation(2).to_a.reject do |v| 
      v[0].abs == v[1].abs
    end.map { |v| [v[0] + position[0], v[1] + position[1]] }.select do |v|
      v.all? do |k|
        (0..7).include?(k)
      end
    end.map { |v| Knight.new(v, self) }
  end
end
