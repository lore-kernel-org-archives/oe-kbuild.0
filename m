Content-Type: multipart/mixed; boundary="===============7613771395087252746=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/altera-stapl/altera-lpt.c:20 byteblaster_write() warn: ignoring unreachable code.
Date: Wed, 02 Mar 2022 13:03:48 +0800
Message-ID: <202203021237.eHwC5mJi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7613771395087252746==
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
head:   fb184c4af9b9f4563e7a126219389986a71d5b5b
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   8 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
config: parisc-randconfig-m031-20220301 (https://download.01.org/0day-ci/ar=
chive/20220302/202203021237.eHwC5mJi-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/altera-stapl/altera-lpt.c:20 byteblaster_write() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/comedi_8254.c:164 __i8254_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/pcm3724.c:156 enable_chan() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/pcl812.c:592 pcl812_ai_clear_eoc() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl812.c:598 pcl812_ai_soft_trig() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl812.c:754 pcl812_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/das16.c:894 das16_do_insn_bits() warn: ignoring unre=
achable code.
drivers/comedi/drivers/pcl818.c:337 pcl818_ai_set_chan_scan() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/pcl818.c:372 pcl818_ai_clear_eoc() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl818.c:378 pcl818_ai_soft_trig() warn: ignoring un=
reachable code.
arch/parisc/lib/iomap.c:89 ioport_write8() warn: ignoring unreachable code.
arch/parisc/lib/iomap.c:94 ioport_write16() warn: ignoring unreachable code.
arch/parisc/lib/iomap.c:99 ioport_write32() warn: ignoring unreachable code.
drivers/i2c/busses/i2c-ocores.c:141 oc_setreg_io_8() warn: ignoring unreach=
able code.
drivers/comedi/drivers/das800.c:228 das800_ind_read() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/das800.c:241 das800_enable() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/das6402.c:140 das6402_set_mode() warn: ignoring unre=
achable code.
drivers/comedi/drivers/das6402.c:153 das6402_clear_all_interrupts() warn: i=
gnoring unreachable code.
drivers/comedi/drivers/das6402.c:160 das6402_ai_clear_eoc() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das6402.c:355 das6402_ai_cancel() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/das6402.c:362 das6402_ai_soft_trig() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das6402.c:508 das6402_do_insn_bits() warn: ignoring =
unreachable code.
drivers/comedi/drivers/dt2801.c:328 dt2801_writecmd() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/das1800.c:1038 das1800_do_insn_bits() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/dt2811.c:209 dt2811_interrupt() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2811.c:237 dt2811_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2811.c:248 dt2811_ai_set_chanspec() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/dt2811.c:531 dt2811_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2817.c:65 dt2817_dio_insn_config() warn: ignoring =
unreachable code.
drivers/comedi/drivers/dt2817.c:82 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2817.c:125 dt2817_attach() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dmm32at.c:399 dmm32at_ai_cancel() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/dmm32at.c:434 dmm32at_isr() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/aio_iiro_16.c:81 aio_iiro_enable_irq() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/c6xdigio.c:66 c6xdigio_write_data() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_at_ao.c:123 atao_select_reg_group() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/ni_at_ao.c:159 atao_dio_insn_bits() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_at_ao.c:194 atao_dio_insn_config() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/multiq3.c:77 multiq3_set_ctrl() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/multiq3.c:167 multiq3_do_insn_bits() warn: ignoring =
unreachable code.
drivers/comedi/drivers/s526.c:507 s526_dio_insn_bits() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/s526.c:545 s526_dio_insn_config() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/ni_labpc_common.c:90 labpc_outb() warn: ignoring unr=
eachable code.

Old smatch warnings:
drivers/comedi/drivers/comedi_8254.c:170 __i8254_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/comedi_8254.c:176 __i8254_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/pcm3724.c:117 do_3724_config() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/pcl812.c:578 pcl812_ai_set_chan_range() warn: ignori=
ng unreachable code.
drivers/comedi/drivers/pcl812.c:902 pcl812_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/pcl812.c:918 pcl812_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl812.c:951 pcl812_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/pcl812.c:976 pcl812_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl812.c:992 pcl812_reset() warn: ignoring unreachab=
le code.
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
drivers/comedi/drivers/pcl818.c:329 pcl818_ai_set_chan_range() warn: ignori=
ng unreachable code.
drivers/comedi/drivers/pcl818.c:366 pcl818_ai_setup_chanlist() error: unini=
tialized symbol 'last_chan'.
drivers/comedi/drivers/pcl818.c:734 pcl818_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/pcl818.c:785 pcl818_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/pcl818.c:810 pcl818_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl818.c:841 pcl818_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/pcl818.c:868 pcl818_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl818.c:884 pcl818_reset() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/pcl818.c:890 pcl818_reset() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/das800.c:218 das800_ind_write() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das800.c:390 das800_ai_do_cmd() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das800.c:545 das800_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/das6402.c:146 das6402_set_extended() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das6402.c:234 das6402_ai_cmd() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/das6402.c:392 das6402_ai_insn_read() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das6402.c:433 das6402_ao_insn_write() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/das6402.c:460 das6402_ao_insn_write() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/das6402.c:466 das6402_ao_insn_write() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/das6402.c:520 das6402_reset() warn: ignoring unreach=
able code.
drivers/comedi/drivers/dt2801.c:273 dt2801_writedata() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2801.c:344 dt2801_reset() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/das1800.c:416 das1800_handle_dma() warn: ignoring un=
reachable code.
drivers/comedi/drivers/das1800.c:432 das1800_ai_cancel() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/das1800.c:456 das1800_ai_handler() warn: ignoring un=
reachable code.
drivers/comedi/drivers/das1800.c:536 das1800_interrupt() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/das1800.c:816 das1800_ai_set_chanlist() warn: ignori=
ng unreachable code.
drivers/comedi/drivers/das1800.c:911 das1800_ai_cmd() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/das1800.c:952 das1800_ai_insn_read() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das1800.c:1005 das1800_ao_insn_write() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/das1800.c:1299 das1800_attach() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das1800.c:1333 das1800_attach() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2811.c:296 dt2811_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2811.c:506 dt2811_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/dt2811.c:541 dt2811_reset() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/dt2817.c:84 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2817.c:86 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2817.c:88 dt2817_dio_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dmm32at.c:167 dmm32at_ai_set_chanspec() warn: ignori=
ng unreachable code.
drivers/comedi/drivers/dmm32at.c:220 dmm32at_ai_insn_read() warn: ignoring =
unreachable code.
drivers/comedi/drivers/dmm32at.c:344 dmm32at_setaitimer() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dmm32at.c:372 dmm32at_ai_cmd() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/dmm32at.c:464 dmm32at_ao_insn_write() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/dmm32at.c:486 dmm32at_8255_io() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dmm32at.c:501 dmm32at_reset() warn: ignoring unreach=
able code.
drivers/comedi/drivers/aio_iiro_16.c:145 aio_iiro_16_do_insn_bits() warn: i=
gnoring unreachable code.
drivers/comedi/drivers/ni_at_ao.c:142 atao_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_at_ao.c:250 atao_calib_insn_write() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/ni_at_ao.c:272 atao_reset() warn: ignoring unreachab=
le code.
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

vim +20 drivers/misc/altera-stapl/altera-lpt.c

fa766c9be58bd87 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin=
 2011-01-25  17  =

fa766c9be58bd87 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin=
 2011-01-25  18  static void byteblaster_write(int port, int data)
fa766c9be58bd87 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin=
 2011-01-25  19  {
fa766c9be58bd87 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin=
 2011-01-25 @20  	outb((u8)data, (u16)(port + 0x378));
fa766c9be58bd87 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin=
 2011-01-25  21  };
fa766c9be58bd87 drivers/staging/altera-stapl/altera-lpt.c Igor M. Liplianin=
 2011-01-25  22  =


:::::: The code at line 20 was first introduced by commit
:::::: fa766c9be58bd872784b081074a7d15a3ce61c5f [media] Altera FPGA firmwar=
e download module

:::::: TO: Igor M. Liplianin <liplianin@me.by>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7613771395087252746==--

