Content-Type: multipart/mixed; boundary="===============7554721445145273377=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/drivers/serial-u16550.c:609 snd_uart16550_output_byte() warn: ignoring unreachable code.
Date: Thu, 17 Mar 2022 09:29:04 +0800
Message-ID: <202203170934.4dupJLnQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7554721445145273377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   10 weeks ago
:::::: branch date: 32 hours ago
:::::: commit date: 10 weeks ago
config: parisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/ar=
chive/20220317/202203170934.4dupJLnQ-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/drivers/serial-u16550.c:609 snd_uart16550_output_byte() warn: ignorin=
g unreachable code.
sound/drivers/serial-u16550.c:806 snd_uart16550_create() warn: ignoring unr=
eachable code.
sound/drivers/mpu401/mpu401_uart.c:47 mpu401_write_port() warn: ignoring un=
reachable code.
drivers/net/hamradio/baycom_ser_hdx.c:394 ser12_interrupt() warn: ignoring =
unreachable code.

Old smatch warnings:
sound/drivers/serial-u16550.c:179 snd_uart16550_buffer_output() warn: ignor=
ing unreachable code.
sound/drivers/serial-u16550.c:333 snd_uart16550_detect() warn: ignoring unr=
eachable code.
sound/drivers/serial-u16550.c:368 snd_uart16550_do_open() warn: ignoring un=
reachable code.
sound/drivers/serial-u16550.c:457 snd_uart16550_do_close() warn: ignoring u=
nreachable code.
sound/drivers/serial-u16550.c:613 snd_uart16550_output_byte() warn: ignorin=
g unreachable code.
sound/drivers/serial-u16550.c:811 snd_uart16550_create() warn: ignoring unr=
eachable code.
drivers/net/hamradio/baycom_ser_hdx.c:193 ser12_tx() warn: ignoring unreach=
able code.
drivers/net/hamradio/baycom_ser_hdx.c:158 ser12_set_divisor() warn: ignorin=
g unreachable code.
drivers/net/hamradio/baycom_ser_hdx.c:339 ser12_rx() warn: ignoring unreach=
able code.
drivers/net/hamradio/baycom_ser_hdx.c:431 ser12_check_uart() warn: ignoring=
 unreachable code.
drivers/net/hamradio/baycom_ser_hdx.c:474 ser12_open() warn: ignoring unrea=
chable code.
drivers/net/hamradio/baycom_ser_hdx.c:508 ser12_close() warn: ignoring unre=
achable code.

vim +609 sound/drivers/serial-u16550.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  594  =

0b830bac35dd6e3 Takashi Iwai   2006-11-24  595  static int snd_uart16550_ou=
tput_byte(struct snd_uart16550 *uart,
0b830bac35dd6e3 Takashi Iwai   2006-11-24  596  				     struct snd_rawmidi=
_substream *substream,
0b830bac35dd6e3 Takashi Iwai   2006-11-24  597  				     unsigned char midi=
_byte)
^1da177e4c3f415 Linus Torvalds 2005-04-16  598  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  599  	if (uart->buff_in_count =
=3D=3D 0                    /* Buffer empty? */
^1da177e4c3f415 Linus Torvalds 2005-04-16  600  	    && ((uart->adaptor !=
=3D SNDRV_SERIAL_MS124W_SA &&
^1da177e4c3f415 Linus Torvalds 2005-04-16  601  	    uart->adaptor !=3D SND=
RV_SERIAL_GENERIC) ||
^1da177e4c3f415 Linus Torvalds 2005-04-16  602  		(uart->fifo_count =3D=3D =
0                  /* FIFO empty? */
^1da177e4c3f415 Linus Torvalds 2005-04-16  603  		 && (inb(uart->base + UAR=
T_MSR) & UART_MSR_CTS)))) { /* CTS? */
^1da177e4c3f415 Linus Torvalds 2005-04-16  604  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  605  	        /* Tx Buffer Empty=
 - try to write immediately */
^1da177e4c3f415 Linus Torvalds 2005-04-16  606  		if ((inb(uart->base + UAR=
T_LSR) & UART_LSR_THRE) !=3D 0) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  607  		        /* Transmitter ho=
lding register (and Tx FIFO) empty */
^1da177e4c3f415 Linus Torvalds 2005-04-16  608  		        uart->fifo_count =
=3D 1;
^1da177e4c3f415 Linus Torvalds 2005-04-16 @609  			outb(midi_byte, uart->ba=
se + UART_TX);
^1da177e4c3f415 Linus Torvalds 2005-04-16  610  		} else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  611  		        if (uart->fifo_co=
unt < uart->fifo_limit) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  612  			        uart->fifo_count=
++;
^1da177e4c3f415 Linus Torvalds 2005-04-16  613  				outb(midi_byte, uart->b=
ase + UART_TX);
^1da177e4c3f415 Linus Torvalds 2005-04-16  614  			} else {
0b830bac35dd6e3 Takashi Iwai   2006-11-24  615  			        /* Cannot write =
(buffer empty) -
0b830bac35dd6e3 Takashi Iwai   2006-11-24  616  				 * put char in buffer */
^1da177e4c3f415 Linus Torvalds 2005-04-16  617  				snd_uart16550_write_buf=
fer(uart, midi_byte);
^1da177e4c3f415 Linus Torvalds 2005-04-16  618  			}
^1da177e4c3f415 Linus Torvalds 2005-04-16  619  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  620  	} else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  621  		if (!snd_uart16550_write_=
buffer(uart, midi_byte)) {
45203832df2fa9e Takashi Iwai   2009-02-05  622  			snd_printk(KERN_WARNING
45203832df2fa9e Takashi Iwai   2009-02-05  623  				   "%s: Buffer overrun =
on device at 0x%lx\n",
^1da177e4c3f415 Linus Torvalds 2005-04-16  624  				   uart->rmidi->name, u=
art->base);
^1da177e4c3f415 Linus Torvalds 2005-04-16  625  			return 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  626  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  627  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  628  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  629  	return 1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  630  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  631  =

4a4d2cfd8cbca30 Takashi Iwai   2005-11-17  632  static void snd_uart16550_o=
utput_write(struct snd_rawmidi_substream *substream)
^1da177e4c3f415 Linus Torvalds 2005-04-16  633  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  634  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds 2005-04-16  635  	unsigned char midi_byte, a=
ddr_byte;
0b830bac35dd6e3 Takashi Iwai   2006-11-24  636  	struct snd_uart16550 *uart=
 =3D substream->rmidi->private_data;
^1da177e4c3f415 Linus Torvalds 2005-04-16  637  	char first;
^1da177e4c3f415 Linus Torvalds 2005-04-16  638  	static unsigned long lastt=
ime =3D 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  639  	=

561de31a23a8a5d Joe Perches    2007-12-18  640  	/* Interrupts are disabled=
 during the updating of the tx_buff,
^1da177e4c3f415 Linus Torvalds 2005-04-16  641  	 * since it is 'bad' to ha=
ve two processes updating the same
^1da177e4c3f415 Linus Torvalds 2005-04-16  642  	 * variables (ie buff_in &=
 buff_out)
^1da177e4c3f415 Linus Torvalds 2005-04-16  643  	 */
^1da177e4c3f415 Linus Torvalds 2005-04-16  644  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  645  	spin_lock_irqsave(&uart->o=
pen_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  646  =

0b830bac35dd6e3 Takashi Iwai   2006-11-24  647  	if (uart->irq < 0)	/* poll=
ing */
^1da177e4c3f415 Linus Torvalds 2005-04-16  648  		snd_uart16550_io_loop(uar=
t);
^1da177e4c3f415 Linus Torvalds 2005-04-16  649  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  650  	if (uart->adaptor =3D=3D S=
NDRV_SERIAL_MS124W_MB) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  651  		while (1) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  652  			/* buffer full? */
^1da177e4c3f415 Linus Torvalds 2005-04-16  653  			/* in this mode we need =
two bytes of space */
^1da177e4c3f415 Linus Torvalds 2005-04-16  654  			if (uart->buff_in_count =
> TX_BUFF_SIZE - 2)
^1da177e4c3f415 Linus Torvalds 2005-04-16  655  				break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  656  			if (snd_rawmidi_transmit=
(substream, &midi_byte, 1) !=3D 1)
^1da177e4c3f415 Linus Torvalds 2005-04-16  657  				break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  658  #ifdef SNDRV_SERIAL_MS124W_=
MB_NOCOMBO
^1da177e4c3f415 Linus Torvalds 2005-04-16  659  			/* select exactly one of=
 the four ports */
^1da177e4c3f415 Linus Torvalds 2005-04-16  660  			addr_byte =3D (1 << (sub=
stream->number + 4)) | 0x08;
^1da177e4c3f415 Linus Torvalds 2005-04-16  661  #else
^1da177e4c3f415 Linus Torvalds 2005-04-16  662  			/* select any combinatio=
n of the four ports */
^1da177e4c3f415 Linus Torvalds 2005-04-16  663  			addr_byte =3D (substream=
->number << 4) | 0x08;
^1da177e4c3f415 Linus Torvalds 2005-04-16  664  			/* ...except none */
0b830bac35dd6e3 Takashi Iwai   2006-11-24  665  			if (addr_byte =3D=3D 0x0=
8)
0b830bac35dd6e3 Takashi Iwai   2006-11-24  666  				addr_byte =3D 0xf8;
^1da177e4c3f415 Linus Torvalds 2005-04-16  667  #endif
^1da177e4c3f415 Linus Torvalds 2005-04-16  668  			snd_uart16550_output_byt=
e(uart, substream, addr_byte);
^1da177e4c3f415 Linus Torvalds 2005-04-16  669  			/* send midi byte */
^1da177e4c3f415 Linus Torvalds 2005-04-16  670  			snd_uart16550_output_byt=
e(uart, substream, midi_byte);
^1da177e4c3f415 Linus Torvalds 2005-04-16  671  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  672  	} else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  673  		first =3D 0;
0b830bac35dd6e3 Takashi Iwai   2006-11-24  674  		while (snd_rawmidi_transm=
it_peek(substream, &midi_byte, 1) =3D=3D 1) {
0b830bac35dd6e3 Takashi Iwai   2006-11-24  675  			/* Also send F5 after 3 =
seconds with no data
0b830bac35dd6e3 Takashi Iwai   2006-11-24  676  			 * to handle device disc=
onnect */
0b830bac35dd6e3 Takashi Iwai   2006-11-24  677  			if (first =3D=3D 0 &&
0b830bac35dd6e3 Takashi Iwai   2006-11-24  678  			    (uart->adaptor =3D=
=3D SNDRV_SERIAL_SOUNDCANVAS ||
^1da177e4c3f415 Linus Torvalds 2005-04-16  679  			     uart->adaptor =3D=
=3D SNDRV_SERIAL_GENERIC) &&
0b830bac35dd6e3 Takashi Iwai   2006-11-24  680  			    (uart->prev_out !=3D=
 substream->number ||
f11b799282201fb Julia Lawall   2008-01-07  681  			     time_after(jiffies,=
 lasttime + 3*HZ))) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  682  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  683  				if (snd_uart16550_buffe=
r_can_write(uart, 3)) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  684  					/* Roland Soundcanvas =
part selection */
0b830bac35dd6e3 Takashi Iwai   2006-11-24  685  					/* If this substream o=
f the data is
0b830bac35dd6e3 Takashi Iwai   2006-11-24  686  					 * different previous =
substream
0b830bac35dd6e3 Takashi Iwai   2006-11-24  687  					 * in this uart, send =
the change part
0b830bac35dd6e3 Takashi Iwai   2006-11-24  688  					 * event
0b830bac35dd6e3 Takashi Iwai   2006-11-24  689  					 */
^1da177e4c3f415 Linus Torvalds 2005-04-16  690  					uart->prev_out =3D sub=
stream->number;
^1da177e4c3f415 Linus Torvalds 2005-04-16  691  					/* change part */
0b830bac35dd6e3 Takashi Iwai   2006-11-24  692  					snd_uart16550_output_b=
yte(uart, substream,
0b830bac35dd6e3 Takashi Iwai   2006-11-24  693  								  0xf5);
^1da177e4c3f415 Linus Torvalds 2005-04-16  694  					/* data */
0b830bac35dd6e3 Takashi Iwai   2006-11-24  695  					snd_uart16550_output_b=
yte(uart, substream,
0b830bac35dd6e3 Takashi Iwai   2006-11-24  696  								  uart->prev_out + =
1);
0b830bac35dd6e3 Takashi Iwai   2006-11-24  697  					/* If midi_byte is a d=
ata byte,
0b830bac35dd6e3 Takashi Iwai   2006-11-24  698  					 * send the previous s=
tatus byte */
0b830bac35dd6e3 Takashi Iwai   2006-11-24  699  					if (midi_byte < 0x80 &&
0b830bac35dd6e3 Takashi Iwai   2006-11-24  700  					    uart->adaptor =3D=
=3D SNDRV_SERIAL_SOUNDCANVAS)
^1da177e4c3f415 Linus Torvalds 2005-04-16  701  						snd_uart16550_output_=
byte(uart, substream, uart->prev_status[uart->prev_out]);
^1da177e4c3f415 Linus Torvalds 2005-04-16  702  				} else if (!uart->drop_=
on_full)
^1da177e4c3f415 Linus Torvalds 2005-04-16  703  					break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  704  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  705  			}
^1da177e4c3f415 Linus Torvalds 2005-04-16  706  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  707  			/* send midi byte */
0b830bac35dd6e3 Takashi Iwai   2006-11-24  708  			if (!snd_uart16550_outpu=
t_byte(uart, substream, midi_byte) &&
0b830bac35dd6e3 Takashi Iwai   2006-11-24  709  			    !uart->drop_on_full )
^1da177e4c3f415 Linus Torvalds 2005-04-16  710  				break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  711  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  712  			if (midi_byte >=3D 0x80 =
&& midi_byte < 0xf0)
^1da177e4c3f415 Linus Torvalds 2005-04-16  713  				uart->prev_status[uart-=
>prev_out] =3D midi_byte;
^1da177e4c3f415 Linus Torvalds 2005-04-16  714  			first =3D 1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  715  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  716  			snd_rawmidi_transmit_ack=
( substream, 1 );
^1da177e4c3f415 Linus Torvalds 2005-04-16  717  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  718  		lasttime =3D jiffies;
^1da177e4c3f415 Linus Torvalds 2005-04-16  719  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  720  	spin_unlock_irqrestore(&ua=
rt->open_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  721  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  722  =

0b830bac35dd6e3 Takashi Iwai   2006-11-24  723  static void snd_uart16550_o=
utput_trigger(struct snd_rawmidi_substream *substream,
0b830bac35dd6e3 Takashi Iwai   2006-11-24  724  					 int up)
^1da177e4c3f415 Linus Torvalds 2005-04-16  725  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  726  	unsigned long flags;
0b830bac35dd6e3 Takashi Iwai   2006-11-24  727  	struct snd_uart16550 *uart=
 =3D substream->rmidi->private_data;
^1da177e4c3f415 Linus Torvalds 2005-04-16  728  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  729  	spin_lock_irqsave(&uart->o=
pen_lock, flags);
0b830bac35dd6e3 Takashi Iwai   2006-11-24  730  	if (up)
^1da177e4c3f415 Linus Torvalds 2005-04-16  731  		uart->filemode |=3D SERIA=
L_MODE_OUTPUT_TRIGGERED;
0b830bac35dd6e3 Takashi Iwai   2006-11-24  732  	else
^1da177e4c3f415 Linus Torvalds 2005-04-16  733  		uart->filemode &=3D ~SERI=
AL_MODE_OUTPUT_TRIGGERED;
^1da177e4c3f415 Linus Torvalds 2005-04-16  734  	spin_unlock_irqrestore(&ua=
rt->open_lock, flags);
^1da177e4c3f415 Linus Torvalds 2005-04-16  735  	if (up)
^1da177e4c3f415 Linus Torvalds 2005-04-16  736  		snd_uart16550_output_writ=
e(substream);
^1da177e4c3f415 Linus Torvalds 2005-04-16  737  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  738  =

c36f486d7bc71d4 Takashi Iwai   2017-01-05  739  static const struct snd_raw=
midi_ops snd_uart16550_output =3D
^1da177e4c3f415 Linus Torvalds 2005-04-16  740  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  741  	.open =3D		snd_uart16550_o=
utput_open,
^1da177e4c3f415 Linus Torvalds 2005-04-16  742  	.close =3D	snd_uart16550_o=
utput_close,
^1da177e4c3f415 Linus Torvalds 2005-04-16  743  	.trigger =3D	snd_uart16550=
_output_trigger,
^1da177e4c3f415 Linus Torvalds 2005-04-16  744  };
^1da177e4c3f415 Linus Torvalds 2005-04-16  745  =

c36f486d7bc71d4 Takashi Iwai   2017-01-05  746  static const struct snd_raw=
midi_ops snd_uart16550_input =3D
^1da177e4c3f415 Linus Torvalds 2005-04-16  747  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  748  	.open =3D		snd_uart16550_i=
nput_open,
^1da177e4c3f415 Linus Torvalds 2005-04-16  749  	.close =3D	snd_uart16550_i=
nput_close,
^1da177e4c3f415 Linus Torvalds 2005-04-16  750  	.trigger =3D	snd_uart16550=
_input_trigger,
^1da177e4c3f415 Linus Torvalds 2005-04-16  751  };
^1da177e4c3f415 Linus Torvalds 2005-04-16  752  =

fbbb01a12d5d553 Bill Pemberton 2012-12-06  753  static int snd_uart16550_cr=
eate(struct snd_card *card,
^1da177e4c3f415 Linus Torvalds 2005-04-16  754  				unsigned long iobase,
^1da177e4c3f415 Linus Torvalds 2005-04-16  755  				int irq,
^1da177e4c3f415 Linus Torvalds 2005-04-16  756  				unsigned int speed,
^1da177e4c3f415 Linus Torvalds 2005-04-16  757  				unsigned int base,
^1da177e4c3f415 Linus Torvalds 2005-04-16  758  				int adaptor,
^1da177e4c3f415 Linus Torvalds 2005-04-16  759  				int droponfull,
0b830bac35dd6e3 Takashi Iwai   2006-11-24  760  				struct snd_uart16550 **=
ruart)
^1da177e4c3f415 Linus Torvalds 2005-04-16  761  {
0b830bac35dd6e3 Takashi Iwai   2006-11-24  762  	struct snd_uart16550 *uart;
^1da177e4c3f415 Linus Torvalds 2005-04-16  763  	int err;
^1da177e4c3f415 Linus Torvalds 2005-04-16  764  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  765  =

60d03de81c40270 Takashi Iwai   2021-07-15  766  	uart =3D devm_kzalloc(card=
->dev, sizeof(*uart), GFP_KERNEL);
d0ad13ef704164c Takashi Iwai   2021-06-08  767  	if (!uart)
^1da177e4c3f415 Linus Torvalds 2005-04-16  768  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds 2005-04-16  769  	uart->adaptor =3D adaptor;
^1da177e4c3f415 Linus Torvalds 2005-04-16  770  	uart->card =3D card;
^1da177e4c3f415 Linus Torvalds 2005-04-16  771  	spin_lock_init(&uart->open=
_lock);
^1da177e4c3f415 Linus Torvalds 2005-04-16  772  	uart->irq =3D -1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  773  	uart->base =3D iobase;
^1da177e4c3f415 Linus Torvalds 2005-04-16  774  	uart->drop_on_full =3D dro=
ponfull;
^1da177e4c3f415 Linus Torvalds 2005-04-16  775  =

d0ad13ef704164c Takashi Iwai   2021-06-08  776  	err =3D snd_uart16550_dete=
ct(uart);
d0ad13ef704164c Takashi Iwai   2021-06-08  777  	if (err <=3D 0) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  778  		printk(KERN_ERR "no UART =
detected@0x%lx\n", iobase);
68b8bc05213567c Takashi Iwai   2006-01-23  779  		return -ENODEV;
^1da177e4c3f415 Linus Torvalds 2005-04-16  780  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  781  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  782  	if (irq >=3D 0 && irq !=3D=
 SNDRV_AUTO_IRQ) {
60d03de81c40270 Takashi Iwai   2021-07-15  783  		if (devm_request_irq(card=
->dev, irq, snd_uart16550_interrupt,
88e24c3a4b30a6b Yong Zhang     2011-09-22  784  				     0, "Serial MIDI", =
uart)) {
45203832df2fa9e Takashi Iwai   2009-02-05  785  			snd_printk(KERN_WARNING
45203832df2fa9e Takashi Iwai   2009-02-05  786  				   "irq %d busy. Using =
Polling.\n", irq);
^1da177e4c3f415 Linus Torvalds 2005-04-16  787  		} else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  788  			uart->irq =3D irq;
^1da177e4c3f415 Linus Torvalds 2005-04-16  789  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  790  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  791  	uart->divisor =3D base / s=
peed;
^1da177e4c3f415 Linus Torvalds 2005-04-16  792  	uart->speed =3D base / (un=
signed int)uart->divisor;
^1da177e4c3f415 Linus Torvalds 2005-04-16  793  	uart->speed_base =3D base;
^1da177e4c3f415 Linus Torvalds 2005-04-16  794  	uart->prev_out =3D -1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  795  	uart->prev_in =3D 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  796  	uart->rstatus =3D 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  797  	memset(uart->prev_status, =
0x80, sizeof(unsigned char) * SNDRV_SERIAL_MAX_OUTS);
bc47ba90b01afe4 Kees Cook      2017-10-24  798  	timer_setup(&uart->buffer_=
timer, snd_uart16550_buffer_timer, 0);
^1da177e4c3f415 Linus Torvalds 2005-04-16  799  	uart->timer_running =3D 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  800  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  801  	switch (uart->adaptor) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  802  	case SNDRV_SERIAL_MS124W_S=
A:
^1da177e4c3f415 Linus Torvalds 2005-04-16  803  	case SNDRV_SERIAL_MS124W_M=
B:
^1da177e4c3f415 Linus Torvalds 2005-04-16  804  		/* MS-124W can draw power=
 from RTS and DTR if they
^1da177e4c3f415 Linus Torvalds 2005-04-16  805  		   are in opposite states=
. */ =

^1da177e4c3f415 Linus Torvalds 2005-04-16 @806  		outb(UART_MCR_RTS | (0&UA=
RT_MCR_DTR), uart->base + UART_MCR);
^1da177e4c3f415 Linus Torvalds 2005-04-16  807  		break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  808  	case SNDRV_SERIAL_MS124T:
^1da177e4c3f415 Linus Torvalds 2005-04-16  809  		/* MS-124T can draw power=
 from RTS and/or DTR (preferably
^1da177e4c3f415 Linus Torvalds 2005-04-16  810  		   both) if they are asse=
rted. */
^1da177e4c3f415 Linus Torvalds 2005-04-16  811  		outb(UART_MCR_RTS | UART_=
MCR_DTR, uart->base + UART_MCR);
^1da177e4c3f415 Linus Torvalds 2005-04-16  812  		break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  813  	default:
^1da177e4c3f415 Linus Torvalds 2005-04-16  814  		break;
^1da177e4c3f415 Linus Torvalds 2005-04-16  815  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  816  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  817  	if (ruart)
^1da177e4c3f415 Linus Torvalds 2005-04-16  818  		*ruart =3D uart;
^1da177e4c3f415 Linus Torvalds 2005-04-16  819  =

^1da177e4c3f415 Linus Torvalds 2005-04-16  820  	return 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  821  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  822  =


:::::: The code at line 609 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7554721445145273377==--

