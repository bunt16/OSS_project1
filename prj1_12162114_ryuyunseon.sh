#!/bin/bash

echo "-------------------------------"
echo "User name : RYU YUN SEON"
echo "Student Number : 12162114"
echo "[ MENU ]"
echo "1. Get the data of the movie identified by a specific 'movie id' from 'u.item'"
echo "2. Get the data of action genre movies from 'u.item'"
echo "3. Get the average 'rating' of the movie identified by specific 'movie id' from 'u.data'"
echo "4. Delete the 'IMDb URL' from 'u.item'"
echo "5. Get the data about users from 'u.user'"
echo "6. Modify the format of 'release date' in 'u.item'"
echo "7. Get the data of movies rated by a specific 'user id' from 'u.data'"
echo "8. Get the average 'rating' of movies rated by users with 'age' between 20 and 29 and 'occupation' as 'programmer'"
echo "9. Exit"
echo "------------------------------"
echo -n "Enter your choice [ 1-9 ] "

read number

while [ $number -ne 9 ]	
do

	if [ $number -eq 1 ]
	then
		echo -n "Please enter 'movie id' (1~1682) : "
		read num1
		awk 'NR == '"$num1"' { print $0 }' u.item

	elif [ $number -eq 2 ]
	then

		echo -n "Do you want to get the data of 'action' genre movies from 'u.item'? (y/n) : "
		read yesORno
		if [ $yesORno == "y" ] || [ $yesORno == "yes" ] || [ $yesORno == "Y" ] || [ $yesORno == "YES" ]
		then	
			awk -F '|' '{ if(i==10) { exit }; if($7 == "1") { print $1, $2; i++ } }' u.item
		fi

	elif [ $number -eq 3 ]
	then
		echo -n "Please enter the 'movie id' (1~1682) : "
		read num3
		awk '{ if($2 == '"$num3"') { count++; sum+=$3 } } END { print sum/count }' u.data

	elif [ $number -eq 4 ]
	then
		echo -n "Do you want to delete the 'IMDb URL' from 'u.item'? (y/n) : "
		read yesORno
                if [ $yesORno == "y" ] || [ $yesORno == "yes" ] || [ $yesORno == "Y" ] || [ $yesORno == "YES" ]
		then
			awk -F '|' 'NR < 11 { $5=""; print $1 " | " $2 " | " $3 " | " $4 " | " $5 " | " $6 " | " $7 " | " $8  " | " $9 " | " $10 " | " $11 " | " $12 " | " $13 " | " $14 " | " $15 " | " $16 " | " $17 " | " $18 " | " $19 " | " $20 " | " $21 " | " $22 " | " $23 " | " $24}' u.item
		#	awk -F '|' 'NR < 11 { $5=""; print $0 }' u.item	  # 구분자 |가 사라진다

		fi
	elif [ $number -eq 5 ]
	then
		echo -n "Do you want to get the data about users from 'u.user'? (y/n) : "
		read yesORno
                if [ $yesORno == "y" ] || [ $yesORno == "yes" ] || [ $yesORno == "Y" ] || [ $yesORno == "YES" ]
		then
			awk -F '|' 'NR < 11 { if($3=="M") { print "user " $1 " is " $2 " years old male "  $4}; if($3=="F") { print "user " $1 " is " $2 " years old female "  $4 } }' u.user
		fi
		
	elif [ $number -eq 6 ]
	then
		echo -n "Do you want to Modify the format of 'release data' in 'u.item'? (y/n) : "
		read yesORno
	        if [ $yesORno == "y" ] || [ $yesORno == "yes" ] || [ $yesORno == "Y" ] || [ $yesORno == "YES" ]
		then
			awk -F '[|-]' 'NR>=1673 && NR<=1682 { if($4=="Jan") { $4=($5 "01" $3); $3=$5=""; print $0 } if($4=="Feb") { $4=($5 "02" $3); $3=$5=""; print $0 } if($4=="Mar") { $4=($5 "03" $3); $3=$5=""; print $0 } if($4=="Apr") { $4=($5 "04" $3); $3=$5=""; print $0 } if($4=="May") { $4=($5 "05" $3); $3=$5=""; print $0 } if($4=="Jun") { $4=($5 "06" $3); $3=$5=""; print $0 } if($4=="Jul") { $4=($5 "07" $3); $3=$5=""; print $0 } if($4=="Aug") { $4=($5 "08" $3); $3=$5=""; print $0 } if($4=="Sep") { $4=($5 "09" $3); $3=$5=""; print $0 } if($4=="Oct") { $4=($5 "10" $3); $3=$5=""; print $0 } if($4=="Nov") { $4=($5 "11" $3); $3=$5=""; print $0 } if($4=="Dec") { $4=($5 "12" $3); $3=$5=""; print $0 } }' u.item
			
		fi

	elif [ $number -eq 7 ]
	then
		echo -n "Please enter the 'user id' (1 ~ 943) : "
		read num7
		awk '{ if($1=='"$num7"') { a[count++]=$2 } } END { for(n=0; n<count; n++) { print a[n] } }' u.data
		
		
		
		
		

	fi
	echo -n "Enter your choice [ 1-9 ] "
	read number

done

echo "Bye!"
