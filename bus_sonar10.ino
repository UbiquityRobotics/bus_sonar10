// Copyright (c) 2014-2015 by Wayne C. Gramlich.  All rights reserved.

#include <Bus_Slave.h>
#include "Bus_Sonar10_Local.h"

// The null object can be used for *debug_uart*:
NULL_UART null_uart;

UART *debug_uart = (UART *)&null_uart;
UART *bus_uart = (UART *)&avr_uart0;

Bus_Slave bus_slave(bus_uart, debug_uart);
Bus_Sonar10 bus_sonar10(40);

UByte command_process(Bus_Slave *bus_slave, 
 UByte command, Logical execute_mode) {
  return bus_sonar10.command_process(bus_slave, command, execute_mode);
}

void setup() {
}

void loop() {
  bus_sonar10.slave_mode(40, command_process);
}

