// Copyright (c) 2014-2015 by Wayne C. Gramlich.  All rights reserved.
// Some code came from the ros_arduino_bridge.

// The following tests are implemented by this code:
#define TEST_BUS_INPUT 1
#define TEST_BUS_OUTPUT 2
#define TEST_BUS_ECHO 3
#define TEST_BUS_COMMAND 4

// Set TEST to one of the possible tests:
#define TEST TEST_BUS_COMMAND

// Watch-out the code for SerialHardwared.cpp has been modified to
// notice this #define.  It causes the 8-ibt interrupt driver for
// UART1 to be disabled:
#define UART1_DISABLED

#include <Bus_Slave.h>
#include <Bus_Sonar10_Local.h>
#include <Sonar.h>

// This is the initial address of the module:
static UByte address = 40;

// The null object can be used for *debug_uart*:
NULL_UART null_uart;

// Debug *debug_uart* and *bus_uart* pointers:
#if defined(UDR1)
  UART *debug_uart = (UART *)&avr_uart0;
  UART *bus_uart = (UART *)&avr_uart1;
#else // defined(UDR1)
  UART *debug_uart = (UART *)&null_uart;
  UART *bus_uart = (UART *)&avr_uart0;
#endif // defined(UDR1)

// Create the sonar data structures:
Sonar sonar0(1, _BV(1), &PINC, (UByte)_BV(1), &PINB, (UByte)_BV(1) );
Sonar sonar1(1, _BV(1), &PINB, (UByte)_BV(5), &PINB, (UByte)_BV(1) );
Sonar sonar2(2, _BV(6), &PINC, (UByte)_BV(0), &PIND, (UByte)_BV(6) );
Sonar sonar3(2, _BV(5), &PINB, (UByte)_BV(4), &PIND, (UByte)_BV(5) );
Sonar sonar4(2, _BV(5), &PINB, (UByte)_BV(0), &PIND, (UByte)_BV(5) );
Sonar sonar5(1, _BV(3), &PINC, (UByte)_BV(3), &PINB, (UByte)_BV(3) );
Sonar sonar6(1, _BV(3), &PINC, (UByte)_BV(2), &PINB, (UByte)_BV(3) );
Sonar sonar7(1, _BV(2), &PIND, (UByte)_BV(7), &PINB, (UByte)_BV(2) );
Sonar sonar8(2, _BV(3), &PIND, (UByte)_BV(4), &PIND, (UByte)_BV(3) );
Sonar sonar9(2, _BV(3), &PIND, (UByte)_BV(2), &PIND, (UByte)_BV(3) );

Sonar *sonars[] = {
  &sonar0,
  &sonar1,
  &sonar2,
  &sonar3,
  &sonar4,
  &sonar5,
  &sonar6,
  &sonar7,
  &sonar8,
  &sonar9,
  (Sonar *)0,
};

Sonar_Controller sonar_controller((UART *)debug_uart, sonars);

// Define the pin names alphabetically:
static const UByte bus_standby_pin = A5;
static const UByte led_pin = 13;

Bus_Slave bus_slave(bus_uart, debug_uart);
Bus_Sonar10 bus_sonar10(address);

// Do the two ISR's for the Sonar here:

ISR(PCINT0_vect) {
  Sonar_Controller::interrupt_handler(1);
}

ISR(PCINT2_vect) {
  Sonar_Controller::interrupt_handler(2);
}

UByte command_process(Bus_Slave *bus_slave, 
 UByte command, Logical execute_mode) {
  return bus_sonar10.command_process(bus_slave,
   command, execute_mode);
}

void loop() {
  switch (TEST) {
    case TEST_BUS_COMMAND: {
      // Encoder positions and state:

      // Deal with any *bus* related activities:
      bus_slave.slave_mode(address, command_process);
      sonar_controller.poll();

      break;
    }
    case TEST_BUS_ECHO: {
      // Wait for a *frame* to show up on *bus*:
      UShort frame = bus_slave.frame_get();

      // Set the *LED* to the least significant bit of *frame*:
      if ((frame & 1) == 0) {
        digitalWrite(led_pin, LOW);
      } else {
        digitalWrite(led_pin, HIGH);
      }

      // Print *frame* out to *debug_uart*:
      debug_uart->frame_put(frame & 0x7f);

      // Send out a CRLF when we get a '_':
      if (frame == (UShort)'_') {
        debug_uart->string_print((Character *)"\r\n");
      }

      // Now send *frame* back to the *bus*:
      bus_slave.frame_put(frame);

      // Get the *echo_frame* and check for a mismatch;
      UShort echo_frame = bus_slave.frame_get();
      if (frame != echo_frame) {
        debug_uart->string_print((Character *)"!");
      }

      break;
    }
    case TEST_BUS_OUTPUT: {
      // This test will just output characters to the debugging port
      // with no interraction with the bus:

      // Start with with *character* being static:
      static Character character = '@';

      // Just in case, make sure *character* is between '@' and '_':
      if (character < '@' || character > '_') {
	character = '@';
      }

      // Output *character* to the *debug_uart*:
      //debug_uart->frame_put((UShort)character);
      UDR0 = character;

      // Output any needed CRLF, and increment *character*:
      if (character == '_') {
	debug_uart->string_print((Character *)"\r\n");
	character = '@';
      } else {
	character += 1;
      }

      if ((character & 1) == 0) {
	digitalWrite(led_pin, LOW);
      } else {
	digitalWrite(led_pin, HIGH);
      }

      // Slow things down a little:
      delay(100);

      break;
    }
    case TEST_BUS_INPUT: {
      // This test will input *frame*'s from the *bus* and echo them
      // to *debug_uart*:

      // Get a *frame* from the bus:
      UShort frame = bus_slave.frame_get();

      // Print it out for debugging:
      debug_uart->frame_put(frame & 0x7f);

      // Tack on a CRLF when we get an '_':    
      if (frame == (UShort)'_') {
	debug_uart->string_print((Character *)"\r\n");
      }

      // Light the *LED* using the least significant bit of *frame*:
      if ((frame & 1) == 0) {
	digitalWrite(led_pin, LOW);
      } else {
	digitalWrite(led_pin, HIGH);
      }
      break;
    }
  }
}

void setup() {
  // The standard frequency for an AVR Arduino is 16MHz:
  static const UInteger frequency = (UInteger)16000000L;

  // Initalize the *debug_uart*:
  debug_uart->begin(frequency, 115200L, (Character *)"8N1");

  // Turn *LED* on:
  pinMode(led_pin, OUTPUT);
  digitalWrite(led_pin, HIGH);

  // Get *bus_uart* talking to the bus:
  bus_uart->begin(frequency, 500000L, (Character *)"9N1");

  // Force the standby pin on the CAN transeciever to low to force it
  // into active mode:
  pinMode(bus_standby_pin, OUTPUT);
  digitalWrite(bus_standby_pin, LOW);

  // Set up the sonar controller software module:
  sonar_controller.initialize();

  // Enable change interupts for PICINT1...8 and PCINT17...24:
  //PCMSK0 = 0;
  //PCMSK2 = 0;
  //PCIR = _BV(2) | _BV(0);

  // Enable/disable interrupts based on *TEST*:
  switch (TEST) {
    case TEST_BUS_OUTPUT:
      debug_uart = &avr_uart0;
      debug_uart->begin(frequency, 115200L, (Text)"8N1");
      debug_uart->string_print((Character *)"\r\nbbes_output:\r\n");
      debug_uart->interrupt_set((Logical)0);
      bus_uart->interrupt_set((Logical)0);
      break;
    case TEST_BUS_INPUT:
      debug_uart->string_print((Character *)"\r\nbbes_input:\r\n");
      debug_uart->interrupt_set((Logical)1);
      bus_uart->interrupt_set((Logical)1);
      break;
    case TEST_BUS_ECHO:
      debug_uart->string_print((Character *)"\r\nbbes_echo:\r\n");
      debug_uart->interrupt_set((Logical)0);
      bus_uart->interrupt_set((Logical)0);
      break;
    case TEST_BUS_COMMAND:
      debug_uart->string_print((Character *)"\r\nbbes_command:\r\n");
      debug_uart->interrupt_set((Logical)1);
      bus_uart->interrupt_set((Logical)1);
      break;
  }
}

