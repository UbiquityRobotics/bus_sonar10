// Generated file: only edit in designated areas!
#include <Bus_Sonar10_Local.h>
#include <Bus_Slave.h>

// Put top level includes, typedef's here:
  //////// Edit begins here: TOP_LEVEL
  //////// Edit ends here: TOP_LEVEL

// Constructor
Bus_Sonar10::Bus_Sonar10(UByte address) {
  //////// Edit begins here: CONSTRUCTOR
  for (UByte index = 0; index < SONARS_COUNT; index++) {
    values_[index] = index << 8;
  }
  //////// Edit ends here: CONSTRUCTOR
}

// led_get: LED to control
Logical Bus_Sonar10::led_get() {
  Logical result = 0;
  //////// Edit begins here: LED_GET
  //////// Edit ends here: LED_GET
  return result;
}

// led_set: LED to control
void Bus_Sonar10::led_set(Logical led) {
  //////// Edit begins here: LED_SET
  //////// Edit ends here: LED_SET
}

// select_get: Selection Index
UByte Bus_Sonar10::select_get() {
  UByte result = 0;
  //////// Edit begins here: SELECT_GET
  result = select_;
  //////// Edit ends here: SELECT_GET
  return result;
}

// select_set: Selection Index
void Bus_Sonar10::select_set(UByte select) {
  //////// Edit begins here: SELECT_SET
  select_ = (select < SONARS_COUNT) ? select : SONARS_COUNT;
  //////// Edit ends here: SELECT_SET
}

// sonar_get: Sonar Value
UShort Bus_Sonar10::sonar_get() {
  UShort result = 0;
  //////// Edit begins here: SONAR_GET
  result = values_[select_];
  //////// Edit ends here: SONAR_GET
  return result;
}

// sonar_set: Sonar Value
void Bus_Sonar10::sonar_set(UShort sonar) {
  //////// Edit begins here: SONAR_SET
  // Note: The value will be overwritten with the next value recorded.
  values_[select_] = sonar;
  //////// Edit ends here: SONAR_SET
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
      // select_get: Selection Index
      if (execute_mode) {
        UByte select = select_get();
        bus_slave->ubyte_put(select);
      }
      break;
    }
    case 3: {
      // select_set: Selection Index
      UByte select = bus_slave->ubyte_get();
      if (execute_mode) {
        select_set(select);
      }
      break;
    }
    case 4: {
      // sonar_get: Sonar Value
      if (execute_mode) {
        UShort sonar = sonar_get();
        bus_slave->ushort_put(sonar);
      }
      break;
    }
    case 5: {
      // sonar_set: Sonar Value
      UShort sonar = bus_slave->ushort_get();
      if (execute_mode) {
        sonar_set(sonar);
      }
      break;
    }
  }
  return 0;
}

