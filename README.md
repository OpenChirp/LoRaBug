![LoRaBugBoard V2 3D Picture](Info/LoRaBugBoardV2_3D.jpg)

# Specs
* TI CC2650 MCU with BLE and 802.15.4 support
* SX1276 LoRa radio
* Provide 500mA 3.3V (3.3-3.4V) from USB.

# Info
* The power supported by the USB is limited by the 500mA limit of diode D3 and the 600mA limit of the voltage regulator U9.
* When using USB power, the 3.3V rail may swing to 3.4V. This is due to the linear regulator's ground pin voltage being raised by the inline mosfet Q4.

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
