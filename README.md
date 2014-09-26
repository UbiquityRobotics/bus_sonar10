# bus_sonar10

The Sonar10 board is used to drive up to 10 HC-SR04
sonar modules.

Currently, everything is located in the `rev_a` directory.

## Revision A

The revision A schematic is available as either
`bus_sonar10.pdf` or as `bus_sonar10.svg`.

### Logic Side

Logic ground comes in on N1 (pins 3 and 4).  Logic
power comes in on N1 (pins 1 and 2.)  The logic power
is routed to C1, U2 (a LM2940-5.0), C4, C5, and R1.
The C4/R1 series combination is used to bring the
ESR of C5 to less than 1 ohm as required by the
LM2940 spec. sheet.  Capacitors C6, C7, C8, C9, and
C11 provide filter capacitors for the various IC's.

The MCP2562 CAN bus transceiver (U3) is connected to
CANH (N1 pin 5) and CANL (N1 pin 6).  In addition,
R6 and J1 can be used to enable a 120 ohm CAN bus
termination resistor.  VIO (U3 pin 5) is connected
to 5V since all digital signals on this board are
running at 5V.

The AND gate at U1A is used to or the signals from
the MCP2562 TXD (U3 pin 1) with the TXD signal on
the 3.3V FTDI USB serial cable (N2 pin 4).  R4 is
a 100K ohm pull resistor that pulls serial cable
high if no serial cable is plugged in.  (There should
be a similar 100K pull-up resistor on the MCP2662
to pull it high if the MCP2562 CAN bus transceiver
is not plugged in.  It was accidently left out.)
The output of the 74HCT08 and gate is directed to
RXD (U4 pin 2) of the ATmega328P.  The 74HCT08 is
used to level shift from 3.3V on the serial cable
up to 5V output on U1A.  (Note: in Rev. A the TXD
and RXD pins on U3 are accidentally swapped.)  Lastly,
the TXD output from the processor is sent to the R2/R3
voltage divider that takes the 0-5V signal down to 0-3V.

One other comment about the serial cable.  If a 5V FTDI
serial cable gets plugged into N2, nothing bad happens
because U1 has 5V tolerant inputs.

The reset signal is derived from RTS on the serial cable
(N2 pin 6.)  Normally, RTS on the serial cable idles
at 3.3V high, which is buffered through AND gate U1B
to 5V.  The othe end of C10 is pulled up to 5V through
10K resistor (R7).  Since both ends of C10 are at 5V,
C10 is discharged and has 0V across it.  When RTS goes
low, the output of U1B goes low.  This immediately pulls
the #RESET line low and that resets the processor on
its #RESET line (U4 pin 1).  Now R7 has 5V across it
and it starts to charge C10 up to 5V.  When downloading
is done, The serial cable signal RTS goes back high again.
This the causes the U1B AND output to go high (5V).
This causes the other end of C10 to attempt to pull the
#RESET line up to 10V (since C10 has 5V across it.)
Luckily the Schottky diode D1 to clamp the voltage
on the #RESET line to 5.2V and rapidly discharge C10
again.  Laslty, the button SW1 can be used to trigger
a reset as well.

The ATmega328 has a total of 6 timer/counters on pins
5 (OC2B), 11 (OC0B), 12 (OC0A), 15 (OC1A), 16 (OC1B),
and 17 (OC2A).  Order to support 10 sonars, pairs
of echo return signals from the HC-SR04 modules are
combined using the 74HCT32 quad OR gate U5.  By using
these 4 OR gates, 8 sonars echo return signals are
directed to 4 of the counter/timer input pins.  The
remaining. 

All the connections are summerized in the table below:
<BlockQuote>
  <Table Border="1">
    <TR>
      <TH Span="2">Trigger</TH>
      <TH Span="3">Echo</TH>
    </TR><TR>
      <TH>Sonar</TH>
      <TH>Pin</TH>
      <TH>Arduino</TH>
      <TH>Pin</TH>
      <TH>Arduino</TH>
      <TH>Counter</TH>
    </TR><TR>
      <TD>0</TD>
      <TD>24</TD>
      <TD>A1</TD>
      <TD ColSpan="2">15</TD>
      <TD ColSpan="2">D9</TD>
      <TD ColSpan="2>>OC1A</TD>
    </TR><TR>
      <TD>1</TD>
      <TD>19</TD>
      <TD>D13</TD>
    </TR><TR>
      <TD>2</TD>
      <TD>23</TD>
      <TD>A0</TD>
      <TD>12</TD>
      <TD>D6</TD>
      <TD>OC0A</TD>
    </TR><TR>
      <TD>3</TD>
      <TD>18</TD>
      <TD>D12</TD>
      <TD ColSpan="2">11</TD>
      <TD ColSpan="2">D5</TD>
      <TD ColSpan="2>>OC0B</TD>
    </TR><TR>
      <TD>4</TD>
      <TD>14</TD>
      <TD>D8</TD>
    </TR><TR>
      <TD>5</TD>
      <TD>26</TD>
      <TD>A3</TD>
      <TD ColSpan="2">17</TD>
      <TD ColSpan="2">D11</TD>
      <TD ColSpan="2">OC2A</TD>
    </TR><TR>
      <TD>6</TD>
      <TD>25</TD>
      <TD>A2</TD>
    </TR><TR>
      <TD>7</TD>
      <TD>13</TD>
      <TD>D7</TD>
      <TD>16</TD>
      <TD>D10</TD>
      <TD>OC1B</TD>
    </TR><TR>
      <TD>8</TD>
      <TD>6</TD>
      <TD>D4</TD>
      <TD ColSpan="2">5</TD>
      <TD ColSpan="2">D3</TD>
      <TD ColSpan="2">OC2B</TD>
    </TR><TR>
      <TD>9</TD>
      <TD>4</TD>
      <TD>D2</TD>
    </TR>
  </Table>
</BlockQuote>

### Issues

* The TXD and RXD pins on the MCP2562 (U3 pins 1 and 4) are
  swapped.

* It would be nice to have an LED that can be blinked.

* Tie unused inputs of U1 to one rail or the other.

* Put a 100K pull up on MCP2562 (U3) TXD (pin 1).

* Think about finding an extra pin for STBY on the MXP2652
  rather than just grounding it.

* Think about adding a firmware update lockout pin.

## Software

The software is developed using the arduino-mk package.
You may have to edit the Makefile if you are not using
a standard Ubuntu configuration and/or an 3.3V FTDI USB
to serial cable.

The software is in `bus_sonar10.ino`.

To build the code:

        make

To upload the code:

        make upload

