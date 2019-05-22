require'pry'
@trainline ={
'N' =>['times square', '34th', '28thA', '23rdA', 'union square', '8thA'],

'L' => ['8thB', '6th', 'union square', '3rd', '1st'],

'6' => ['grand central', '33rd', '28thB', '23rdB', 'union square', 'astor place' ]
}

def planTrip (strLine, strStationName, endLine, endStationName )

 if strLine == endLine && strStationName == endStationName
     puts "You are on your destination. Go home!"
   end
 end

def sameline (line, strStationName, endStationName)
   strStation  = @trainline[line].find_index strStationName
   endStation = @trainline[line].find_index endStationName
   # number_of_station = strStation - endStation
   if strStation <  endStation
     puts "Your stations are #{@trainline[line].slice(strStation..endStation)}"
  return endStation - strStation
end
if strStation >  endStation
  print "Your stations are #{@trainline[line].slice(endStation..strStation).reverse}"
  return strStation-endStation
end
end

def trip(line1, strStationName, line2, endStationName)

stop1 =sameline(line1, strStationName,'union square')
stop2 =sameline(line2, 'union square', endStationName)
puts "total stops are #{stop1 + stop2}"

end

# trip('6','33rd','N','times square')
trip 'N','times square', 'N', 'times square'
# sameline('N','union square', 'times square')
