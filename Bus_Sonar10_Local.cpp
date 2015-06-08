// Generated file: only edit in designated areas!
#include <Bus_Sonar10_Local.h>
#include <Bus_Slave.h>

// Put top level includes, typedef's here:
  //////// Edit begins here: TOP_LEVEL
  #include <Sonar.h>
  extern Sonar_Controller sonar_controller;
  //////// Edit ends here: TOP_LEVEL

// Constructor
Bus_Sonar10::Bus_Sonar10(UByte address) {
  //////// Edit begins here: CONSTRUCTOR
  led_set(1);
  for (UByte sonar = 0; sonar < sonars_count_; sonar++) {
    distances_[sonar] = sonar * 100 + 1;
  }
  select_ = 0;
  //////// Edit ends here: CONSTRUCTOR
}

// led_get: LED to control
Logical Bus_Sonar10::led_get() {
  Logical result = 0;
  //////// Edit begins here: LED_GET
  result = led_;
  //////// Edit ends here: LED_GET
  return result;
}

// led_set: LED to control
void Bus_Sonar10::led_set(Logical led) {
  //////// Edit begins here: LED_SET
  led = led_;
  digitalWrite(13, led);
  //////// Edit ends here: LED_SET
}

// select_get: Select
UByte Bus_Sonar10::select_get() {
  UByte result = 0;
  //////// Edit begins here: SELECT_GET
  result = select_;
  //////// Edit ends here: SELECT_GET
  return result;
}

// select_set: Select
void Bus_Sonar10::select_set(UByte select) {
  //////// Edit begins here: SELECT_SET
  if (select >= sonars_count_) {
    select = sonars_count_ - 1;
  }
  select_ = select;
  //////// Edit ends here: SELECT_SET
}

// distance_get: Distance
UShort Bus_Sonar10::distance_get() {
  UShort result = 0;
  //////// Edit begins here: DISTANCE_GET
  result = (UShort)(
   sonar_controller.getLastDistInMm(select_)/(float)(10.0) + (float)(0.5));
  //result = select_ * 100;
  //////// Edit ends here: DISTANCE_GET
  return result;
}

// distance_set: Distance
void Bus_Sonar10::distance_set(UShort distance) {
  //////// Edit begins here: DISTANCE_SET
  //////// Edit ends here: DISTANCE_SET
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
    case 8: {
      // select_get: Select
      if (execute_mode) {
        UByte select = select_get();
        bus_slave->ubyte_put(select);
      }
      break;
    }
    case 9: {
      // select_set: Select
      UByte select = bus_slave->ubyte_get();
      if (execute_mode) {
        select_set(select);
      }
      break;
    }
    case 10: {
      // distance_get: Distance
      if (execute_mode) {
        UShort distance = distance_get();
        bus_slave->ushort_put(distance);
      }
      break;
    }
    case 11: {
      // distance_set: Distance
      UShort distance = bus_slave->ushort_get();
      if (execute_mode) {
        distance_set(distance);
      }
      break;
    }
  }
  return 0;
}

