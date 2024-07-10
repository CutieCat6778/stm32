target extended-remote :3333

# print demangled symbols
set print asm-demangle on

# detect unhandled exceptions, hard faults and panics
break DefaultHandler
break HardFault
break rust_begin_unwind

monitor arm semihosting enable

load

# Set a breakpoint at main, aka entry
break main

# Set a breakpiont at DefaultHandler
break DefaultHandler

# Set a breakpiont at HardFault
break HardFault

# Continue running and until we hit the main breakpoint
continue

# Step from the trampoline code in entry into main
step
