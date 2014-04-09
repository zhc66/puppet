notify {"####################################":}
notify {"OS info":
	message => "OS = $operatingsystem" ,
	before => Notify ["CPU info"]
	}

notify {"CPU info":
	message => "CPU = $processorcount x $processor0",
	before => Notify ["Memory info"],
	}

notify {"Memory info":
	message => "Memory = $memorysize ", 
	}
