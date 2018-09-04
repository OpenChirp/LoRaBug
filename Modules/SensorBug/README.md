# SensorBug

An environmental sensor board with a Grid-EYE IR sensor array

The board has the following sensor:

1. Panasonic Grid-EYE AMG8833
2. Passive Infrared (Motion) Sensor - Panasonic EKMB1201112
3. Ambient Light Sensor - Panasonic PNJ4K01F
4. Accelerometer/Absolute Orientation Sensor - Bosch BMX160
5. Environmental Sensor - Bosch BME680
6. MEMS Microphone - Knowles SPU0410LR5H

The board also holds a Macronix MX25R8035FZUIL0 SPI 8Mb NOR Flash chip.

# Header Pins Usage

| Near Power Pads             | Near MCU        |
| --------------------------- | --------------- |
| 3V3                         | GND             |
| 3V3                         | GND             |
| -                           | -               |
| -                           | -               |
| -                           | I2C SDA         |
| Pwr Domain1 EN (Flash nCS)  | I2C SCL         |
| Light Analog                | Flash MOSI      |
| Mic Analog                  | Flash CLK       |
| BMX INT 1                   | Flash MISO      |
| PIR Digital                 | Pwr Domain2 nEN |

# Power Domains

## Alway On
* PIR                           - 1uA
* Accelerometer (BMX160)        - 5uA in suspend
* Environmental Sensor (BME680) - 0.15uA in suspend

## Domain 1
Domain 1 is controlled by a 1.8V linear regulator. The Domain 1 enable signal toggles the regulator's active high enable pin.

* Ambient Light Sensor
* Microphone

## Domain 2
Domain 2 is controlled by a p-channel mosfet, thus the enable signal is active low.

* GridEye
* SPI Flash

# Protocols

| Sensor       | Protocol    |
| ------------ |------------ |
| Flash        | SPI         |
| BMX160       | I2C, INT    |
| BME680       | I2C         |
| Light        | Analog      |
| Mic          | Analog      |
| PIR          | Digital     |
| GridEye      | I2C         |