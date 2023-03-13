require './lib/knight'

def knight_moves(from, to, q = [], visited = [])
  return to if from == to

  n = if from.is_a?(Knight)
        from
      else
        Knight.new(from)
      end
  visited << n.position

  if n.legal_moves.include?(to)
    path = [n]
    path.prepend(path[0].parent) until path[0].parent.nil?
    return path.map(&:position).append(to)
  end
  q += n.legal_moves.difference(visited)
  q.uniq!
  knight_moves(q.shift, to, q, visited)
end

p knight_moves([0, 0], [7, 1])
