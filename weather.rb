def start
  split_column
end

def split_column
  get_arr = read_file
  row = result = []
  get_arr.each do |line|
    for i in 0..4 do
      unless line[i] == '' || line[i] == "\n" || line[i].nil?
        row.push(line[i].to_i)
      end
    end
    row.delete(row[1])
    result.push(row) if row != []
    row = []
  end
  result.delete(result[result.length - 1])
  print_result(result)
  find_min(result)
end

def read_file
  arr = []
  File.read('./weather.dat').each_line.map { |l| arr.push(l.split('  ')) }
  arr
end

def print_result(result)
  result.each.map { |row|
    p row
  }
end

def find_min(result)
  p 'minT is'
  p result.min{|a,b| a.max <=> b.max}
end

start