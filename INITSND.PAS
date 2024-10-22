{$M 1024,0,0}
{$G+}
begin
asm
   mov dx,279h   {PnP Port}
   mov al,00h
   out dx,al     {Write the Plug and Play key to get the device into "SLEEP"}
   out dx,al     {Device starts in "Wait" or "Key" state}

   out dx,al     {von hier an Plug and Play Initiation Key}
   mov al,06Ah
   out dx,al
   mov al,0B5h
   out dx,al
   mov al,0DAh
   out dx,al
   mov al,0EDh
   out dx,al
   mov al,0F6h
   out dx,al
   mov al,0FBh
   out dx,al
   mov al,07Dh
   out dx,al
   mov al,0BEh
   out dx,al
   mov al,0DFh
   out dx,al
   mov al,06Fh
   out dx,al
   mov al,037h
   out dx,al
   mov al,01Bh
   out dx,al
   mov al,00Dh
   out dx,al
   mov al,086h
   out dx,al
   mov al,0C3h
   out dx,al
   mov al,061h
   out dx,al
   mov al,0B0h
   out dx,al
   mov al,058h
   out dx,al
   mov al,02Ch
   out dx,al
   mov al,016h
   out dx,al
   mov al,08Bh
   out dx,al
   mov al,045h
   out dx,al
   mov al,0A2h
   out dx,al
   mov al,0D1h
   out dx,al
   mov al,0E8h
   out dx,al
   mov al,074h
   out dx,al
   mov al,03Ah
   out dx,al
   mov al,09Dh
   out dx,al
   mov al,0CEh
   out dx,al
   mov al,0E7h
   out dx,al
   mov al,073h
   out dx,al
   mov al,039h    {bis hier an Plug and Play Initiation Key}
   out dx,al

   mov al,003h    {WAKE CSN (Card Select Number) 0}
   out dx,al
   mov dx,0A79h
   mov al,000h    {goes to "ISOLATION"}
   out dx,al
   mov dx,0279h
   mov al,000h    {Program read port = 0x36B,}
   out dx,al
   mov dx,0A79h
   mov al,0DAh    {and go to "CONFIG" state}
   out dx,al
   mov dx,0279h
   mov al,006h    {Program CSN = B4}
   out dx,al
   mov dx,0A79h
   mov al,0B4h
   out dx,al


                  {------SB/CODEC/OPL3------}
   mov dx,0279h
   mov al,007h    {Set LDN = 0 to program SB/CODEC/OPL3}
   out dx,al
   mov dx,0A79h
   mov al,000h
   out dx,al

   mov dx,0279h
   mov al,060h    {Program I/O range 0, Sound Blaster = 0x220}
   out dx,al
   mov dx,0A79h
   mov al,002h    {MSB}
   out dx,al
   mov dx,0279h
   mov al,061h
   out dx,al
   mov dx,0A79h
   mov al,020h    {LSB}
   out dx,al

   mov dx,0279h
   mov al,062h    {Program I/O Range 0, OPL3 = 0x388 (Adlib)}
   out dx,al
   mov dx,0A79h
   mov al,003h    {MSB}
   out dx,al
   mov dx,0279h
   mov al,063h
   out dx,al
   mov dx,0A79h
   mov al,088h    {LSB}
   out dx,al

   mov dx,0279h
   mov al,064h    {Program I/O Range 0, CODEC = 0x130}
   out dx,al
   mov dx,0A79h
   mov al,001h    {MSB}
   out dx,al
   mov dx,0279h
   mov al,065h
   out dx,al
   mov dx,0A79h
   mov al,030h    {LSB}
   out dx,al

   mov dx,0279h
   mov al,074h    {Program SB/CODEC Playback DMA}
   out dx,al
   mov dx,0A79h
   mov al,001h    {to DMA channel 1}
   out dx,al

   mov dx,0279h
   mov al,075h    {Program CODEC Capture DMA}
   out dx,al
   mov dx,0A79h
   mov al,000h    {to DMA channel 0. Program to 4 for SDC mode}
   out dx,al

   mov dx,0279h
   mov al,070h    {Program SB/CODEC interrupt}
   out dx,al
   mov dx,0A79h
   mov al,007h    {to IRQ 7}
   out dx,al

   mov dx,0279h
   mov al,030h    {Enable SB/CODEC/OPL3}
   out dx,al
   mov dx,0A79h
   mov al,001h
   out dx,al



                  {------MPU-401------}
   mov dx,0279h
   mov al,007h    {Sct LDN = 1 to program MPU-401.}
   out dx,al
   mov dx,0A79h
   mov al,001h
   out dx,al

   mov dx,0279h
   mov al,060h    {Program I/O range 0, MPU-401 = 0x330}
   out dx,al
   mov dx,0A79h
   mov al,003h    {MSB}
   out dx,al
   mov dx,0279h
   mov al,061h
   out dx,al
   mov dx,0A79h
   mov al,030h    {LSB}
   out dx,al

   mov dx,0279h
   mov al,070h    {Program MPU-401 interrupt}
   out dx,al
   mov dx,0A79h
   mov al,00Fh    {to IRQ15}
   out dx,al

   mov dx,0279h
   mov al,030h    {Enable MPU-401}
   out dx,al
   mov dx,0A79h
   mov al,001h
   out dx,al


                  {------GAME PORT------}
   mov dx,0279h
   mov al,007h    {Set LDN = 2 to program GAME Port}
   out dx,al
   mov dx,0A79h
   mov al,002h
   out dx,al

   mov dx,0279h
   mov al,060h    {Program I/O range 0, GAME = 0x200}
   out dx,al
   mov dx,0A79h
   mov al,002h    {MSB}
   out dx,al
   mov dx,0279h
   mov al,061h
   out dx,al
   mov dx,0A79h
   mov al,000h    {LSB}
   out dx,al

   mov dx,0279h
   mov al,030h    {Enable GAME Port}
   out dx,al
   mov dx,0A79h
   mov al,001h
   out dx,al



                  {------SB Reset------}
   mov dx,0226h
   mov al,001h    {Put SB in reset (good to do while running CODEC tests)}
   out dx,al
end;
end.