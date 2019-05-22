
$subway_system = {
  :N => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  :L => ['8th', '6th', 'Union Square','3rd', '1st'],
   6 => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}

puts $subway_system

def plan_trip(line_start, start_station, line_end, end_station)

  index_start = $subway_system[line_start].index(start_station)
  index_end = $subway_system[line_end].index(end_station)

  index_common_one = $subway_system[line_start].index('Union Square')
  index_common_two = $subway_system[line_end].index('Union Square');

  trip_list_one = "Your journey will be through the following stops on the #{line_start} line: "

  total_stops = 0

  if index_start < index_common_one
    i = index_start+1
    while i <= index_common_one do
      trip_list_one += $subway_system[line_start][i] + ', '
      i = i + 1 # where you may freely set i to any value
      total_stops += 1
    end
  elsif index_start > index_common_one
    i = index_start-1
    while i >= index_common_one do
      trip_list_one += $subway_system[line_start][i] + ', '
      i = i - 1 # where you may freely set i to any value
      total_stops += 1
    end
  end

  trip_list_one[-2] = '.'

  trip_list_two = "Your journey will be through the following stops on the #{line_end} line: "

  if index_common_two < index_end
    i = index_common_two+1
    while i <= index_end do
      trip_list_two += $subway_system[line_end][i] + ', '
      i = i + 1 # where you may freely set i to any value
      total_stops += 1
    end
  elsif index_common_two > index_end
    i = index_common_two-1
    while i >= index_end do
      trip_list_two += $subway_system[line_end][i] + ', '
      i = i - 1 # where you may freely set i to any value
      total_stops += 1
    end
  end

  trip_list_two[-2] = '.'
  journey = trip_list_one + "Change at Union Square station. " + trip_list_two
  stops = "#{total_stops} stops in total."
  return journey + stops
end

puts "#{plan_trip :N, '34th', :L, '1st'}"
