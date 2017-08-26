#!/bin/bash
# find out if charging 
result=$(ioreg -l | grep IsCharging | cut -d " " -f 19;)
echo $result
# end find out if charging 

# find out battery percentage
get_percentage(){ numerator=$(ioreg -n AppleSmartBattery | grep CurrentCapacity | cut -d " " -f 19;);denominator=$(ioreg -n AppleSmartBattery | grep MaxCapacity | cut -d " " -f 19;); echo $"(($numerator/$denominator))" | bc -l | while read tmp_percentage; do percentage=${tmp_percentage}; echo "$percentage"; done }
# end find battery percentage

# check battery to acceptance criteria.
percentage="$(get_percentage)";
test=.20;

if (( $(echo "$percentage > $test" | bc -l) )) ; then
  echo "$percentage greater than .20"
elif (( $(echo "$percentage < $test" | bc -l) )) ; then
  echo "$percentage less than .20"
else 
  echo "nothing found"
fi
# end check battery to acceptance criteria.
