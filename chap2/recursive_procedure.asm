# int fact(int n)
# {
# if (n < 1) return 1;
#   else return (n * fact(n - 1))
# }

# procedure for calc factorial
fact:
    addi	$sp, $sp, -8	# make a room for two vars
    # push two items
    sw      $ra, 4($sp)     # store returned addr
    sw		$a0, 0($sp)		# store the argument n

    slti	$t0,$a0, 1		# test for n < 1
    beg     $t0, $zero, L1  # NO: if n >= 1, jump to L1
    addi    $v0, $zero, $1  # YES: reutrn 1
    addi    $sp, $sp, 8     # adjust stack point to origin
    jr      $ra             # go back to caller(PC + 4)

    # else(L1) condition operation
    L1: addi    $a0, $a0, -1   # if n >=1, then n = n - 1
        jal     fact # recursive call
        lw      $a0, 0($sp)
        lw      $ra, 4($sp)
        addi    $sp, $sp, 8    # pop two items off stack
        mul     $v0, $a0, $v0   # return (n * fact(n - 1))
        jr      $ra              # go back to caller(PC + 4)



