# Specs
* Provide 500mA 3.3V (3.3-3.4V) from USB.

# Info
* The power supported by the USB is limited by the 500mA limit of diode D3 and the 600mA limit of the voltage regulator U9.
* When using USB power, the 3.3V rail may swing to 3.4V. This is due to the linear regulator's ground pin voltage being raised by the inline mosfet Q4.

# Changelog
* V2
    - Fixed button NC/NO leads. Pulldown now pulls the signal low as initially designed.
    - Fixed leakage current through the linear regulator
    - Used a single dual N-channel mosfet chip to control LEDs
    - Changed the fiducial location
* V1 - Initial Release
