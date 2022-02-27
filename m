Content-Type: multipart/mixed; boundary="===============6749831159715782220=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_pdc2027x.c:521:2: warning: Value stored to 'pll_ctl' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 28 Feb 2022 02:39:25 +0800
Message-ID: <202202280247.T92IUv1h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6749831159715782220==
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
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: b5a5fc8b0f8175e4b3aaf182c1b23de4ccdd3347 ata: pata_pdc2027x: Replac=
e PDPRINTK() with standard ata logging
date:   8 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220228/202202280247.T92IUv1h-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
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
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   kernel/events/core.c:10241:29: note: Taking false branch
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   kernel/events/core.c:10241:29: note: Loop condition is false.  Exiting l=
oop
           struct task_struct *task =3D READ_ONCE(event->ctx->task);
                                      ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   kernel/events/core.c:10243:2: note: 'mm' initialized to a null pointer v=
alue
           struct mm_struct *mm =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10251:6: note: Assuming the condition is false
           if (task =3D=3D TASK_TOMBSTONE)
               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10251:2: note: Taking false branch
           if (task =3D=3D TASK_TOMBSTONE)
           ^
   kernel/events/core.c:10254:6: note: Assuming field 'nr_file_filters' is 0
           if (ifh->nr_file_filters) {
               ^~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10254:2: note: Taking false branch
           if (ifh->nr_file_filters) {
           ^
   kernel/events/core.c:10262:2: note: Loop condition is false.  Exiting lo=
op
           raw_spin_lock_irqsave(&ifh->lock, flags);
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   kernel/events/core.c:10263:2: note: Loop condition is true.  Entering lo=
op body
           list_for_each_entry(filter, &ifh->list, entry) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   kernel/events/core.c:10264:7: note: Assuming field 'dentry' is non-null
                   if (filter->path.dentry) {
                       ^~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10264:3: note: Taking true branch
                   if (filter->path.dentry) {
                   ^
   kernel/events/core.c:10272:35: note: Passing null pointer value via 2nd =
parameter 'mm'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                                                          ^~
   kernel/events/core.c:10272:4: note: Calling 'perf_addr_filter_apply'
                           perf_addr_filter_apply(filter, mm, &event->addr_=
filter_ranges[count]);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:10225:13: note: Dereference of null pointer
           for (vma =3D mm->mmap; vma; vma =3D vma->vm_next) {
                      ^~~~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
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
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/dvb-core/dvb_frontend.c:355:23: warning: Value stored to '=
fe' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct dvb_frontend *fe =3D fepriv->dvbdev->priv;
                                ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_frontend.c:355:23: note: Value stored to 'fe'=
 during its initialization is never read
           struct dvb_frontend *fe =3D fepriv->dvbdev->priv;
                                ^~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-core/dvb_frontend.c:1582:3: warning: Value stored to '=
len' is never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 1;
                   ^     ~
   drivers/media/dvb-core/dvb_frontend.c:1582:3: note: Value stored to 'len=
' is never read
                   len =3D 1;
                   ^     ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/media/cec/core/cec-adap.c:420:3: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^
   drivers/media/cec/core/cec-adap.c:1665:6: note: Assuming field 'unregist=
ered' is false
           if (adap->devnode.unregistered)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1665:2: note: Taking false branch
           if (adap->devnode.unregistered)
           ^
   drivers/media/cec/core/cec-adap.c:1668:6: note: Assuming 'log_addrs' is =
null
           if (!log_addrs || log_addrs->num_log_addrs =3D=3D 0) {
               ^~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1668:17: note: Left side of '||' is tr=
ue
           if (!log_addrs || log_addrs->num_log_addrs =3D=3D 0) {
                          ^
   drivers/media/cec/core/cec-adap.c:1669:3: note: Calling 'cec_adap_unconf=
igure'
                   cec_adap_unconfigure(adap);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1327:6: note: Assuming field 'needs_hp=
d' is true
           if (!adap->needs_hpd ||
               ^~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1327:6: note: Left side of '||' is fal=
se
   drivers/media/cec/core/cec-adap.c:1328:6: note: Assuming field 'phys_add=
r' is equal to CEC_PHYS_ADDR_INVALID
               adap->phys_addr !=3D CEC_PHYS_ADDR_INVALID)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1327:2: note: Taking false branch
           if (!adap->needs_hpd ||
           ^
   drivers/media/cec/core/cec-adap.c:1333:2: note: Calling 'cec_flush'
           cec_flush(adap);
           ^~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:417:2: note: Loop condition is true.  =
Entering loop body
           while (!list_empty(&adap->transmit_queue)) {
           ^
   drivers/media/cec/core/cec-adap.c:420:3: note: Calling 'cec_data_cancel'
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:378:6: note: Assuming 'data' is equal =
to field 'transmitting'
           if (data->adap->transmitting =3D=3D data) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:378:2: note: Taking true branch
           if (data->adap->transmitting =3D=3D data) {
           ^
   drivers/media/cec/core/cec-adap.c:387:6: note: Assuming the condition is=
 true
           if (data->msg.tx_status & CEC_TX_STATUS_OK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:387:2: note: Taking true branch
           if (data->msg.tx_status & CEC_TX_STATUS_OK) {
           ^
   drivers/media/cec/core/cec-adap.c:401:2: note: Calling 'cec_data_complet=
ed'
           cec_data_completed(data);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:344:6: note: Assuming field 'fh' is nu=
ll
           if (data->fh)
               ^~~~~~~~
   drivers/media/cec/core/cec-adap.c:344:2: note: Taking false branch
           if (data->fh)
           ^
   drivers/media/cec/core/cec-adap.c:347:6: note: Assuming field 'blocking'=
 is false
           if (data->blocking) {
               ^~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:347:2: note: Taking false branch
           if (data->blocking) {
           ^
   drivers/media/cec/core/cec-adap.c:359:13: note: Field 'fh' is null
                   if (data->fh)

vim +/pll_ctl +521 drivers/ata/pata_pdc2027x.c

669a5db411d85a Jeff Garzik     2006-08-29  492  =

669a5db411d85a Jeff Garzik     2006-08-29  493  /**
1906cf27fcc070 Lee Jones       2021-02-01  494   * pdc_adjust_pll - Adjust =
the PLL input clock in Hz.
669a5db411d85a Jeff Garzik     2006-08-29  495   *
5d728824efeda6 Tejun Heo       2007-04-17  496   * @host: target ATA host
669a5db411d85a Jeff Garzik     2006-08-29  497   * @pll_clock: The input of=
 PLL in HZ
1906cf27fcc070 Lee Jones       2021-02-01  498   * @board_idx: board identi=
fier
669a5db411d85a Jeff Garzik     2006-08-29  499   */
5d728824efeda6 Tejun Heo       2007-04-17  500  static void pdc_adjust_pll(=
struct ata_host *host, long pll_clock, unsigned int board_idx)
669a5db411d85a Jeff Garzik     2006-08-29  501  {
5d728824efeda6 Tejun Heo       2007-04-17  502  	void __iomem *mmio_base =
=3D host->iomap[PDC_MMIO_BAR];
669a5db411d85a Jeff Garzik     2006-08-29  503  	u16 pll_ctl;
669a5db411d85a Jeff Garzik     2006-08-29  504  	long pll_clock_khz =3D pll=
_clock / 1000;
669a5db411d85a Jeff Garzik     2006-08-29  505  	long pout_required =3D boa=
rd_idx? PDC_133_MHZ:PDC_100_MHZ;
669a5db411d85a Jeff Garzik     2006-08-29  506  	long ratio =3D pout_requir=
ed / pll_clock_khz;
669a5db411d85a Jeff Garzik     2006-08-29  507  	int F, R;
669a5db411d85a Jeff Garzik     2006-08-29  508  =

669a5db411d85a Jeff Garzik     2006-08-29  509  	/* Sanity check */
669a5db411d85a Jeff Garzik     2006-08-29  510  	if (unlikely(pll_clock_khz=
 < 5000L || pll_clock_khz > 70000L)) {
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  511  		dev_err(host->dev, "Inval=
id PLL input clock %ldkHz, give up!\n",
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  512  			pll_clock_khz);
669a5db411d85a Jeff Garzik     2006-08-29  513  		return;
669a5db411d85a Jeff Garzik     2006-08-29  514  	}
669a5db411d85a Jeff Garzik     2006-08-29  515  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  516  	dev_dbg(host->dev, "pout_r=
equired is %ld\n", pout_required);
669a5db411d85a Jeff Garzik     2006-08-29  517  =

669a5db411d85a Jeff Garzik     2006-08-29  518  	/* Show the current clock =
value of PLL control register
669a5db411d85a Jeff Garzik     2006-08-29  519  	 * (maybe already configur=
ed by the firmware)
669a5db411d85a Jeff Garzik     2006-08-29  520  	 */
d2a84f47899d1e Alan Cox        2007-09-20 @521  	pll_ctl =3D ioread16(mmio_=
base + PDC_PLL_CTL);
669a5db411d85a Jeff Garzik     2006-08-29  522  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  523  	dev_dbg(host->dev, "pll_ct=
l[%X]\n", pll_ctl);
669a5db411d85a Jeff Garzik     2006-08-29  524  =

669a5db411d85a Jeff Garzik     2006-08-29  525  	/*
669a5db411d85a Jeff Garzik     2006-08-29  526  	 * Calculate the ratio of =
F, R and OD
669a5db411d85a Jeff Garzik     2006-08-29  527  	 * POUT =3D (F + 2) / (( R=
 + 2) * NO)
669a5db411d85a Jeff Garzik     2006-08-29  528  	 */
669a5db411d85a Jeff Garzik     2006-08-29  529  	if (ratio < 8600L) { /* 8.=
6x */
669a5db411d85a Jeff Garzik     2006-08-29  530  		/* Using NO =3D 0x01, R =
=3D 0x0D */
669a5db411d85a Jeff Garzik     2006-08-29  531  		R =3D 0x0d;
669a5db411d85a Jeff Garzik     2006-08-29  532  	} else if (ratio < 12900L)=
 { /* 12.9x */
669a5db411d85a Jeff Garzik     2006-08-29  533  		/* Using NO =3D 0x01, R =
=3D 0x08 */
669a5db411d85a Jeff Garzik     2006-08-29  534  		R =3D 0x08;
669a5db411d85a Jeff Garzik     2006-08-29  535  	} else if (ratio < 16100L)=
 { /* 16.1x */
669a5db411d85a Jeff Garzik     2006-08-29  536  		/* Using NO =3D 0x01, R =
=3D 0x06 */
669a5db411d85a Jeff Garzik     2006-08-29  537  		R =3D 0x06;
669a5db411d85a Jeff Garzik     2006-08-29  538  	} else if (ratio < 64000L)=
 { /* 64x */
669a5db411d85a Jeff Garzik     2006-08-29  539  		R =3D 0x00;
669a5db411d85a Jeff Garzik     2006-08-29  540  	} else {
669a5db411d85a Jeff Garzik     2006-08-29  541  		/* Invalid ratio */
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  542  		dev_err(host->dev, "Inval=
id ratio %ld, give up!\n", ratio);
669a5db411d85a Jeff Garzik     2006-08-29  543  		return;
669a5db411d85a Jeff Garzik     2006-08-29  544  	}
669a5db411d85a Jeff Garzik     2006-08-29  545  =

669a5db411d85a Jeff Garzik     2006-08-29  546  	F =3D (ratio * (R+2)) / 10=
00 - 2;
669a5db411d85a Jeff Garzik     2006-08-29  547  =

669a5db411d85a Jeff Garzik     2006-08-29  548  	if (unlikely(F < 0 || F > =
127)) {
669a5db411d85a Jeff Garzik     2006-08-29  549  		/* Invalid F */
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  550  		dev_err(host->dev, "F[%d]=
 invalid!\n", F);
669a5db411d85a Jeff Garzik     2006-08-29  551  		return;
669a5db411d85a Jeff Garzik     2006-08-29  552  	}
669a5db411d85a Jeff Garzik     2006-08-29  553  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  554  	dev_dbg(host->dev, "F[%d] =
R[%d] ratio*1000[%ld]\n", F, R, ratio);
669a5db411d85a Jeff Garzik     2006-08-29  555  =

669a5db411d85a Jeff Garzik     2006-08-29  556  	pll_ctl =3D (R << 8) | F;
669a5db411d85a Jeff Garzik     2006-08-29  557  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  558  	dev_dbg(host->dev, "Writin=
g pll_ctl[%X]\n", pll_ctl);
669a5db411d85a Jeff Garzik     2006-08-29  559  =

d2a84f47899d1e Alan Cox        2007-09-20  560  	iowrite16(pll_ctl, mmio_ba=
se + PDC_PLL_CTL);
d2a84f47899d1e Alan Cox        2007-09-20  561  	ioread16(mmio_base + PDC_P=
LL_CTL); /* flush */
669a5db411d85a Jeff Garzik     2006-08-29  562  =

669a5db411d85a Jeff Garzik     2006-08-29  563  	/* Wait the PLL circuit to=
 be stable */
b3506c7ed216dd Jia-Ju Bai      2018-01-25  564  	msleep(30);
669a5db411d85a Jeff Garzik     2006-08-29  565  =

669a5db411d85a Jeff Garzik     2006-08-29  566  	/*
669a5db411d85a Jeff Garzik     2006-08-29  567  	 *  Show the current clock=
 value of PLL control register
669a5db411d85a Jeff Garzik     2006-08-29  568  	 * (maybe configured by th=
e firmware)
669a5db411d85a Jeff Garzik     2006-08-29  569  	 */
d2a84f47899d1e Alan Cox        2007-09-20  570  	pll_ctl =3D ioread16(mmio_=
base + PDC_PLL_CTL);
669a5db411d85a Jeff Garzik     2006-08-29  571  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  572  	dev_dbg(host->dev, "pll_ct=
l[%X]\n", pll_ctl);
669a5db411d85a Jeff Garzik     2006-08-29  573  =

669a5db411d85a Jeff Garzik     2006-08-29  574  	return;
669a5db411d85a Jeff Garzik     2006-08-29  575  }
669a5db411d85a Jeff Garzik     2006-08-29  576  =


:::::: The code at line 521 was first introduced by commit
:::::: d2a84f47899d1efc24fa610696f7b793692279c7 pdc2027x: Switch properly t=
o ioread/iowrite

:::::: TO: Alan Cox <alan@lxorguk.ukuu.org.uk>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6749831159715782220==--

