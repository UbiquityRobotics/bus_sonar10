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

    // Encoder 1
    Integer encoder1_get();
    void encoder1_set(Integer encoder1);

    // Encoder 2
    Integer encoder2_get();
    void encoder2_set(Integer encoder2);

    // Reset both encoders to zero.
    void encoders_reset();

  //////// Edit begins here: PRIVATE
  //private:
    // Pin definitions:
    static const UByte _bus_standby_pin = A4;
    static const UByte _led_pin = 13;
    Logical _led;
    Integer _encoder1;
    Integer _encoder2;
  //////// Edit ends here: PRIVATE
};

#endif // BUS_SONAR10_LOCAL_H
