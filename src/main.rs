#![deny(unsafe_code)]
#![no_main]
#![no_std]

#[allow(unused_imports)]
use stm32::{entry, hprintln};

#[entry]
fn main() -> ! {
    let (gpioe, rcc) = stm32::init();

    // enable the GPIOE peripheral
    rcc.ahbenr.write(|w| w.iopeen().set_bit());

    // configure the pins as outputs
    gpioe.moder.write(|w| w.moder4().output());

    // Turn on all the LEDs in the compass
    gpioe.odr.write(|w| w.odr4().set_bit());

    stm32::bkpt();

    loop {
    }
}