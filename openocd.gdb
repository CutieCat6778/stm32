target extended-remote :3333

# print demangled symbols
set print asm-demangle on

# detect unhandled exceptions, hard faults and panics
break DefaultHandler
break HardFault
break rust_begin_unwind

monitor arm semihosting enable

load

set print asm-demangle on

set print pretty on

set style sources off

break main

break DefaultHandler

break HardFault

continue

step