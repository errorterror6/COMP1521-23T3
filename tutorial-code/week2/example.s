li 	$v0, 12

syscall			# scans in a character into $v0

move 	$t0, $v0
# character scanned in will me moved from $v0 to %t0