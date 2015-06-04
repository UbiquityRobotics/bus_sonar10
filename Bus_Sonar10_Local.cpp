// Generated file: only edit in designated areas!
#include <Bus_Sonar10_Local.h>
#include <Bus_Slave.h>

// Put top level includes, typedef's here:
  //////// Edit begins here: TOP_LEVEL
  //////// Edit ends here: TOP_LEVEL

// Constructor
Bus_Sonar10::Bus_Sonar10(UByte address) {
  //////// Edit begins here: CONSTRUCTOR
  led_set(1);
  encoder1_set(12345678);
  encoder2_set(87654321);
  //////// Edit ends here: CONSTRUCTOR
}

// led_get: LED to control
Logical Bus_Sonar10::led_get() {
  Logical result = 0;
  //////// Edit begins here: LED_GET
  result = _led;
  //////// Edit ends here: LED_GET
  return result;
}

// led_set: LED to control
void Bus_Sonar10::led_set(Logical led) {
  //////// Edit begins here: LED_SET
  _led = led;
  digitalWrite(13, led);
  //////// Edit ends here: LED_SET
}

// encoder1_get: Encoder 1
Integer Bus_Sonar10::encoder1_get() {
  Integer result = 0;
  //////// Edit begins here: ENCODER1_GET
  result = _encoder1;
  //////// Edit ends here: ENCODER1_GET
  return result;
}

// encoder1_set: Encoder 1
void Bus_Sonar10::encoder1_set(Integer encoder1) {
  //////// Edit begins here: ENCODER1_SET
  _encoder1 = encoder1;
  //////// Edit ends here: ENCODER1_SET
}

// encoder2_get: Encoder 2
Integer Bus_Sonar10::encoder2_get() {
  Integer result = 0;
  //////// Edit begins here: ENCODER2_GET
  result = _encoder2;
  //////// Edit ends here: ENCODER2_GET
  return result;
}

// encoder2_set: Encoder 2
void Bus_Sonar10::encoder2_set(Integer encoder2) {
  //////// Edit begins here: ENCODER2_SET
  _encoder2 = encoder2;
  //////// Edit ends here: ENCODER2_SET
}

// encoders_reset: Reset both encoders to zero.
void Bus_Sonar10::encoders_reset() {
  //////// Edit begins here: ENCODERS_RESET
  _encoder1 = 0;
  _encoder2 = 0;
  //////// Edit ends here: ENCODERS_RESET
}

// command_process: Command process
UByte Bus_Sonar10::command_process(Bus_Slave *bus_slave, UByte command, Logical execute_mode) {
  switch (command) {
    case 0: {
      // led_get: LED to control
      if (execute_mode) {
        Logical led = led_get();
        bus_slave->logical_put(led);
      }
      break;
    }
    case 1: {
      // led_set: LED to control
      Logical led = bus_slave->logical_get();
      if (execute_mode) {
        led_set(led);
      }
      break;
    }
    case 2: {
      // encoder1_get: Encoder 1
      if (execute_mode) {
        Integer encoder1 = encoder1_get();
        bus_slave->integer_put(encoder1);
      }
      break;
    }
    case 3: {
      // encoder1_set: Encoder 1
      Integer encoder1 = bus_slave->integer_get();
      if (execute_mode) {
        encoder1_set(encoder1);
      }
      break;
    }
    case 4: {
      // encoder2_get: Encoder 2
      if (execute_mode) {
        Integer encoder2 = encoder2_get();
        bus_slave->integer_put(encoder2);
      }
      break;
    }
    case 5: {
      // encoder2_set: Encoder 2
      Integer encoder2 = bus_slave->integer_get();
      if (execute_mode) {
        encoder2_set(encoder2);
      }
      break;
    }
    case 6: {
      // encoders_reset: Reset both encoders to zero.
      if (execute_mode) {
        encoders_reset();
      }
      break;
    }
  }
  return 0;
}

