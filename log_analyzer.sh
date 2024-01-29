#!/bin/bash



###  Color Functions  ###
ColorGreen(){
	green='\e[32m'
	clear='\e[0m'
	echo -ne $green$1$clear
}
ColorBlue(){
	blue='\e[34m'
	clear='\e[0m'
	echo -ne $blue$1$clear
}
ColorRed(){
	red='\e[31m'
	clear='\e[0m'
	echo -ne $red$1$clear
}
ColorOrange(){
	orange='\e[33m'
	clear='\e[0m'
	echo -ne $orange$1$clear
}







## functions
get_request_pages_404(){
echo $(ColorGreen "Top 10: 404 Page Responses:")
echo $(ColorGreen "===========================")
grep "404" $LOGFILE |sort | uniq -c | sort -rn | awk '{print $1, $2, $8}' | head -10
echo ""
}

No_of_404_errors(){
echo  -e "Number of 404 errors: $(grep "404" "$LOGFILE" | wc -l)"
}

get_request_ips(){
echo ""
echo $(ColorGreen "Top 10 Request IP's:")
echo $(ColorGreen "====================")
cat $LOGFILE | awk '{print $1}'| sort | uniq -c | sort -rn | awk '{print $1, $2}' | head -10

echo ""
}


get_request_methods(){
echo $(ColorGreen "Top 10 GET requests:")
echo $(ColorGreen "====================")

cat $LOGFILE | grep GET | cut -d\" -f2 | awk '{print $1 " " $2}' | cut -d? -f1 | sort | uniq -c | sort -rn | sed 's/[ ]*//' | head -10 |  sed  's/^ *//g' | column -s '' -s ' ' -t
echo ""
}

post_request_methods(){
echo $(ColorGreen "Top 10 POST requests:")
echo $(ColorGreen "====================")

cat $LOGFILE | grep POST | cut -d\" -f2 | awk '{print $1 " " $2}' | cut -d? -f1 | sort | uniq -c | sort -rn | sed 's/[ ]*//' | head -10 |  sed  's/^ *//g' | column -s '' -s ' ' -t
echo ""
}


get_request_pages(){
echo $(ColorGreen "Top 10 Request Pages:")
echo $(ColorGreen "=====================")
cat $LOGFILE | awk '{print $7}' |cut -d\" -f2 | awk '{print $1 " " $2}' | cut -d? -f1 | sort | uniq -c | sort -rn | sed 's/[ ]*//' | head -10 |  sed  's/^ *//g' | column -s '' -s ' ' -t
echo ""
}


function access_log_summary() {
# The log is the first argument
LOGFILE=${1}

echo ""
echo $(ColorOrange "Summarizing log..")
echo ""
# executing

if [[ $LOGFILE ]] ; then
	get_request_ips
	get_request_methods
	post_request_methods
	get_request_pages
	get_request_pages_404
	No_of_404_errors

else
	echo ""
	echo $(ColorGreen "No log found..");
	sleep 1
fi
                echo $(ColorRed "########## END  ###########");
}



if [[ -z $1 ]] ; then
	echo ""
	echo $(ColorGreen "    This script summarizes your access logs");
	echo ""
	echo $(ColorGreen "    Specify the log that you want to summarize..");
	echo $(ColorOrange "    Example:");
	echo $(ColorOrange "        ./log_analyzer your_log");
	echo ""
else
	access_log_summary $1
fi
