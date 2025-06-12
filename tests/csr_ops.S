.section .text
.global _start

_start:
    # Read mcycle CSR into t0
    csrr t0, mcycle

    # Store it in memory
    la t1, result
    sd t0, 0(t1)

    # Write 1 to tohost to tell Spike we passed
    li t2, 1
    la t3, tohost
    sd t2, 0(t3)

    # Infinite loop to prevent further execution
1:  j 1b

.section .data
.align 8
tohost:     .dword 0
fromhost:   .dword 0
result:     .dword 0
