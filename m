Content-Type: multipart/mixed; boundary="===============1978043380807206008=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_pdc2027x.c:521:2: warning: Value stored to 'pll_ctl' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 13 Apr 2022 07:07:43 +0800
Message-ID: <202204130658.3r2GuAb7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1978043380807206008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: b5a5fc8b0f8175e4b3aaf182c1b23de4ccdd3347 ata: pata_pdc2027x: Replac=
e PDPRINTK() with standard ata logging
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220411 (https://download.01.org/0day-ci/arc=
hive/20220413/202204130658.3r2GuAb7-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db5a5fc8b0f8175e4b3aaf182c1b23de4ccdd3347
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b5a5fc8b0f8175e4b3aaf182c1b23de4ccdd3347
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           for (i =3D 0; i < rc_map->len; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:388:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < rc_map->len; i++) {
           ^
   drivers/media/rc/rc-main.c:389:32: note: The left operand of '=3D=3D' is=
 a garbage value
                   if (rc_map->scan[i].scancode =3D=3D scancode)
                       ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/regulator/core.c:1109:2: warning: Value stored to 'count' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:1109:2: note: Value stored to 'count' is never =
read
           count +=3D scnprintf(buf + count, len - count, ", %s",
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/core.c:3792:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   drivers/regulator/core.c:3792:3: note: Value stored to 'possible_uV' is =
never read
                   possible_uV =3D desired_min_uV;
                   ^             ~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/input/misc/atmel_captouch.c:68:8: warning: Excessive padding in =
'struct atmel_captouch_device' (75 padding bytes, where 11 is optimal). =

   Optimal fields order: =

   xfer_buf, =

   client, =

   input, =

   num_btn, =

   keycodes, =

   prev_btn, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/misc/atmel_captouch.c:68:8: note: Excessive padding in 'st=
ruct atmel_captouch_device' (75 padding bytes, where 11 is optimal). Optima=
l fields order: xfer_buf, client, input, num_btn, keycodes, prev_btn, consi=
der reordering the fields or adding explicit padding members
   struct atmel_captouch_device {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/ata/pata_pdc2027x.c:521:2: warning: Value stored to 'pll_ctl' is=
 never read [clang-analyzer-deadcode.DeadStores]
           pll_ctl =3D ioread16(mmio_base + PDC_PLL_CTL);
           ^
   drivers/ata/pata_pdc2027x.c:521:2: note: Value stored to 'pll_ctl' is ne=
ver read
   drivers/ata/pata_pdc2027x.c:570:2: warning: Value stored to 'pll_ctl' is=
 never read [clang-analyzer-deadcode.DeadStores]
           pll_ctl =3D ioread16(mmio_base + PDC_PLL_CTL);
           ^
   drivers/ata/pata_pdc2027x.c:570:2: note: Value stored to 'pll_ctl' is ne=
ver read
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/i2c/busses/i2c-rk3x.c:504:9: warning: Access to field 'flags' re=
sults in a dereference of a null pointer (loaded from field 'msg') [clang-a=
nalyzer-core.NullDereference]
                   if (!(i2c->msg->flags & I2C_M_IGNORE_NAK))
                         ^
   drivers/i2c/busses/i2c-rk3x.c:1140:9: note: Calling 'rk3x_i2c_xfer_commo=
n'
           return rk3x_i2c_xfer_common(adap, msgs, num, true);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-rk3x.c:1066:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&i2c->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:237:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/i2c/busses/i2c-rk3x.c:1066:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&i2c->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:237:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/i2c/busses/i2c-rk3x.c:1066:2: note: Loop condition is false.  Ex=
iting loop
           spin_lock_irqsave(&i2c->lock, flags);
           ^

vim +/pll_ctl +521 drivers/ata/pata_pdc2027x.c

669a5db411d85a1 Jeff Garzik     2006-08-29  492  =

669a5db411d85a1 Jeff Garzik     2006-08-29  493  /**
1906cf27fcc0707 Lee Jones       2021-02-01  494   * pdc_adjust_pll - Adjust=
 the PLL input clock in Hz.
669a5db411d85a1 Jeff Garzik     2006-08-29  495   *
5d728824efeda61 Tejun Heo       2007-04-17  496   * @host: target ATA host
669a5db411d85a1 Jeff Garzik     2006-08-29  497   * @pll_clock: The input o=
f PLL in HZ
1906cf27fcc0707 Lee Jones       2021-02-01  498   * @board_idx: board ident=
ifier
669a5db411d85a1 Jeff Garzik     2006-08-29  499   */
5d728824efeda61 Tejun Heo       2007-04-17  500  static void pdc_adjust_pll=
(struct ata_host *host, long pll_clock, unsigned int board_idx)
669a5db411d85a1 Jeff Garzik     2006-08-29  501  {
5d728824efeda61 Tejun Heo       2007-04-17  502  	void __iomem *mmio_base =
=3D host->iomap[PDC_MMIO_BAR];
669a5db411d85a1 Jeff Garzik     2006-08-29  503  	u16 pll_ctl;
669a5db411d85a1 Jeff Garzik     2006-08-29  504  	long pll_clock_khz =3D pl=
l_clock / 1000;
669a5db411d85a1 Jeff Garzik     2006-08-29  505  	long pout_required =3D bo=
ard_idx? PDC_133_MHZ:PDC_100_MHZ;
669a5db411d85a1 Jeff Garzik     2006-08-29  506  	long ratio =3D pout_requi=
red / pll_clock_khz;
669a5db411d85a1 Jeff Garzik     2006-08-29  507  	int F, R;
669a5db411d85a1 Jeff Garzik     2006-08-29  508  =

669a5db411d85a1 Jeff Garzik     2006-08-29  509  	/* Sanity check */
669a5db411d85a1 Jeff Garzik     2006-08-29  510  	if (unlikely(pll_clock_kh=
z < 5000L || pll_clock_khz > 70000L)) {
b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  511  		dev_err(host->dev, "Inva=
lid PLL input clock %ldkHz, give up!\n",
b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  512  			pll_clock_khz);
669a5db411d85a1 Jeff Garzik     2006-08-29  513  		return;
669a5db411d85a1 Jeff Garzik     2006-08-29  514  	}
669a5db411d85a1 Jeff Garzik     2006-08-29  515  =

b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  516  	dev_dbg(host->dev, "pout_=
required is %ld\n", pout_required);
669a5db411d85a1 Jeff Garzik     2006-08-29  517  =

669a5db411d85a1 Jeff Garzik     2006-08-29  518  	/* Show the current clock=
 value of PLL control register
669a5db411d85a1 Jeff Garzik     2006-08-29  519  	 * (maybe already configu=
red by the firmware)
669a5db411d85a1 Jeff Garzik     2006-08-29  520  	 */
d2a84f47899d1ef Alan Cox        2007-09-20 @521  	pll_ctl =3D ioread16(mmio=
_base + PDC_PLL_CTL);
669a5db411d85a1 Jeff Garzik     2006-08-29  522  =

b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  523  	dev_dbg(host->dev, "pll_c=
tl[%X]\n", pll_ctl);
669a5db411d85a1 Jeff Garzik     2006-08-29  524  =

669a5db411d85a1 Jeff Garzik     2006-08-29  525  	/*
669a5db411d85a1 Jeff Garzik     2006-08-29  526  	 * Calculate the ratio of=
 F, R and OD
669a5db411d85a1 Jeff Garzik     2006-08-29  527  	 * POUT =3D (F + 2) / (( =
R + 2) * NO)
669a5db411d85a1 Jeff Garzik     2006-08-29  528  	 */
669a5db411d85a1 Jeff Garzik     2006-08-29  529  	if (ratio < 8600L) { /* 8=
.6x */
669a5db411d85a1 Jeff Garzik     2006-08-29  530  		/* Using NO =3D 0x01, R =
=3D 0x0D */
669a5db411d85a1 Jeff Garzik     2006-08-29  531  		R =3D 0x0d;
669a5db411d85a1 Jeff Garzik     2006-08-29  532  	} else if (ratio < 12900L=
) { /* 12.9x */
669a5db411d85a1 Jeff Garzik     2006-08-29  533  		/* Using NO =3D 0x01, R =
=3D 0x08 */
669a5db411d85a1 Jeff Garzik     2006-08-29  534  		R =3D 0x08;
669a5db411d85a1 Jeff Garzik     2006-08-29  535  	} else if (ratio < 16100L=
) { /* 16.1x */
669a5db411d85a1 Jeff Garzik     2006-08-29  536  		/* Using NO =3D 0x01, R =
=3D 0x06 */
669a5db411d85a1 Jeff Garzik     2006-08-29  537  		R =3D 0x06;
669a5db411d85a1 Jeff Garzik     2006-08-29  538  	} else if (ratio < 64000L=
) { /* 64x */
669a5db411d85a1 Jeff Garzik     2006-08-29  539  		R =3D 0x00;
669a5db411d85a1 Jeff Garzik     2006-08-29  540  	} else {
669a5db411d85a1 Jeff Garzik     2006-08-29  541  		/* Invalid ratio */
b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  542  		dev_err(host->dev, "Inva=
lid ratio %ld, give up!\n", ratio);
669a5db411d85a1 Jeff Garzik     2006-08-29  543  		return;
669a5db411d85a1 Jeff Garzik     2006-08-29  544  	}
669a5db411d85a1 Jeff Garzik     2006-08-29  545  =

669a5db411d85a1 Jeff Garzik     2006-08-29  546  	F =3D (ratio * (R+2)) / 1=
000 - 2;
669a5db411d85a1 Jeff Garzik     2006-08-29  547  =

669a5db411d85a1 Jeff Garzik     2006-08-29  548  	if (unlikely(F < 0 || F >=
 127)) {
669a5db411d85a1 Jeff Garzik     2006-08-29  549  		/* Invalid F */
b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  550  		dev_err(host->dev, "F[%d=
] invalid!\n", F);
669a5db411d85a1 Jeff Garzik     2006-08-29  551  		return;
669a5db411d85a1 Jeff Garzik     2006-08-29  552  	}
669a5db411d85a1 Jeff Garzik     2006-08-29  553  =

b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  554  	dev_dbg(host->dev, "F[%d]=
 R[%d] ratio*1000[%ld]\n", F, R, ratio);
669a5db411d85a1 Jeff Garzik     2006-08-29  555  =

669a5db411d85a1 Jeff Garzik     2006-08-29  556  	pll_ctl =3D (R << 8) | F;
669a5db411d85a1 Jeff Garzik     2006-08-29  557  =

b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  558  	dev_dbg(host->dev, "Writi=
ng pll_ctl[%X]\n", pll_ctl);
669a5db411d85a1 Jeff Garzik     2006-08-29  559  =

d2a84f47899d1ef Alan Cox        2007-09-20  560  	iowrite16(pll_ctl, mmio_b=
ase + PDC_PLL_CTL);
d2a84f47899d1ef Alan Cox        2007-09-20  561  	ioread16(mmio_base + PDC_=
PLL_CTL); /* flush */
669a5db411d85a1 Jeff Garzik     2006-08-29  562  =

669a5db411d85a1 Jeff Garzik     2006-08-29  563  	/* Wait the PLL circuit t=
o be stable */
b3506c7ed216dd2 Jia-Ju Bai      2018-01-25  564  	msleep(30);
669a5db411d85a1 Jeff Garzik     2006-08-29  565  =

669a5db411d85a1 Jeff Garzik     2006-08-29  566  	/*
669a5db411d85a1 Jeff Garzik     2006-08-29  567  	 *  Show the current cloc=
k value of PLL control register
669a5db411d85a1 Jeff Garzik     2006-08-29  568  	 * (maybe configured by t=
he firmware)
669a5db411d85a1 Jeff Garzik     2006-08-29  569  	 */
d2a84f47899d1ef Alan Cox        2007-09-20  570  	pll_ctl =3D ioread16(mmio=
_base + PDC_PLL_CTL);
669a5db411d85a1 Jeff Garzik     2006-08-29  571  =

b5a5fc8b0f8175e Hannes Reinecke 2021-12-21  572  	dev_dbg(host->dev, "pll_c=
tl[%X]\n", pll_ctl);
669a5db411d85a1 Jeff Garzik     2006-08-29  573  =

669a5db411d85a1 Jeff Garzik     2006-08-29  574  	return;
669a5db411d85a1 Jeff Garzik     2006-08-29  575  }
669a5db411d85a1 Jeff Garzik     2006-08-29  576  =


:::::: The code at line 521 was first introduced by commit
:::::: d2a84f47899d1efc24fa610696f7b793692279c7 pdc2027x: Switch properly t=
o ioread/iowrite

:::::: TO: Alan Cox <alan@lxorguk.ukuu.org.uk>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1978043380807206008==--

