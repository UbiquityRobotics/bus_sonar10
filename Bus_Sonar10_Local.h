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

    // Motor 1
    Byte motor1_get();
    void motor1_set(Byte motor1);

    // Motor 2
    Byte motor2_get();
    void motor2_set(Byte motor2);

    // Toggle motor1 direction.
    Logical motor1_reverse_get();
    void motor1_reverse_set(Logical motor1_reverse);

    // Toggle motor2 direction.
    Logical motor2_reverse_get();
    void motor2_reverse_set(Logical motor2_reverse);

    // Toggle encoder1 direction.
    Logical encoder1_reverse_get();
    void encoder1_reverse_set(Logical encoder1_reverse);

    // Toggle encoder2 direction.
    Logical encoder2_reverse_get();
    void encoder2_reverse_set(Logical encoder2_reverse);

    // Swap motor/encoders.
    Logical motors_encoders_swap_get();
    void motors_encoders_swap_set(Logical motors_encoders_swap);

    // Kp proportional constant numerator for PID algorithm.
    Short pid_proportional_get();
    void pid_proportional_set(Short pid_proportional);

    // Ki integral constant numerator for PID algorithm.
    Short pid_integral_get();
    void pid_integral_set(Short pid_integral);

    // Kd derivative constant numerator for PID algorithm.
    Short pid_derivative_get();
    void pid_derivative_set(Short pid_derivative);

    // Common deonominator for the PID constants.
    Short pid_denominator_get();
    void pid_denominator_set(Short pid_denominator);

    // Register to enable/disable PID algorithm.
    Logical pid_active_get();
    void pid_active_set(Logical pid_active);

    // Reset both encoders to zero.
    void encoders_reset();

    // Cause both encoder values to be latched.
    void encoders_latch();

  //////// Edit begins here: PRIVATE
  //private:
    // Pin definitions:
    static const UByte _bus_standby_pin = A4;
    static const UByte _direction_1a_pin = 7;
    static const UByte _direction_enable_12_pin = 10;
    static const UByte _direction_2a_pin = 12;
    static const UByte _direction_3a_pin = 11;
    static const UByte _direction_enable_34_pin = 9;
    static const UByte _direction_4a_pin = 8;
    static const UByte _encoder1_phase_a_pin = A0;
    static const UByte _encoder1_phase_b_pin = A1;
    static const UByte _encoder2_phase_a_pin = A2;
    static const UByte _encoder2_phase_b_pin = A3;
    static const UByte _encoders_enable_pin = 6;
    static const UByte _led_pin = 13;
    Logical _led;
    Integer _encoder1;
    Integer _encoder2;
    Logical _encoder1_reverse;
    Logical _encoder2_reverse;
    Integer _encoder2_latched;
    Byte _motor1;
    Byte _motor2;
    Logical _motor1_reverse;
    Logical _motor2_reverse;
    Logical _motors_encoders_swap;
    Short _pid_proportional;
    Short _pid_integral;
    Short _pid_derivative;
    Short _pid_denominator;
    Logical _pid_active;
  //////// Edit ends here: PRIVATE
};

#endif // BUS_SONAR10_LOCAL_H
