BEGIN{
pkt=0;
time=0;
}
{
if($1=="r" && $3=="9" && $4=="7"){
pkt = pkt + $6;
time =$2;
}
}
END {
printf("throughput:%fMbps",(( pkt / time) * (8 / 1000000)));
}
