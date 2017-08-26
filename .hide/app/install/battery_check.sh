#!/bin/bash
result=$(ioreg -l | grep IsCharging | cut -d " " -f 19;)
echo $result
