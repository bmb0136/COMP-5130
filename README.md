# COMP 5130

Data Mining course project.

## Notes

This project has been tested on:
- NixOS (Linux) w/ Python 3.12.12
- Windows 10 w/ Python 3.13.2

## How to Run

This project requires Python with the following dependencies installed:
- numpy
- matplotlib
- pandas
- prophet
- pmdarima

Then, run the main file **from the root of the repository**:
```
python3 src/main.py
```
> If you are on windows, you will need to change the forward slash for a backslash.

The graphs will be saved to the `output/` directory.


### With Nix (optional)

If you have Nix installed, you can obtain Python and the necessary dependencies using the provided devshell:
```
nix develop
```
> You will need flakes to be enabled to use the shell.
