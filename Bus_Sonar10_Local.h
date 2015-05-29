// Generated file: only edit in designated area!

#ifndef BUS_SONAR10_LOCAL_H
#define BUS_SONAR10_LOCAL_H

#include <Bus_Slave.h>

  //////// Edit begins here: TOP_LEVEL
  static const UByte SONARS_COUNT = 10;
  //////// Edit ends here: TOP_LEVEL

class Bus_Sonar10 : public Bus_Module {
  public:
    // Constructor
    Bus_Sonar10(UByte address);

    // Command Process
    UByte command_process(Bus_Slave *bus_slave, UByte command, Logical execute_mode);
    // LED to control
    Logical led_get();
    void led_set(Logical led);

    // Selection Index
    UByte select_get();
    void select_set(UByte select);

    // Sonar Value
    UShort sonar_get();
    void sonar_set(UShort sonar);

  //////// Edit begins here: PRIVATE
  private:
    UByte select_;
    UShort values_[SONARS_COUNT];
  //////// Edit ends here: PRIVATE
};

#endif // BUS_SONAR10_LOCAL_H
