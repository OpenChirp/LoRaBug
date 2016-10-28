![LoRaBugBoard V2 3D Picture](Info/LoRaBugBoardV2_3D.jpg)

# Specs
* TI CC2650 MCU with BLE and 802.15.4 support
* SX1276 LoRa radio
* Provide 500mA 3.3V (3.3-3.4V) from USB.

# Info
* The power supported by the USB is limited by the 500mA limit of diode D3 and the 600mA limit of the voltage regulator U9.
* When using USB power, the 3.3V rail may swing to 3.4V. This is due to the linear regulator's ground pin voltage being raised by the inline mosfet Q4.
* The SX1276 is said to be only able to support PA_BOOST +20dBm TX when the input voltage is greater than 2.4V. See section 5.4.3 in the [SX1276 datasheet][sx1276_datasheet].

# Low Power Profile
Other than the reverse leakage current, these values are totally unconfirmed. The values are pulled straight from the [datasheet][sx1276_datasheet].

* Reverse leakage from battery through voltage regulation circuitry has shown to draw **no measurable current**. Based on the datasheets, there is a possibility of 0.1 - 0.2uA draw.
* [CC2650][cc2650_overview]
    - Normal operation between 1.8 V and 3.8 V
    - The main MCU crystal is 24 MHz, which is doubled internally. There is also a 32 kHz clock for BLE. See section 6.9 in [overview datasheet][cc2650_brief_datasheet].
    - Active-Mode draws **61 uA/MHz**
    - Active-Mode Sensor Controller draws **8.2 uA/MHz**
    - Standby draws **1 uA** (RTC Running and RAM/CPU Retention)
    - Shutdown draws **100 nA** (Wake Up on External Events)
    - Active-Mode RX draws **5.9 mA**
    - Active-Mode TX at 0 dBm draws **6.1 mA**
    - Active-Mode TX at +5dBm draws **9.1 mA**
    - The sensor controller(when cpu freq. scalled) consumes less power than the [MSP430G2X][msp430_overview], which consumes 220 uA/MHz in active-mode and 0.7 uA in RTC mode.
* [SX1276][sx1276_overview]
    - Up to +17 dBm of RF output power which is maintained from 1.8 V to 3.7 V and +20 dBm from 2.4 V to 3.7 V. See section 5.1 of [datasheet][sx1276_datasheet].
    - We have PA_BOOST connected to the HF (high frequency) side antenna. This means we output 915MHz HF signals through PA_BOOST.
    - LoRa HF RX mode draws **10.3 mA**(125kHz bw) or **12.6 mA**(500kHz bw) with LNABoost off. See sections 2.5.1 and 2.5.5 of [datasheet][sx1276_datasheet].
    - LoRa HF TX mode draws around **90 mA** for +17dBm PA_BOOST and somewhere around **120 mA** for +20dBm PA_BOOST.
    - Sleep mode draws **0.2 uA**
    - Idle mode (RC oscillator enabled) draw **1.5 uA**
    - Standby mode (Crystal oscillator enabled) draw **1.6 mA**

# Changelog
* V2
    - Fixed button NC/NO leads. Pulldown now pulls the signal low as initially designed.
    - Fixed leakage current through the linear regulator
    - Changed FTDI footprint to have longer leads for hand soldering
    - Used a single dual N-channel mosfet chip to control LEDs
    - Changed the fiducial location
    - Changed some components to consolidate count
* V1 - Initial Release

# Contribution Info

## Generating Manufacturer Files
To generate the manufacturer files for APCircuits.com, you need to generate the Gerbers(with outline), Aperture file, and NC Drill file.

To generate the gerbers and aperture files, do the following:
1. Click File -> Fabrication Output -> Gerber Files, when viewing a PCB Layout.
2. Make sure that Top Overlay, Top Paste, Top Solder, Bottom Solder, Bottom Overlay(optional), and Mechanical 1 are selected in the Layers tab.
3. Do not have anything selected in the Drill Drawing tab, and make sure that "Embedded aperture (RS274X)" is selected in the Aperture tab.
4. Press Ok.

To generate the NC Drill File, do the following:
1. Click File -> Fabrication Output -> NC Drill Files, when viewing a PCB Layout.
2. Just click Ok to the default settings.

The previous operations place all the output files in the "Project Output for LoRaBugBoard" directory.
You now just need to combine the following list of file into a zip archive. Make sure to copy in the
README.txt from previous archives.

Archive File List:

* PCBFireflyCase.apr
* PCBFireflyCase.DRR
* PCBFireflyCase.GBL
* PCBFireflyCase.GBO
* PCBFireflyCase.GBS
* PCBFireflyCase.GM1
* PCBFireflyCase.GTL
* PCBFireflyCase.GTO
* PCBFireflyCase.GTP
* PCBFireflyCase.GTS
* PCBFireflyCase-RoundHoles.TXT
* PCBFireflyCase-SlotHoles.TXT
* README.txt

## Board Details
* Pin mappings are detailed in the spreadsheet found [here](https://docs.google.com/spreadsheets/d/1lk55i37ZrpTx_7zy1oA4uAmHo3XsjOCir2L95xEN9fU/edit?usp=sharing).
* You can find other information, such as the schematic and board renderings, in the [Info](Info/) directory.

# Antennas

| Description | Part Name   | Manufacturer | Connector |
| ------------| ----------- | ------------ | --------- |
| Standard yellow 915MHz LoRa 5.591" 1.2dBi | [NT-916-CW-HWR-SMA](http://www.linxtechnologies.com/resources/data-guides/ant-916-cw-hwr.pdf) | Linx Technologies | SMA-Male |
| 4.256" 900MHz 3.0dBi | [APAMS-118](http://abracon.com/external-antenna/APAMS-118.pdf) | Abracon LLC | SMA-Male |


[cc2650_overview]: http://www.ti.com/product/CC2650
[cc2650_brief_datasheet]: http://www.ti.com/lit/ds/symlink/cc2650.pdf
[sx1276_overview]: http://www.semtech.com/wireless-rf/rf-transceivers/sx1276/
[sx1276_datasheet]: http://www.semtech.com/images/datasheet/sx1276_77_78_79.pdf
[msp430_overview]: http://www.ti.com/lsds/ti/microcontrollers_16-bit_32-bit/msp/ultra-low_power/msp430g2x_i2x/overview.page
