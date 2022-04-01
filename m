Content-Type: multipart/mixed; boundary="===============4785652594206143118=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/tpm/tpm_atmel.h:96 tpm_read_index() warn: ignoring unreachable code.
Date: Fri, 01 Apr 2022 08:02:41 +0800
Message-ID: <202204010708.094lOETN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4785652594206143118==
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
head:   e729dbe8ea1c6145ae7b9efd6a00a5613746d3b0
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: parisc-randconfig-m031-20220330 (https://download.01.org/0day-ci/ar=
chive/20220401/202204010708.094lOETN-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/char/tpm/tpm_atmel.h:96 tpm_read_index() warn: ignoring unreachable=
 code.
drivers/comedi/drivers/das16.c:894 das16_do_insn_bits() warn: ignoring unre=
achable code.
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
drivers/comedi/drivers/dt2811.c:209 dt2811_interrupt() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2811.c:237 dt2811_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2811.c:248 dt2811_ai_set_chanspec() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/dt2811.c:531 dt2811_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2814.c:214 dt2814_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2814.c:235 dt2814_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2814.c:295 dt2814_interrupt() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2801.c:328 dt2801_writecmd() warn: ignoring unreac=
hable code.
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
drivers/comedi/drivers/s526.c:507 s526_dio_insn_bits() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/s526.c:545 s526_dio_insn_config() warn: ignoring unr=
eachable code.

Old smatch warnings:
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
drivers/comedi/drivers/dt2811.c:296 dt2811_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2811.c:506 dt2811_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/dt2811.c:541 dt2811_reset() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/dt2814.c:112 dt2814_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt2814.c:313 dt2814_attach() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt2801.c:273 dt2801_writedata() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt2801.c:344 dt2801_reset() warn: ignoring unreachab=
le code.
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

vim +96 drivers/char/tpm/tpm_atmel.h

ad5ea3cc5f745a Kylene Jo Hall  2005-11-13  93  =

1d1915532b3fb0 Jarkko Sakkinen 2017-01-25  94  static inline int tpm_read_i=
ndex(int base, int index)
1d1915532b3fb0 Jarkko Sakkinen 2017-01-25  95  {
1d1915532b3fb0 Jarkko Sakkinen 2017-01-25 @96  	outb(index, base);
1d1915532b3fb0 Jarkko Sakkinen 2017-01-25  97  	return inb(base+1) & 0xFF;
1d1915532b3fb0 Jarkko Sakkinen 2017-01-25  98  }
1d1915532b3fb0 Jarkko Sakkinen 2017-01-25  99  =


:::::: The code at line 96 was first introduced by commit
:::::: 1d1915532b3fb0d08aed8b2d8af1c6ea40846782 tpm: remove tpm_read_index =
and tpm_write_index from tpm.h

:::::: TO: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4785652594206143118==--

