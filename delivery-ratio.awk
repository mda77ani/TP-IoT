BEGIN {
	sent=0;
	received=0;
	dropped=0;
}

{
	if(($1=="s") && ($7=="cbr")){
		sent++;
#		print $0

	}
	if(($1=="r") && ($3=="_0_") && ($7=="cbr")) {
		received++;
#		print $0

	}
	if(($1=="D") && ($3=="_0_") && ($7=="cbr")){
#		print $0
		dropped++;
	}
 
}

END{
	printf " Packets sent: %d",sent;
	printf "\n Packets received: %d",received;
	printf "\n Packets dropped at _0_: %d",dropped;	
	printf "\n Packet Delivery Rate: %.2f %",(received/sent)*100;
	printf "\n Packet Error Rate: %.2f % \n",(dropped/sent)*100;

}