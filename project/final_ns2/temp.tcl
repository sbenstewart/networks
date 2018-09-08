#Create a simulator object
    set ns [new Simulator]
    $ns color 1 Green
    $ns color 2 Red
    $ns color 3 blue
    $ns color 4 magenta
    #Tell the simulator to use dynamic routing
    $ns rtproto DV
    set tracefile [open out.tr w]
    $ns trace-all $tracefile
    #Open the nam trace file
    set nf [open out.nam w]
    $ns namtrace-all $nf
    #Define a 'finish' procedure
    proc finish {} {
            global ns tracefile nf
            $ns flush-trace
        #Close the trace file
            close $nf
        #Execute nam on the trace file
            exec nam out.nam &
            exit 0
    }
    #Create thirty six nodes
    for {set i 0} {$i < 21} {incr i} {
            set n($i) [$ns node]
    }
    $ns duplex-link $n(0) $n(1) 1Mb 10ms DropTail
    $ns duplex-link $n(0) $n(2) 1Mb 10ms DropTail
    $ns duplex-link $n(0) $n(3) 1Mb 10ms DropTail
    $ns duplex-link $n(0) $n(4) 1Mb 10ms DropTail
    $ns duplex-link $n(1) $n(5) 1Mb 10ms DropTail
    $ns duplex-link $n(1) $n(7) 1Mb 10ms DropTail
    $ns duplex-link $n(1) $n(9) 1Mb 10ms DropTail
    $ns duplex-link $n(1) $n(11) 1Mb 10ms DropTail
    $ns duplex-link $n(2) $n(5) 1Mb 10ms DropTail
    $ns duplex-link $n(2) $n(7) 1Mb 10ms DropTail
    $ns duplex-link $n(2) $n(9) 1Mb 10ms DropTail
    $ns duplex-link $n(2) $n(11) 1Mb 10ms DropTail
    $ns duplex-link $n(3) $n(6) 1Mb 10ms DropTail
    $ns duplex-link $n(3) $n(8) 1Mb 10ms DropTail
    $ns duplex-link $n(3) $n(10) 1Mb 10ms DropTail
    $ns duplex-link $n(3) $n(12) 1Mb 10ms DropTail
    $ns duplex-link $n(4) $n(6) 1Mb 10ms DropTail
    $ns duplex-link $n(4) $n(8) 1Mb 10ms DropTail
    $ns duplex-link $n(4) $n(10) 1Mb 10ms DropTail
    $ns duplex-link $n(4) $n(12) 1Mb 10ms DropTail
    $ns duplex-link $n(5) $n(13) 1Mb 10ms DropTail
    $ns duplex-link $n(5) $n(14) 1Mb 10ms DropTail
    $ns duplex-link $n(6) $n(13) 1Mb 10ms DropTail
    $ns duplex-link $n(6) $n(14) 1Mb 10ms DropTail
    $ns duplex-link $n(7) $n(15) 1Mb 10ms DropTail
    $ns duplex-link $n(7) $n(16) 1Mb 10ms DropTail
    $ns duplex-link $n(8) $n(15) 1Mb 10ms DropTail
    $ns duplex-link $n(8) $n(16) 1Mb 10ms DropTail
    $ns duplex-link $n(9) $n(17) 1Mb 10ms DropTail
    $ns duplex-link $n(9) $n(18) 1Mb 10ms DropTail
    $ns duplex-link $n(10) $n(17) 1Mb 10ms DropTail
    $ns duplex-link $n(10) $n(18) 1Mb 10ms DropTail
    $ns duplex-link $n(11) $n(19) 1Mb 10ms DropTail
    $ns duplex-link $n(11) $n(20) 1Mb 10ms DropTail
    $ns duplex-link $n(12) $n(19) 1Mb 10ms DropTail
    $ns duplex-link $n(12) $n(20) 1Mb 10ms DropTail
    # Provide initial location of mobilenodes
    $n(0) set X_ 0.0
    $n(0) set Y_ 0.0
    #Create a UDP Source Node
    set udp0 [new Agent/UDP]
    $udp0 set class_ 1
    $ns attach-agent $n(0) $udp0
    #Create a UDP1 Source Node
    set udp1 [new Agent/UDP]
    $udp1 set class_ 2
    $ns attach-agent $n(0) $udp1
    set cbr0 [new Application/Traffic/CBR]
    $cbr0 set packetSize_ 250
    $cbr0 set interval_ 0.010
    $cbr0 attach-agent $udp0
    set cbr1 [new Application/Traffic/CBR]
    $cbr1 set packetSize_ 250
    $cbr1 set interval_ 0.010
    $cbr1 attach-agent $udp1
    set null0 [new Agent/Null]
    $ns attach-agent $n(13) $null0
    set null1 [new Agent/Null]
    $ns attach-agent $n(20) $null1
    $ns connect $udp0 $null0
    $ns connect $udp1 $null1
    $ns at 0.0 "$cbr0 start"
    $ns at 0.0 "$cbr1 start"
    $ns at 5.0 "finish"
    #Run the simulation
    $ns run
