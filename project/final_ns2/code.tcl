set ns [new Simulator]
set nf [open code.nam w]
$ns namtrace-all $nf
set tf [open code.tr w]
$ns trace-all $tf
proc finish { } {
global ns nf tf
$ns flush-trace
close $nf
close $tf
exec nam code.nam &
exit 0
}
set topography [new Topography]
$topography load_flatgrid 400 400
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]
set n9 [$ns node]
set n10 [$ns node]
set n11 [$ns node]
set n12 [$ns node]
set n13 [$ns node]
set n14 [$ns node]
set n15 [$ns node]

# Letter S is capital
# open a nam trace file in write mode
# nf nam filename
# tf trace filename
# clears trace file contents
# creates 3 nodes
$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns duplex-link $n2 $n3 1Mb 10ms DropTail
$ns duplex-link $n3 $n0 1Mb 10ms DropTail
$ns duplex-link $n4 $n5 1Mb 10ms DropTail
$ns duplex-link $n5 $n6 1Mb 10ms DropTail
$ns duplex-link $n6 $n7 1Mb 10ms DropTail
$ns duplex-link $n7 $n4 1Mb 10ms DropTail
$ns duplex-link $n8 $n9 1Mb 10ms DropTail
$ns duplex-link $n9 $n10 1Mb 10ms DropTail
$ns duplex-link $n10 $n11 1Mb 10ms DropTail
$ns duplex-link $n11 $n8 1Mb 10ms DropTail
$ns duplex-link $n12 $n13 1Mb 10ms DropTail
$ns duplex-link $n13 $n14 1Mb 10ms DropTail
$ns duplex-link $n14 $n15 1Mb 10ms DropTail
$ns duplex-link $n15 $n12 1Mb 10ms DropTail
$ns duplex-link $n0 $n4 1Mb 10ms DropTail
$ns duplex-link $n1 $n5 1Mb 10ms DropTail
$ns duplex-link $n2 $n6 1Mb 10ms DropTail
$ns duplex-link $n3 $n7 1Mb 10ms DropTail
$ns duplex-link $n4 $n8 1Mb 10ms DropTail
$ns duplex-link $n5 $n9 1Mb 10ms DropTail
$ns duplex-link $n6 $n10 1Mb 10ms DropTail
$ns duplex-link $n7 $n11 1Mb 10ms DropTail
$ns duplex-link $n8 $n12 1Mb 10ms DropTail
$ns duplex-link $n9 $n13 1Mb 10ms DropTail
$ns duplex-link $n10 $n14 1Mb 10ms DropTail
$ns duplex-link $n11 $n15 1Mb 10ms DropTail
$ns duplex-link $n12 $n0 1Mb 10ms DropTail
$ns duplex-link $n13 $n1 1Mb 10ms DropTail
$ns duplex-link $n14 $n2 1Mb 10ms DropTail
$ns duplex-link $n15 $n3 1Mb 10ms DropTail


$ns queue-limit $n0 $n1 10
$ns queue-limit $n1 $n2 10
$ns queue-limit $n2 $n3 10
$ns queue-limit $n3 $n0 10
$ns queue-limit $n4 $n5 10
$ns queue-limit $n5 $n6 10
$ns queue-limit $n6 $n7 10
$ns queue-limit $n7 $n4 10
$ns queue-limit $n8 $n9 10
$ns queue-limit $n9 $n10 10
$ns queue-limit $n10 $n11 10
$ns queue-limit $n11 $n8 10
$ns queue-limit $n12 $n13 10
$ns queue-limit $n13 $n14 10
$ns queue-limit $n14 $n15 10
$ns queue-limit $n15 $n12 10
$ns queue-limit $n0 $n4 10
$ns queue-limit $n1 $n5 10
$ns queue-limit $n2 $n6 10
$ns queue-limit $n3 $n7 10
$ns queue-limit $n4 $n8 10
$ns queue-limit $n5 $n9 10
$ns queue-limit $n6 $n10 10
$ns queue-limit $n7 $n11 10
$ns queue-limit $n8 $n12 10
$ns queue-limit $n9 $n13 10
$ns queue-limit $n10 $n14 10
$ns queue-limit $n11 $n15 10
$ns queue-limit $n12 $n0 10
$ns queue-limit $n13 $n1 10
$ns queue-limit $n14 $n2 10
$ns queue-limit $n15 $n3 10



set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 50000
$cbr0 set interval_ 0.005
$cbr0 attach-agent $udp0
# attaching transport layer protocols
set null0 [new Agent/Null]
$ns attach-agent $n15 $null0
$ns connect $udp0 $null0
# creating sink(destination) node
# attaching application layer protocols
$ns at 0.1 "$cbr0 start"
$ns at 10.0 "finish"
$ns run
