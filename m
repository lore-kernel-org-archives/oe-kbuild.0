Content-Type: multipart/mixed; boundary="===============1986974989533800590=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/comedi/drivers/comedi_8254.c:164 __i8254_write() warn: ignoring unreachable code.
Date: Sun, 21 Aug 2022 23:01:56 +0800
Message-ID: <202208212223.Cwmkj1Mz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1986974989533800590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: parisc-randconfig-m031-20220821 (https://download.01.org/0day-ci/ar=
chive/20220821/202208212223.Cwmkj1Mz-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/comedi/drivers/comedi_8254.c:164 __i8254_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/pcl730.c:223 pcl730_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl726.c:294 pcl726_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcm3724.c:156 enable_chan() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/das16m1.c:304 das16m1_ai_cancel() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/das16m1.c:367 das16m1_do_insn_bits() warn: ignoring =
unreachable code.
drivers/comedi/drivers/rti800.c:245 rti800_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/das16.c:894 das16_do_insn_bits() warn: ignoring unre=
achable code.
drivers/comedi/drivers/dt2814.c:214 dt2814_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2814.c:235 dt2814_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2814.c:295 dt2814_interrupt() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2817.c:65 dt2817_dio_insn_config() warn: ignoring =
unreachable code.
drivers/comedi/drivers/dt2817.c:82 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2817.c:125 dt2817_attach() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2811.c:209 dt2811_interrupt() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2811.c:237 dt2811_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2811.c:248 dt2811_ai_set_chanspec() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/dt2811.c:531 dt2811_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/aio_iiro_16.c:81 aio_iiro_enable_irq() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/c6xdigio.c:66 c6xdigio_write_data() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/adq12b.c:166 adq12b_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/ni_at_a2150.c:217 a2150_interrupt() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_at_a2150.c:767 a2150_detach() warn: ignoring unre=
achable code.
drivers/comedi/drivers/ni_at_ao.c:123 atao_select_reg_group() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/ni_at_ao.c:159 atao_dio_insn_bits() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_at_ao.c:194 atao_dio_insn_config() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/ni_atmio16d.c:534 atmio16d_dio_insn_bits() warn: ign=
oring unreachable code.
drivers/comedi/drivers/ni_atmio16d.c:565 atmio16d_dio_insn_config() warn: i=
gnoring unreachable code.
drivers/comedi/drivers/multiq3.c:77 multiq3_set_ctrl() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/multiq3.c:167 multiq3_do_insn_bits() warn: ignoring =
unreachable code.
drivers/comedi/drivers/s526.c:507 s526_dio_insn_bits() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/s526.c:545 s526_dio_insn_config() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/ni_mio_common.c:227 ni_writel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/ni_mio_common.c:235 ni_writew() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/ni_mio_common.c:243 ni_writeb() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das08.c:296 das08jr_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/amplc_dio200_common.c:114 dio200_write8() warn: igno=
ring unreachable code.
drivers/comedi/drivers/amplc_dio200_common.c:141 dio200_write32() warn: ign=
oring unreachable code.
drivers/comedi/drivers/ni_labpc_common.c:90 labpc_outb() warn: ignoring unr=
eachable code.
drivers/i2c/busses/i2c-ocores.c:141 oc_setreg_io_8() warn: ignoring unreach=
able code.
drivers/misc/altera-stapl/altera-lpt.c:20 byteblaster_write() warn: ignorin=
g unreachable code.
drivers/tty/serial/8250/serial_cs.c:148 quirk_wakeup_oxsemi() warn: ignorin=
g unreachable code.
drivers/tty/serial/8250/8250_port.c:390 hub6_serial_in() warn: ignoring unr=
eachable code.
drivers/tty/serial/8250/8250_port.c:458 io_serial_out() warn: ignoring unre=
achable code.
arch/parisc/lib/iomap.c:89 ioport_write8() warn: ignoring unreachable code.
arch/parisc/lib/iomap.c:94 ioport_write16() warn: ignoring unreachable code.
arch/parisc/lib/iomap.c:99 ioport_write32() warn: ignoring unreachable code.

Old smatch warnings:
drivers/comedi/drivers/comedi_8254.c:170 __i8254_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/comedi_8254.c:176 __i8254_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/pcl730.c:225 pcl730_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl730.c:227 pcl730_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl730.c:229 pcl730_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl726.c:253 pcl726_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/pcl726.c:296 pcl726_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl726.c:299 pcl726_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl726.c:301 pcl726_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcm3724.c:117 do_3724_config() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/das16m1.c:115 das16m1_ai_set_queue() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das16m1.c:285 das16m1_ai_cmd() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/das16m1.c:336 das16m1_ai_insn_read() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das16m1.c:474 das16m1_interrupt() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/das16m1.c:591 das16m1_attach() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/rti800.c:142 rti800_ai_eoc() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/rti800.c:163 rti800_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/rti800.c:222 rti800_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/rti800.c:264 rti800_attach() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/das16.c:542 das16_ai_set_mux_range() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das16.c:714 das16_cmd_exec() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/das16.c:726 das16_cmd_exec() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/das16.c:731 das16_cmd_exec() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/das16.c:734 das16_cmd_exec() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/das16.c:773 das16_cancel() warn: ignoring unreachabl=
e code.
drivers/comedi/drivers/das16.c:838 das16_ai_insn_read() warn: ignoring unre=
achable code.
drivers/comedi/drivers/das16.c:871 das16_ao_insn_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/das16.c:920 das16_reset() warn: ignoring unreachable=
 code.
drivers/comedi/drivers/das16.c:1145 das16_attach() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/dt2814.c:112 dt2814_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2814.c:313 dt2814_attach() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2817.c:84 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2817.c:86 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2817.c:88 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2811.c:296 dt2811_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2811.c:506 dt2811_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/dt2811.c:541 dt2811_reset() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/aio_iiro_16.c:145 aio_iiro_16_do_insn_bits() warn: i=
gnoring unreachable code.
drivers/comedi/drivers/adq12b.c:121 adq12b_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/ni_at_a2150.c:230 a2150_cancel() warn: ignoring unre=
achable code.
drivers/comedi/drivers/ni_at_a2150.c:480 a2150_ai_cmd() warn: ignoring unre=
achable code.
drivers/comedi/drivers/ni_at_a2150.c:586 a2150_ai_rinsn() warn: ignoring un=
reachable code.
drivers/comedi/drivers/ni_at_a2150.c:739 a2150_attach() warn: ignoring unre=
achable code.
drivers/comedi/drivers/ni_at_ao.c:142 atao_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_at_ao.c:250 atao_calib_insn_write() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/ni_at_ao.c:272 atao_reset() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/ni_atmio16d.c:153 reset_counters() warn: ignoring un=
reachable code.
drivers/comedi/drivers/ni_atmio16d.c:194 reset_atmio16d() warn: ignoring un=
reachable code.
drivers/comedi/drivers/ni_atmio16d.c:305 atmio16d_ai_cmd() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_atmio16d.c:309 atmio16d_ai_cmd() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_atmio16d.c:452 atmio16d_ai_eoc() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_atmio16d.c:477 atmio16d_ai_insn_read() warn: igno=
ring unreachable code.
drivers/comedi/drivers/ni_atmio16d.c:522 atmio16d_ao_insn_write() warn: ign=
oring unreachable code.
drivers/comedi/drivers/multiq3.c:112 multiq3_ai_insn_read() warn: ignoring =
unreachable code.
drivers/comedi/drivers/multiq3.c:144 multiq3_ao_insn_write() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/multiq3.c:189 multiq3_encoder_insn_read() warn: igno=
ring unreachable code.
drivers/comedi/drivers/multiq3.c:224 multiq3_encoder_reset() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/s526.c:179 s526_gpct_write() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/s526.c:235 s526_gpct_insn_config() warn: ignoring un=
reachable code.
drivers/comedi/drivers/s526.c:314 s526_gpct_insn_config() warn: ignoring un=
reachable code.
drivers/comedi/drivers/s526.c:351 s526_gpct_insn_config() warn: ignoring un=
reachable code.
drivers/comedi/drivers/s526.c:426 s526_eoc() warn: ignoring unreachable cod=
e.
drivers/comedi/drivers/s526.c:457 s526_ai_insn_read() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/s526.c:483 s526_ao_insn_write() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das08.c:192 das08_ai_insn_read() warn: ignoring unre=
achable code.
drivers/comedi/drivers/das08.c:272 das08_do_insn_bits() warn: ignoring unre=
achable code.
drivers/comedi/drivers/das08.c:313 das08_ao_set_data() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das08.c:318 das08_ao_set_data() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/ni_labpc_common.c:1337 labpc_common_attach() warn: '=
irq' from request_irq() not released on lines: 1243.
drivers/tty/serial/8250/serial_cs.c:162 quirk_wakeup_possio_gcc() warn: ign=
oring unreachable code.
drivers/tty/serial/8250/8250_port.c:397 hub6_serial_out() warn: ignoring un=
reachable code.
drivers/tty/serial/8250/8250_port.c:1243 autoconfig() warn: ignoring unreac=
hable code.
drivers/tty/serial/8250/8250_port.c:1388 autoconfig_irq() warn: ignoring un=
reachable code.
drivers/tty/serial/8250/8250_port.c:1423 autoconfig_irq() warn: ignoring un=
reachable code.
drivers/tty/serial/8250/8250_port.c:2423 serial8250_do_startup() warn: igno=
ring unreachable code.

vim +164 drivers/comedi/drivers/comedi_8254.c

d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  152  =

d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  153  static void __i8254_write(struct comedi_8254 *i8254,
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  154  			  unsigned int val, unsigned int reg)
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  155  {
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  156  	unsigned int reg_offset =3D (reg * i8254->iosize) << i=
8254->regshift;
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  157  =

d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  158  	switch (i8254->iosize) {
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  159  	default:
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  160  	case I8254_IO8:
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  161  		if (i8254->mmio)
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  162  			writeb(val, i8254->mmio + reg_offset);
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  163  		else
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23 @164  			outb(val, i8254->iobase + reg_offset);
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  165  		break;
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  166  	case I8254_IO16:
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  167  		if (i8254->mmio)
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  168  			writew(val, i8254->mmio + reg_offset);
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  169  		else
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  170  			outw(val, i8254->iobase + reg_offset);
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  171  		break;
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  172  	case I8254_IO32:
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  173  		if (i8254->mmio)
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  174  			writel(val, i8254->mmio + reg_offset);
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  175  		else
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  176  			outl(val, i8254->iobase + reg_offset);
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  177  		break;
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  178  	}
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  179  }
d42b5211d861f1 drivers/staging/comedi/drivers/comedi_8254.c H Hartley Sweet=
en 2015-02-23  180  =


:::::: The code at line 164 was first introduced by commit
:::::: d42b5211d861f1077869e9133efa19297a6f152b staging: comedi: comedi_825=
4: introduce module for 8254 timer support

:::::: TO: H Hartley Sweeten <hsweeten@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1986974989533800590==--

