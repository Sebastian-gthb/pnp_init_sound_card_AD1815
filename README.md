# pnp_init_sound_card_AD1815
Turbo Pascal assembly: initializing a PNP sound card with the AD1516 chip

This code was generated from the desciption in the datasheet of the AD1516 sound chip. This chip was used on old ISA sound cards. The code do under DOS what a Plug'n'Play operating system do with the right driver for this chip.

Many stuf is hard coded in the program (interrupts, adresses, codecs, ...). The target was to get a working sound card.

The code is currently under construction and experimental. The code or the sound card is not realy god working.
