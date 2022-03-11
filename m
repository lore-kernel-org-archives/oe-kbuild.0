Content-Type: multipart/mixed; boundary="===============8270900583936427296=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/rc/ite-cir.c:573 it87_put_tx_byte() warn: ignoring unreachable code.
Date: Sat, 12 Mar 2022 05:50:51 +0800
Message-ID: <202203120553.VhRztBZJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8270900583936427296==
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
head:   79b00034e9dcd2b065c1665c8b42f62b6b80a9be
commit: 6968e707d371ef80511448c6771daf445b4a5cf5 parisc: io: Improve the ou=
tb(), outw() and outl() macros
date:   9 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 weeks ago
config: parisc-randconfig-m031-20220304 (https://download.01.org/0day-ci/ar=
chive/20220312/202203120553.VhRztBZJ-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/media/rc/ite-cir.c:573 it87_put_tx_byte() warn: ignoring unreachabl=
e code.
drivers/media/rc/ite-cir.c:625 it87_disable_tx_interrupt() warn: ignoring u=
nreachable code.
drivers/media/rc/ite-cir.c:634 it87_enable_tx_interrupt() warn: ignoring un=
reachable code.
drivers/media/rc/ite-cir.c:776 it8708_put_tx_byte() warn: ignoring unreacha=
ble code.
drivers/media/rc/ite-cir.c:830 it8708_disable_tx_interrupt() warn: ignoring=
 unreachable code.
drivers/media/rc/ite-cir.c:839 it8708_enable_tx_interrupt() warn: ignoring =
unreachable code.
drivers/media/rc/ite-cir.c:909 it8709_rm() warn: ignoring unreachable code.
drivers/media/rc/fintek-cir.c:65 fintek_config_mode_disable() warn: ignorin=
g unreachable code.
drivers/media/rc/fintek-cir.c:80 fintek_cir_reg_write() warn: ignoring unre=
achable code.
drivers/media/rc/nuvoton-cir.c:66 nvt_cr_read() warn: ignoring unreachable =
code.
drivers/media/rc/nuvoton-cir.c:142 nvt_cir_wake_reg_write() warn: ignoring =
unreachable code.
drivers/media/rc/nuvoton-cir.c:129 nvt_cir_reg_write() warn: ignoring unrea=
chable code.
drivers/hwmon/dme1737.c:2017 dme1737_sio_enter() warn: ignoring unreachable=
 code.
drivers/hwmon/dme1737.c:2027 dme1737_sio_inb() warn: ignoring unreachable c=
ode.
drivers/hwmon/dme1737.c:2022 dme1737_sio_exit() warn: ignoring unreachable =
code.
drivers/hwmon/f71882fg.c:1106 superio_inb() warn: ignoring unreachable code.
drivers/hwmon/f71805f.c:295 f71805f_read8() warn: ignoring unreachable code.
drivers/hwmon/f71805f.c:64 superio_inb() warn: ignoring unreachable code.
drivers/comedi/drivers/das08.c:296 das08jr_do_insn_bits() warn: ignoring un=
reachable code.
drivers/media/rc/serial_ir.c:157 soutp() warn: ignoring unreachable code.
drivers/media/rc/serial_ir.c:406 hardware_init_port() warn: ignoring unreac=
hable code.
drivers/hwmon/it87.c:672 it87_read_value() warn: ignoring unreachable code.
drivers/hwmon/it87.c:88 superio_inb() warn: ignoring unreachable code.
drivers/i2c/busses/i2c-ocores.c:141 oc_setreg_io_8() warn: ignoring unreach=
able code.
drivers/comedi/drivers/ni_daq_700.c:85 daq700_dio_insn_bits() warn: ignorin=
g unreachable code.
drivers/hwmon/nct6683.c:86 superio_inb() warn: ignoring unreachable code.
drivers/hwmon/pc87427.c:561 update_pwm_enable() warn: ignoring unreachable =
code.
drivers/hwmon/pc87427.c:648 pwm_store() warn: ignoring unreachable code.
drivers/hwmon/pc87427.c:153 pc87427_read8_bank() warn: ignoring unreachable=
 code.
drivers/hwmon/pc87427.c:116 superio_inb() warn: ignoring unreachable code.
drivers/hwmon/w83627ehf.c:104 superio_inb() warn: ignoring unreachable code.
drivers/hwmon/smsc47b397.c:67 superio_enter() warn: ignoring unreachable co=
de.
drivers/hwmon/smsc47b397.c:52 superio_inb() warn: ignoring unreachable code.
drivers/hwmon/nct6775.c:249 superio_inb() warn: ignoring unreachable code.
drivers/comedi/drivers/comedi_8254.c:164 __i8254_write() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/pcl730.c:223 pcl730_do_insn_bits() warn: ignoring un=
reachable code.
drivers/parport/parport_pc.c:117 frob_econtrol() warn: ignoring unreachable=
 code.
include/linux/parport_pc.h:68 parport_pc_write_data() warn: ignoring unreac=
hable code.
drivers/net/arcnet/com90io.c:315 com90io_command() warn: ignoring unreachab=
le code.
drivers/net/arcnet/com90io.c:329 com90io_setmask() warn: ignoring unreachab=
le code.
drivers/net/arcnet/com90xx.c:566 com90xx_command() warn: ignoring unreachab=
le code.
drivers/net/arcnet/com90xx.c:580 com90xx_setmask() warn: ignoring unreachab=
le code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1319 set_addresses() warn: ignorin=
g unreachable code.
drivers/net/can/cc770/cc770_isa.c:131 cc770_isa_port_write_reg() warn: igno=
ring unreachable code.
drivers/char/pcmcia/synclink_cs.c:340 irq_disable() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:350 irq_enable() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:699 issue_command() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:1122 dsr_change() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:1137 ri_change() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:3551 tx_set_idle() warn: ignoring unreach=
able code.
drivers/comedi/drivers/pcl816.c:148 pcl816_ai_set_chan_scan() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/pcl816.c:177 pcl816_ai_clear_eoc() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl816.c:183 pcl816_ai_soft_trig() warn: ignoring un=
reachable code.
drivers/char/ipmi/ipmi_si_port_io.c:18 port_outb() warn: ignoring unreachab=
le code.
drivers/char/ipmi/ipmi_si_port_io.c:33 port_outw() warn: ignoring unreachab=
le code.
drivers/char/ipmi/ipmi_si_port_io.c:48 port_outl() warn: ignoring unreachab=
le code.
drivers/net/ethernet/8390/axnet_cs.c:324 axnet_config() warn: ignoring unre=
achable code.
drivers/net/ethernet/8390/axnet_cs.c:1440 ei_receive() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/pcm3724.c:156 enable_chan() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/rti800.c:245 rti800_do_insn_bits() warn: ignoring un=
reachable code.
drivers/net/ethernet/8390/pcnet_cs.c:860 set_misc_reg() warn: ignoring unre=
achable code.
drivers/net/ethernet/8390/pcnet_cs.c:1066 ei_watchdog() warn: ignoring unre=
achable code.
drivers/net/ethernet/8390/pcnet_cs.c:1251 dma_block_output() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/das16m1.c:304 das16m1_ai_cancel() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/das16m1.c:367 das16m1_do_insn_bits() warn: ignoring =
unreachable code.
drivers/comedi/drivers/das16.c:894 das16_do_insn_bits() warn: ignoring unre=
achable code.
drivers/comedi/drivers/das800.c:228 das800_ind_read() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/das800.c:241 das800_enable() warn: ignoring unreacha=
ble code.
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
drivers/comedi/drivers/dt282x.c:939 dt282x_dio_insn_bits() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/dt282x.c:971 dt282x_dio_insn_config() warn: ignoring=
 unreachable code.
drivers/comedi/drivers/dmm32at.c:399 dmm32at_ai_cancel() warn: ignoring unr=
eachable code.
drivers/comedi/drivers/dmm32at.c:434 dmm32at_isr() warn: ignoring unreachab=
le code.
drivers/comedi/drivers/aio_iiro_16.c:81 aio_iiro_enable_irq() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/c6xdigio.c:66 c6xdigio_write_data() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_atmio16d.c:534 atmio16d_dio_insn_bits() warn: ign=
oring unreachable code.
drivers/comedi/drivers/ni_atmio16d.c:565 atmio16d_dio_insn_config() warn: i=
gnoring unreachable code.
drivers/comedi/drivers/ni_at_a2150.c:217 a2150_interrupt() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/ni_at_a2150.c:767 a2150_detach() warn: ignoring unre=
achable code.
drivers/comedi/drivers/cb_das16_cs.c:250 das16cs_dio_insn_bits() warn: igno=
ring unreachable code.
drivers/comedi/drivers/cb_das16_cs.c:284 das16cs_dio_insn_config() warn: ig=
noring unreachable code.
drivers/comedi/drivers/cb_das16_cs.c:308 das16cs_counter_insn_config() warn=
: ignoring unreachable code.

Old smatch warnings:
drivers/media/rc/ite-cir.c:536 it87_set_carrier_params() warn: ignoring unr=
eachable code.
drivers/media/rc/ite-cir.c:581 it87_idle_rx() warn: ignoring unreachable co=
de.
drivers/media/rc/ite-cir.c:593 it87_disable_rx() warn: ignoring unreachable=
 code.
drivers/media/rc/ite-cir.c:609 it87_enable_rx() warn: ignoring unreachable =
code.
drivers/media/rc/ite-cir.c:642 it87_disable() warn: ignoring unreachable co=
de.
drivers/media/rc/ite-cir.c:659 it87_init_hardware() warn: ignoring unreacha=
ble code.
drivers/media/rc/ite-cir.c:715 it8708_set_carrier_params() warn: ignoring u=
nreachable code.
drivers/media/rc/ite-cir.c:784 it8708_idle_rx() warn: ignoring unreachable =
code.
drivers/media/rc/ite-cir.c:796 it8708_disable_rx() warn: ignoring unreachab=
le code.
drivers/media/rc/ite-cir.c:813 it8708_enable_rx() warn: ignoring unreachabl=
e code.
drivers/media/rc/ite-cir.c:848 it8708_disable() warn: ignoring unreachable =
code.
drivers/media/rc/ite-cir.c:864 it8708_init_hardware() warn: ignoring unreac=
hable code.
drivers/media/rc/ite-cir.c:916 it8709_wm() warn: ignoring unreachable code.
drivers/media/rc/fintek-cir.c:58 fintek_config_mode_enable() warn: ignoring=
 unreachable code.
drivers/media/rc/fintek-cir.c:30 fintek_cr_write() warn: ignoring unreachab=
le code.
drivers/media/rc/fintek-cir.c:39 fintek_cr_read() warn: ignoring unreachabl=
e code.
drivers/media/rc/nuvoton-cir.c:59 nvt_cr_write() warn: ignoring unreachable=
 code.
drivers/media/rc/nuvoton-cir.c:84 nvt_efm_enable() warn: ignoring unreachab=
le code.
drivers/media/rc/nuvoton-cir.c:93 nvt_efm_disable() warn: ignoring unreacha=
ble code.
drivers/hwmon/dme1737.c:566 dme1737_read() warn: ignoring unreachable code.
drivers/hwmon/dme1737.c:587 dme1737_write() warn: ignoring unreachable code.
drivers/hwmon/dme1737.c:2033 dme1737_sio_outb() warn: ignoring unreachable =
code.
drivers/hwmon/f71882fg.c:1159 f71882fg_read8() warn: ignoring unreachable c=
ode.
drivers/hwmon/f71882fg.c:1177 f71882fg_write8() warn: ignoring unreachable =
code.
drivers/hwmon/f71882fg.c:1127 superio_enter() warn: ignoring unreachable co=
de.
drivers/hwmon/f71882fg.c:1135 superio_select() warn: ignoring unreachable c=
ode.
drivers/hwmon/f71882fg.c:1141 superio_exit() warn: ignoring unreachable cod=
e.
drivers/hwmon/f71805f.c:72 superio_inw() warn: ignoring unreachable code.
drivers/hwmon/f71805f.c:302 f71805f_write8() warn: ignoring unreachable cod=
e.
drivers/hwmon/f71805f.c:315 f71805f_read16() warn: ignoring unreachable cod=
e.
drivers/hwmon/f71805f.c:326 f71805f_write16() warn: ignoring unreachable co=
de.
drivers/hwmon/f71805f.c:92 superio_enter() warn: ignoring unreachable code.
drivers/hwmon/f71805f.c:82 superio_select() warn: ignoring unreachable code.
drivers/hwmon/f71805f.c:101 superio_exit() warn: ignoring unreachable code.
drivers/comedi/drivers/das08.c:192 das08_ai_insn_read() warn: ignoring unre=
achable code.
drivers/comedi/drivers/das08.c:272 das08_do_insn_bits() warn: ignoring unre=
achable code.
drivers/comedi/drivers/das08.c:313 das08_ao_set_data() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das08.c:318 das08_ao_set_data() warn: ignoring unrea=
chable code.
drivers/hwmon/it87.c:102 superio_inw() warn: ignoring unreachable code.
drivers/hwmon/it87.c:683 it87_write_value() warn: ignoring unreachable code.
drivers/hwmon/it87.c:123 superio_enter() warn: ignoring unreachable code.
drivers/hwmon/it87.c:111 superio_select() warn: ignoring unreachable code.
drivers/hwmon/it87.c:94 superio_outb() warn: ignoring unreachable code.
drivers/hwmon/it87.c:132 superio_exit() warn: ignoring unreachable code.
drivers/comedi/drivers/ni_daq_700.c:149 daq700_ai_rinsn() warn: ignoring un=
reachable code.
drivers/comedi/drivers/ni_daq_700.c:200 daq700_ai_config() warn: ignoring u=
nreachable code.
drivers/hwmon/nct6683.c:500 nct6683_read() warn: ignoring unreachable code.
drivers/hwmon/nct6683.c:514 nct6683_write() warn: ignoring unreachable code.
drivers/hwmon/nct6683.c:106 superio_enter() warn: ignoring unreachable code.
drivers/hwmon/nct6683.c:93 superio_select() warn: ignoring unreachable code.
drivers/hwmon/nct6683.c:115 superio_exit() warn: ignoring unreachable code.
drivers/hwmon/nct6683.c:79 superio_outb() warn: ignoring unreachable code.
drivers/hwmon/pc87427.c:188 pc87427_readall_fan() warn: ignoring unreachabl=
e code.
drivers/hwmon/pc87427.c:243 pc87427_readall_pwm() warn: ignoring unreachabl=
e code.
drivers/hwmon/pc87427.c:307 pc87427_readall_temp() warn: ignoring unreachab=
le code.
drivers/hwmon/pc87427.c:438 fan_min_store() warn: ignoring unreachable code.
drivers/hwmon/pc87427.c:161 pc87427_write8_bank() warn: ignoring unreachabl=
e code.
drivers/hwmon/pc87427.c:110 superio_outb() warn: ignoring unreachable code.
drivers/hwmon/pc87427.c:122 superio_exit() warn: ignoring unreachable code.
drivers/hwmon/w83627ehf.c:409 w83627ehf_read_value() warn: ignoring unreach=
able code.
drivers/hwmon/w83627ehf.c:396 w83627ehf_set_bank() warn: ignoring unreachab=
le code.
drivers/hwmon/w83627ehf.c:429 w83627ehf_write_value() warn: ignoring unreac=
hable code.
drivers/hwmon/w83627ehf.c:121 superio_enter() warn: ignoring unreachable co=
de.
drivers/hwmon/w83627ehf.c:111 superio_select() warn: ignoring unreachable c=
ode.
drivers/hwmon/w83627ehf.c:97 superio_outb() warn: ignoring unreachable code.
drivers/hwmon/w83627ehf.c:130 superio_exit() warn: ignoring unreachable cod=
e.
drivers/hwmon/smsc47b397.c:111 smsc47b397_read_value() warn: ignoring unrea=
chable code.
drivers/hwmon/smsc47b397.c:73 superio_exit() warn: ignoring unreachable cod=
e.
drivers/hwmon/smsc47b397.c:46 superio_outb() warn: ignoring unreachable cod=
e.
drivers/hwmon/nct6775.c:241 superio_outb() warn: ignoring unreachable code.
drivers/hwmon/nct6775.c:257 superio_select() warn: ignoring unreachable cod=
e.
drivers/hwmon/nct6775.c:271 superio_enter() warn: ignoring unreachable code.
drivers/hwmon/nct6775.c:281 superio_exit() warn: ignoring unreachable code.
drivers/hwmon/nct6775.c:1586 nct6775_read_value() warn: ignoring unreachabl=
e code.
drivers/hwmon/nct6775.c:1575 nct6775_set_bank() warn: ignoring unreachable =
code.
drivers/hwmon/nct6775.c:1601 nct6775_write_value() warn: ignoring unreachab=
le code.
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
drivers/parport/parport_pc.c:211 clear_epp_timeout() warn: ignoring unreach=
able code.
drivers/parport/parport_pc.c:252 parport_pc_restore_state() warn: ignoring =
unreachable code.
drivers/parport/parport_pc.c:554 parport_pc_fifo_write_block_pio() warn: ig=
noring unreachable code.
include/linux/parport_pc.h:141 __parport_pc_frob_control() warn: ignoring u=
nreachable code.
drivers/parport/parport_pc.c:755 parport_pc_compat_write_block_pio() warn: =
ignoring unreachable code.
drivers/parport/parport_pc.c:1411 parport_SPP_supported() warn: ignoring un=
reachable code.
drivers/parport/parport_pc.c:1482 parport_ECR_present() warn: ignoring unre=
achable code.
drivers/parport/parport_pc.c:1865 irq_probe_ECP() warn: ignoring unreachabl=
e code.
drivers/parport/parport_pc.c:2261 parport_pc_unregister_port() warn: consid=
er using resource_size() here
drivers/net/arcnet/com90io.c:75 get_buffer_byte() warn: ignoring unreachabl=
e code.
drivers/net/arcnet/com90io.c:100 get_whole_buffer() warn: ignoring unreacha=
ble code.
drivers/net/arcnet/com90io.c:116 put_whole_buffer() warn: ignoring unreacha=
ble code.
drivers/net/arcnet/com90io.c:149 com90io_probe() warn: impossible condition=
 '(inb(ioaddr + 1 * (0)) =3D=3D 255) =3D> ((-128)-127 =3D=3D 255)'
drivers/net/arcnet/com90io.c:166 com90io_probe() warn: ignoring unreachable=
 code.
drivers/net/arcnet/com90io.c:251 com90io_found() warn: ignoring unreachable=
 code.
drivers/net/arcnet/com90io.c:284 com90io_reset() warn: argument 4 to %02X s=
pecifier has type 'char'
drivers/net/arcnet/com90io.c:294 com90io_reset() warn: ignoring unreachable=
 code.
drivers/net/arcnet/com90io.c:417 com90io_exit() warn: ignoring unreachable =
code.
drivers/net/arcnet/com90xx.c:161 com90xx_probe() warn: impossible condition=
 '(inb(ioaddr + 1 * (0)) =3D=3D 255) =3D> ((-128)-127 =3D=3D 255)'
drivers/net/arcnet/com90xx.c:324 com90xx_probe() warn: ignoring unreachable=
 code.
drivers/net/arcnet/com90xx.c:595 com90xx_reset() warn: argument 3 to %02X s=
pecifier has type 'char'
drivers/net/arcnet/com90xx.c:604 com90xx_reset() warn: ignoring unreachable=
 code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:356 mii_idle() warn: ignoring unre=
achable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:370 mii_putbit() warn: ignoring un=
reachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:375 mii_putbit() warn: ignoring un=
reachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:403 mii_getbit() warn: ignoring un=
reachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:425 mii_rd() warn: ignoring unreac=
hable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:447 mii_wr() warn: ignoring unreac=
hable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:987 xirc2ps_interrupt() warn: igno=
ring unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1005 xirc2ps_interrupt() warn: ign=
oring unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1176 xirc2ps_interrupt() warn: ign=
oring unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1194 xirc2ps_tx_timeout_task() war=
n: inconsistent indenting
drivers/net/ethernet/xircom/xirc2ps_cs.c:1236 do_start_xmit() warn: ignorin=
g unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1279 set_address() warn: ignoring =
unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1282 set_address() warn: ignoring =
unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1284 set_address() warn: ignoring =
unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1334 set_multicast_list() warn: ig=
noring unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1452 hardreset() warn: ignoring un=
reachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1473 do_reset() warn: ignoring unr=
eachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1678 init_mii() warn: ignoring unr=
eachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1702 do_powerdown() warn: ignoring=
 unreachable code.
drivers/net/ethernet/xircom/xirc2ps_cs.c:1721 do_stop() warn: ignoring unre=
achable code.
drivers/net/can/cc770/cc770_isa.c:142 cc770_isa_port_read_reg_indirect() wa=
rn: ignoring unreachable code.
drivers/net/can/cc770/cc770_isa.c:156 cc770_isa_port_write_reg_indirect() w=
arn: ignoring unreachable code.
drivers/char/pcmcia/synclink_cs.c:343 irq_disable() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:353 irq_enable() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:1023 tx_ready() warn: ignoring unreachabl=
e code.
drivers/char/pcmcia/synclink_cs.c:1025 tx_ready() warn: ignoring unreachabl=
e code.
drivers/char/pcmcia/synclink_cs.c:1388 mgslpc_program_hw() warn: ignoring u=
nreachable code.
drivers/char/pcmcia/synclink_cs.c:1873 set_interface() warn: ignoring unrea=
chable code.
drivers/char/pcmcia/synclink_cs.c:2176 mgslpc_break() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:2178 mgslpc_break() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:2490 mgslpc_open() error: we previously a=
ssumed 'info' could be null (see line 2476)
drivers/char/pcmcia/synclink_cs.c:2885 mgslpc_set_rate() warn: ignoring unr=
eachable code.
drivers/char/pcmcia/synclink_cs.c:2916 enable_auxclk() warn: ignoring unrea=
chable code.
drivers/char/pcmcia/synclink_cs.c:2988 loopback_enable() warn: ignoring unr=
eachable code.
drivers/char/pcmcia/synclink_cs.c:3013 hdlc_mode() warn: ignoring unreachab=
le code.
drivers/char/pcmcia/synclink_cs.c:3252 rx_stop() warn: ignoring unreachable=
 code.
drivers/char/pcmcia/synclink_cs.c:3269 rx_start() warn: ignoring unreachabl=
e code.
drivers/char/pcmcia/synclink_cs.c:3329 reset_device() warn: ignoring unreac=
hable code.
drivers/char/pcmcia/synclink_cs.c:3383 async_mode() warn: ignoring unreacha=
ble code.
drivers/char/pcmcia/synclink_cs.c:3553 tx_set_idle() warn: ignoring unreach=
able code.
drivers/char/pcmcia/synclink_cs.c:3596 set_signals() warn: ignoring unreach=
able code.
drivers/char/pcmcia/synclink_cs.c:3720 register_test() warn: ignoring unrea=
chable code.
drivers/char/pcmcia/synclink_cs.c:3749 irq_test() warn: ignoring unreachabl=
e code.
drivers/comedi/drivers/pcl816.c:140 pcl816_ai_set_chan_range() warn: ignori=
ng unreachable code.
drivers/comedi/drivers/pcl816.c:171 pcl816_ai_setup_chanlist() error: unini=
tialized symbol 'last_chan'.
drivers/comedi/drivers/pcl816.c:443 pcl816_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/pcl816.c:491 pcl816_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/pcl816.c:512 pcl816_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl816.c:550 pcl816_do_insn_bits() warn: ignoring un=
reachable code.
drivers/comedi/drivers/pcl816.c:561 pcl816_reset() warn: ignoring unreachab=
le code.
drivers/net/ethernet/8390/axnet_cs.c:220 get_prom() warn: ignoring unreacha=
ble code.
drivers/net/ethernet/8390/axnet_cs.c:424 mdio_sync() warn: ignoring unreach=
able code.
drivers/net/ethernet/8390/axnet_cs.c:437 mdio_read() warn: ignoring unreach=
able code.
drivers/net/ethernet/8390/axnet_cs.c:456 mdio_write() warn: ignoring unreac=
hable code.
drivers/net/ethernet/8390/axnet_cs.c:479 axnet_open() warn: ignoring unreac=
hable code.
drivers/net/ethernet/8390/axnet_cs.c:526 axnet_reset_8390() warn: ignoring =
unreachable code.
drivers/net/ethernet/8390/axnet_cs.c:635 get_8390_hdr() warn: ignoring unre=
achable code.
drivers/net/ethernet/8390/axnet_cs.c:658 block_input() warn: ignoring unrea=
chable code.
drivers/net/ethernet/8390/axnet_cs.c:685 block_output() warn: ignoring unre=
achable code.
drivers/net/ethernet/8390/axnet_cs.c:976 axnet_start_xmit() warn: ignoring =
unreachable code.
drivers/net/ethernet/8390/axnet_cs.c:1117 ax_interrupt() warn: argument 4 t=
o %#2x specifier has type 'char'
drivers/net/ethernet/8390/axnet_cs.c:1117 ax_interrupt() warn: argument 5 t=
o %#2x specifier has type 'char'
drivers/net/ethernet/8390/axnet_cs.c:1129 ax_interrupt() warn: ignoring unr=
eachable code.
drivers/net/ethernet/8390/axnet_cs.c:1469 ei_rx_overrun() warn: ignoring un=
reachable code.
drivers/net/ethernet/8390/axnet_cs.c:1586 do_set_multicast_list() warn: ign=
oring unreachable code.
drivers/net/ethernet/8390/axnet_cs.c:1640 AX88190_init() warn: ignoring unr=
eachable code.
drivers/net/ethernet/8390/axnet_cs.c:1706 NS8390_trigger_send() warn: ignor=
ing unreachable code.
drivers/comedi/drivers/pcm3724.c:117 do_3724_config() warn: ignoring unreac=
hable code.
drivers/comedi/drivers/rti800.c:142 rti800_ai_eoc() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/rti800.c:163 rti800_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/rti800.c:222 rti800_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/rti800.c:264 rti800_attach() warn: ignoring unreacha=
ble code.
drivers/net/ethernet/8390/pcnet_cs.c:356 get_prom() warn: ignoring unreacha=
ble code.
drivers/net/ethernet/8390/pcnet_cs.c:416 get_ax88190() warn: ignoring unrea=
chable code.
drivers/net/ethernet/8390/pcnet_cs.c:711 mdio_sync() warn: ignoring unreach=
able code.
drivers/net/ethernet/8390/pcnet_cs.c:724 mdio_read() warn: ignoring unreach=
able code.
drivers/net/ethernet/8390/pcnet_cs.c:743 mdio_write() warn: ignoring unreac=
hable code.
drivers/net/ethernet/8390/pcnet_cs.c:775 read_eeprom() warn: ignoring unrea=
chable code.
drivers/net/ethernet/8390/pcnet_cs.c:812 write_asic() warn: ignoring unreac=
hable code.
drivers/net/ethernet/8390/pcnet_cs.c:871 set_misc_reg() warn: ignoring unre=
achable code.
drivers/net/ethernet/8390/pcnet_cs.c:922 pcnet_open() warn: ignoring unreac=
hable code.
drivers/net/ethernet/8390/pcnet_cs.c:970 pcnet_reset_8390() warn: ignoring =
unreachable code.
drivers/net/ethernet/8390/pcnet_cs.c:1148 dma_get_8390_hdr() warn: ignoring=
 unreachable code.
drivers/net/ethernet/8390/pcnet_cs.c:1183 dma_block_input() warn: ignoring =
unreachable code.
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
drivers/comedi/drivers/das800.c:218 das800_ind_write() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das800.c:390 das800_ai_do_cmd() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/das800.c:545 das800_ai_insn_read() warn: ignoring un=
reachable code.
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
drivers/comedi/drivers/dt282x.c:389 dt282x_ns_to_timer() error: uninitializ=
ed symbol 'divider'.
drivers/comedi/drivers/dt282x.c:394 dt282x_ns_to_timer() error: uninitializ=
ed symbol 'base'.
drivers/comedi/drivers/dt282x.c:448 dt282x_ao_dma_interrupt() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/dt282x.c:468 dt282x_ai_dma_interrupt() warn: ignorin=
g unreachable code.
drivers/comedi/drivers/dt282x.c:544 dt282x_load_changain() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/dt282x.c:599 dt282x_ai_insn_read() warn: ignoring un=
reachable code.
drivers/comedi/drivers/dt282x.c:699 dt282x_ai_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt282x.c:757 dt282x_ai_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt282x.c:786 dt282x_ao_insn_write() warn: ignoring u=
nreachable code.
drivers/comedi/drivers/dt282x.c:869 dt282x_ao_inttrig() warn: ignoring unre=
achable code.
drivers/comedi/drivers/dt282x.c:887 dt282x_ao_cmd() warn: ignoring unreacha=
ble code.
drivers/comedi/drivers/dt282x.c:924 dt282x_ao_cancel() warn: ignoring unrea=
chable code.
drivers/comedi/drivers/dt282x.c:1044 dt282x_initialize() warn: ignoring unr=
eachable code.
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
drivers/comedi/drivers/ni_at_a2150.c:230 a2150_cancel() warn: ignoring unre=
achable code.
drivers/comedi/drivers/ni_at_a2150.c:480 a2150_ai_cmd() warn: ignoring unre=
achable code.
drivers/comedi/drivers/ni_at_a2150.c:586 a2150_ai_rinsn() warn: ignoring un=
reachable code.
drivers/comedi/drivers/ni_at_a2150.c:739 a2150_attach() warn: ignoring unre=
achable code.
drivers/comedi/drivers/cb_das16_cs.c:151 das16cs_ai_insn_read() warn: ignor=
ing unreachable code.
drivers/comedi/drivers/cb_das16_cs.c:208 das16cs_ao_insn_write() warn: igno=
ring unreachable code.

vim +573 drivers/media/rc/ite-cir.c

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  569  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  570  /* put a byte to t=
he TX fifo; this should be called with the spinlock held */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  571  static void it87_p=
ut_tx_byte(struct ite_dev *dev, u8 value)
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  572  {
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16 @573  	outb(value, dev->=
cir_addr + IT87_DR);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  574  }
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  575  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  576  /* idle the receiv=
er so that we won't receive samples until another
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  577    pulse is detecte=
d; this must be called with the device spinlock held */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  578  static void it87_i=
dle_rx(struct ite_dev *dev)
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  579  {
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  580  	/* disable stream=
ing by clearing RXACT writing it as 1 */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  581  	outb(inb(dev->cir=
_addr + IT87_RCR) | IT87_RXACT,
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  582  		dev->cir_addr + =
IT87_RCR);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  583  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  584  	/* clear the FIFO=
 */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  585  	outb(inb(dev->cir=
_addr + IT87_TCR1) | IT87_FIFOCLR,
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  586  		dev->cir_addr + =
IT87_TCR1);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  587  }
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  588  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  589  /* disable the rec=
eiver; this must be called with the device spinlock held */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  590  static void it87_d=
isable_rx(struct ite_dev *dev)
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  591  {
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  592  	/* disable the re=
ceiver interrupts */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  593  	outb(inb(dev->cir=
_addr + IT87_IER) & ~(IT87_RDAIE | IT87_RFOIE),
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  594  		dev->cir_addr + =
IT87_IER);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  595  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  596  	/* disable the re=
ceiver */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  597  	outb(inb(dev->cir=
_addr + IT87_RCR) & ~IT87_RXEN,
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  598  		dev->cir_addr + =
IT87_RCR);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  599  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  600  	/* clear the FIFO=
 and RXACT (actually RXACT should have been cleared
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  601  	* in the previous=
 outb() call) */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  602  	it87_idle_rx(dev);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  603  }
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  604  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  605  /* enable the rece=
iver; this must be called with the device spinlock held */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  606  static void it87_e=
nable_rx(struct ite_dev *dev)
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  607  {
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  608  	/* enable the rec=
eiver by setting RXEN */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  609  	outb(inb(dev->cir=
_addr + IT87_RCR) | IT87_RXEN,
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  610  		dev->cir_addr + =
IT87_RCR);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  611  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  612  	/* just prepare i=
t to idle for the next reception */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  613  	it87_idle_rx(dev);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  614  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  615  	/* enable the rec=
eiver interrupts and master enable flag */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  616  	outb(inb(dev->cir=
_addr + IT87_IER) | IT87_RDAIE | IT87_RFOIE | IT87_IEC,
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  617  		dev->cir_addr + =
IT87_IER);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  618  }
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  619  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  620  /* disable the tra=
nsmitter interrupt; this must be called with the device
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  621   * spinlock held */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  622  static void it87_d=
isable_tx_interrupt(struct ite_dev *dev)
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  623  {
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  624  	/* disable the tr=
ansmitter interrupts */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16 @625  	outb(inb(dev->cir=
_addr + IT87_IER) & ~IT87_TLDLIE,
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  626  		dev->cir_addr + =
IT87_IER);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  627  }
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  628  =

620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  629  /* enable the tran=
smitter interrupt; this must be called with the device
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  630   * spinlock held */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  631  static void it87_e=
nable_tx_interrupt(struct ite_dev *dev)
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  632  {
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  633  	/* enable the tra=
nsmitter interrupts and master enable flag */
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16 @634  	outb(inb(dev->cir=
_addr + IT87_IER) | IT87_TLDLIE | IT87_IEC,
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  635  		dev->cir_addr + =
IT87_IER);
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  636  }
620a32bba4a2dd5 Juan J. Garcia de Soria 2011-03-16  637  =


:::::: The code at line 573 was first introduced by commit
:::::: 620a32bba4a2dd57ccf1d5f87b9e6d2402ffec22 [media] rc: New rc-based it=
e-cir driver for several ITE CIRs

:::::: TO: Juan J. Garcia de Soria <skandalfo@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8270900583936427296==--

