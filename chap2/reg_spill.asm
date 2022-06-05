# $s0 = y

main:

    addi $t0, $0, 1 # a = 1
    addi $t1, $0, 2 # b = 2

    # arguments to be passed(2, 3, 4, 5)
    addi $a0, $0, 2 # f
    addi $a1, $0, 3 # g
    addi $a2, $0, 4 # h
    addi $a3, $0, 5 # i

    # jump to the procedure
    jal diffofsums # PC

    # PC + 4
    add $s0, $v0, $0 # y = diffofsums(2, 3, 4, 5)
    add $s1, $t0, $t1 # c  = a + b

# $s0 = result
diffofsums:
    # Push(backup) the registers to be used in the callee to the stack
    addi $sp, $sp, -12 # make space on stack to store 3 reg
    sw $s0, 8($sp) # save $s0 on stack
    sw $t0, 4($sp) # save $t0 on stack
    sw $t1, 0($sp) # save $t1 on stack


    add $t0, $a0, $a1 # $t0 = f + g
    add $t1, $a2, $a3 # $t1 = h + 1
    sub $s0, $t0, $t1 # $s0 = $t0 - $t1
    add $v0, $s0, $0 # cpoy result from $s0 to $v0 to be passed

    # "Pop(restore) the registers from the stack prior to returning to the caller
    lw $t1, 0($sp)
    lw $t0, 4($sp)
    lw $s0, 8($sp)
    addi $sp, $sp, 12 # deallocate(restore) stack space
    jr $ra # return to caller's addr(PC+4)

