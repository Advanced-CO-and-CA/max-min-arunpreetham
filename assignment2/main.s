


/******************************************************************************
* File: main.s
* Author: Arunpreetham (cs18m528)
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  Assignment 2:
  Problem: Maximum and Minimum in Given Set of Numbers 
  Results:
    R7 to store the total number of elements in the array
    R8 to store the maximum number
    R9 to store the minimum number
  */

  @ BSS section
      .bss

  @ DATA SECTION
      .data
data_items: .word 10, 4, 28, 100, 8, 0 
    @ 0 is used to terminate the data

  @ TEXT section
      .text

.globl _main


_main:



    LDR r3, =data_items @ Get the address of the input array
    @R7 is used to store the number of elememts in the array
    MOV r7, #0 
    
    MOV r4, #0 @zero variable
    
    @ In the loop, R1 will store the maximum value and 
    @              R2 will store the minimum value
    @Initialize R1 and R2 with the first array entry
    LDR r1, [r3]
    LDR r2, [r3]

    loop: @loop label

    @r5 is a temp variable to store the current array element
    LDR r5, [r3] @obtain the value from the address location

    @check and terminate if the current element is 0, end of array
    CMP r4, r5
        BEQ end

    ADD r7, #1

    @ if r5 > r1, then there is a greater element than R1, so branch and update r1 to r5
    CMP r5, r1
        BGT update_r1

    @if the element is not greater, then check for lesser value.
    @branch to next if condition
    B _next

        @Label to update R1 to the current element as it is greater
        update_r1:
            MOV r1, r5

    @block to check for the minimum value
    _next:
    CMP r2, r5

    @if r2 > r5, there there is an element less than R2 
    @so branch to update r2, else check for the next variable
    BGT update_r2

    @Branch to next loop 
    B next

    @update minimum number to R2
    update_r2:
    MOV r2, r5

    @iterate over the array to the next element
    next:
    ADD r3, #4
    B loop

    @end of the loop after reaching 0 in the array
    end:
    MOV R8, r1
    MOV R9, r2
