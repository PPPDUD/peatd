# peatd
peatd is a configurable flight tracker for people who don't like configuring flight trackers.

The name stands for **P**PPDUD's **E**xcellent **A**DS-B **T**racker **D**aemon. Under the hood, it uses Wiedehopf's `readsb` for receiving flight data; `viewadsb` and `ttyd` handle the frontend.


## Installation
Download one of the `.deb` files from the Releases tab and install it with `sudo apt install ./peatd.deb` (don't forget the `./` at the beginning!).

After installing `peatd`, you are heavily advised to study [peatd(8)](https://mojavesoft.net/man/8/peatd.8.html) (general command information) and [peatd(7)](https://mojavesoft.net/man/7/peatd.7.html) (configuration details).

## A note about manmade code
The owner of this project believes in good faith that it complies with [The Manmade Software Declaration 1.0](https://mojavesoft.net/ai-policy/1.0). Contributors are encouraged to follow the guidelines described at the aforementioned link when proposing any code changes, and patches that appear to violate those rules may be rejected at any time.
