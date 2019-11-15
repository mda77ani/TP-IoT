BEGIN {
	active=0;
	all=0;
}

{
	all++;

	if($3=="_3_"){
		active++;
	}
 
}

END{
	printf "\n _3_ duty cycle: %.2f%\n",(active/all)*100;
}