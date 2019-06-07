#!/bin/bash
# Adapted From: https://stackoverflow.com/a/4025065/5283424
compare_versions () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    # Local variables
    local IFS=. # internal field seperator. Splitting on the .
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    # takes uses base10 and the IFS seperator.
    # echo "value1length ${#ver1[@]} value2length ${#ver1[@]}"
    # echo "inputvalue1 $((10#${ver1[i]})) inputvalue2 $((10#${ver2[i]}))"  
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]] # "-z" True if the length of string is zero.
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

check_version () {
    compare_versions $1 $2
    case $? in
        0) op='=';;
        1) op='>';;
        2) op='<';;
    esac
    if [[ $3 == *"$op"* ]] # allows "<=, >="
    then
        echo "true"
        # echo "FAIL: Expected '$3', Actual '$op', Arg1 '$1', Arg2 '$2'"
    else
        echo "false"
        # echo "Pass: '$1 $op $2'"
    fi
}
check_version $1 $2 $3

# # Run tests
# # argument table format:
# # testarg1   testarg2     expected_relationship
# echo "The following tests should pass"
# while read -r test
# do
#     check_version $test
# done << EOF
# 1            1            =
# 2.1          2.2          <
# 3.0.4.10     3.0.4.2      >
# 4.08         4.08.01      <
# 3.2.1.9.8144 3.2          >
# 3.2          3.2.1.9.8144 <
# 1.2          2.1          <
# 2.1          1.2          >
# 5.6.7        5.6.7        =
# 1.01.1       1.1.1        =
# 1.1.1        1.01.1       =
# 1            1.0          =
# 1.0          1            =
# 1.0.2.0      1.0.2        =
# 1..0         1.0          =
# 1.0          1..0         =
# EOF
# 
# echo "The following test should fail (test the tester)"
# check_version 1 1 '>'
