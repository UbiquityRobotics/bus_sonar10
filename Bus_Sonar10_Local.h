// Generated file: only edit in designated area!

#ifndef BUS_SONAR10_LOCAL_H
#define BUS_SONAR10_LOCAL_H

#include <Bus_Slave.h>

  //////// Edit begins here: TOP_LEVEL
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

    // Select
    UByte select_get();
    void select_set(UByte select);

    // Distance
    UShort distance_get();
    void distance_set(UShort distance);

  //////// Edit begins here: PRIVATE
  private:
    // Pin definitions:
    static const UByte sonars_count_ = 10;
    static const UByte bus_standby_pin_ = A4;
    static const UByte led_pin_ = 13;
    UShort distances_[sonars_count_];
    Logical led_;
    Integer encoder1_;
    Integer encoder2_;
    UByte select_;
  //////// Edit ends here: PRIVATE
};

#endif // BUS_SONAR10_LOCAL_H
