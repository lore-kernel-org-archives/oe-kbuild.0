Content-Type: multipart/mixed; boundary="===============8257659624470116011=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_amd.c:280:9: warning: Although the value stored to 'saved_udma' is used in the enclosing expression, the value is never actually read from 'saved_udma' [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Feb 2022 18:51:38 +0800
Message-ID: <202202271848.wt5soFuB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8257659624470116011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: 742bef476ca5352b16063161fb73a56629a6d995 ata: libata: move ata_{por=
t,link,dev}_dbg to standard pr_XXX() macros
date:   8 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220227/202202271848.wt5soFuB-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D742bef476ca5352b16063161fb73a56629a6d995
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 742bef476ca5352b16063161fb73a56629a6d995
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:383:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   drivers/base/test/test_async_driver_probe.c:166:2: note: '?' condition i=
s true
           dev_info(&(*pdev)->dev,
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:387:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   drivers/base/test/test_async_driver_probe.c:166:2: note: Loop condition =
is false.  Exiting loop
           dev_info(&(*pdev)->dev,
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:373:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   drivers/base/test/test_async_driver_probe.c:166:12: note: Dereference of=
 null pointer (loaded from variable 'pdev')
           dev_info(&(*pdev)->dev,
                     ^
   include/linux/dev_printk.h:150:46: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
                                                       ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk=
_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   drivers/base/test/test_async_driver_probe.c:177:2: warning: Value stored=
 to 'nid' is never read [clang-analyzer-deadcode.DeadStores]
           nid =3D cpu_to_node(cpu);
           ^
   drivers/base/test/test_async_driver_probe.c:177:2: note: Value stored to=
 'nid' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/gfs2/ops_fstype.c:852:2: warning: Value stored to 'jindex' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           jindex =3D 0;
           ^        ~
   fs/gfs2/ops_fstype.c:852:2: note: Value stored to 'jindex' is never read
           jindex =3D 0;
           ^        ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/gfs2/inode.c:1493:4: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1493:4: note: Value stored to 'error' is never read
                           error =3D 0;
                           ^       ~
   fs/gfs2/inode.c:1558:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/inode.c:1558:3: note: Value stored to 'error' is never read
                   error =3D gfs2_unlink_inode(ndip, ndentry);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/gfs2/quota.c:839:2: warning: Value stored to 'err' is never read [cla=
ng-analyzer-deadcode.DeadStores]
           err =3D -EIO;
           ^     ~~~~
   fs/gfs2/quota.c:839:2: note: Value stored to 'err' is never read
           err =3D -EIO;
           ^     ~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/ata/pata_amd.c:280:9: warning: Although the value stored to 'sav=
ed_udma' is used in the enclosing expression, the value is never actually r=
ead from 'saved_udma' [clang-analyzer-deadcode.DeadStores]
           udma =3D saved_udma =3D (unsigned long)ap->host->private_data;
                  ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_amd.c:280:9: note: Although the value stored to 'saved_=
udma' is used in the enclosing expression, the value is never actually read=
 from 'saved_udma'
           udma =3D saved_udma =3D (unsigned long)ap->host->private_data;
                  ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   kernel/rcu/tree.c:279:2: warning: Value stored to 'seq' is never read [c=
lang-analyzer-deadcode.DeadStores]
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:279:2: note: Value stored to 'seq' is never read
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:298:2: warning: Value stored to 'seq' is never read [c=
lang-analyzer-deadcode.DeadStores]
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:298:2: note: Value stored to 'seq' is never read
           seq =3D rcu_dynticks_inc(1);
           ^     ~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/i2c/algos/i2c-algo-pca.c:195:10: warning: Although the value sto=
red to 'state' is used in the enclosing expression, the value is never actu=
ally read from 'state' [clang-analyzer-deadcode.DeadStores]
           while ((state =3D pca_status(adap)) !=3D 0xf8) {
                   ^
   drivers/i2c/algos/i2c-algo-pca.c:195:10: note: Although the value stored=
 to 'state' is used in the enclosing expression, the value is never actuall=
y read from 'state'
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/regulator/core.c:3792:3: warning: Value stored to 'possible_uV' =
is never read [clang-analyzer-deadcode.DeadStores]

vim +280 drivers/ata/pata_amd.c

669a5db411d85a Jeff Garzik    2006-08-29  260  =

ce54d161630211 Tejun Heo      2007-12-18  261  /* Both host-side and drive-=
side detection results are worthless on NV
ce54d161630211 Tejun Heo      2007-12-18  262   * PATAs.  Ignore them and j=
ust follow what BIOS configured.  Both the
ce54d161630211 Tejun Heo      2007-12-18  263   * current configuration in =
PCI config reg and ACPI GTM result are
ce54d161630211 Tejun Heo      2007-12-18  264   * cached during driver atta=
ch and are consulted to select transfer
ce54d161630211 Tejun Heo      2007-12-18  265   * mode.
ce54d161630211 Tejun Heo      2007-12-18  266   */
ce54d161630211 Tejun Heo      2007-12-18  267  static unsigned long nv_mode=
_filter(struct ata_device *dev,
ce54d161630211 Tejun Heo      2007-12-18  268  				    unsigned long xfer_m=
ask)
ce54d161630211 Tejun Heo      2007-12-18  269  {
ce54d161630211 Tejun Heo      2007-12-18  270  	static const unsigned int u=
dma_mask_map[] =3D
ce54d161630211 Tejun Heo      2007-12-18  271  		{ ATA_UDMA2, ATA_UDMA1, AT=
A_UDMA0, 0,
ce54d161630211 Tejun Heo      2007-12-18  272  		  ATA_UDMA3, ATA_UDMA4, AT=
A_UDMA5, ATA_UDMA6 };
ce54d161630211 Tejun Heo      2007-12-18  273  	struct ata_port *ap =3D dev=
->link->ap;
ce54d161630211 Tejun Heo      2007-12-18  274  	char acpi_str[32] =3D "";
ce54d161630211 Tejun Heo      2007-12-18  275  	u32 saved_udma, udma;
ce54d161630211 Tejun Heo      2007-12-18  276  	const struct ata_acpi_gtm *=
gtm;
ce54d161630211 Tejun Heo      2007-12-18  277  	unsigned long bios_limit =
=3D 0, acpi_limit =3D 0, limit;
ce54d161630211 Tejun Heo      2007-12-18  278  =

ce54d161630211 Tejun Heo      2007-12-18  279  	/* find out what BIOS confi=
gured */
ce54d161630211 Tejun Heo      2007-12-18 @280  	udma =3D saved_udma =3D (un=
signed long)ap->host->private_data;
ce54d161630211 Tejun Heo      2007-12-18  281  =

ce54d161630211 Tejun Heo      2007-12-18  282  	if (ap->port_no =3D=3D 0)
ce54d161630211 Tejun Heo      2007-12-18  283  		udma >>=3D 16;
ce54d161630211 Tejun Heo      2007-12-18  284  	if (dev->devno =3D=3D 0)
ce54d161630211 Tejun Heo      2007-12-18  285  		udma >>=3D 8;
ce54d161630211 Tejun Heo      2007-12-18  286  =

ce54d161630211 Tejun Heo      2007-12-18  287  	if ((udma & 0xc0) =3D=3D 0x=
c0)
ce54d161630211 Tejun Heo      2007-12-18  288  		bios_limit =3D ata_pack_xf=
ermask(0, 0, udma_mask_map[udma & 0x7]);
ce54d161630211 Tejun Heo      2007-12-18  289  =

ce54d161630211 Tejun Heo      2007-12-18  290  	/* consult ACPI GTM too */
ce54d161630211 Tejun Heo      2007-12-18  291  	gtm =3D ata_acpi_init_gtm(a=
p);
ce54d161630211 Tejun Heo      2007-12-18  292  	if (gtm) {
ce54d161630211 Tejun Heo      2007-12-18  293  		acpi_limit =3D ata_acpi_gt=
m_xfermask(dev, gtm);
ce54d161630211 Tejun Heo      2007-12-18  294  =

ce54d161630211 Tejun Heo      2007-12-18  295  		snprintf(acpi_str, sizeof(=
acpi_str), " (%u:%u:0x%x)",
ce54d161630211 Tejun Heo      2007-12-18  296  			 gtm->drive[0].dma, gtm->=
drive[1].dma, gtm->flags);
ce54d161630211 Tejun Heo      2007-12-18  297  	}
ce54d161630211 Tejun Heo      2007-12-18  298  =

ce54d161630211 Tejun Heo      2007-12-18  299  	/* be optimistic, EH can ta=
ke care of things if something goes wrong */
ce54d161630211 Tejun Heo      2007-12-18  300  	limit =3D bios_limit | acpi=
_limit;
ce54d161630211 Tejun Heo      2007-12-18  301  =

ce54d161630211 Tejun Heo      2007-12-18  302  	/* If PIO or DMA isn't conf=
igured at all, don't limit.  Let EH
ce54d161630211 Tejun Heo      2007-12-18  303  	 * handle it.
ce54d161630211 Tejun Heo      2007-12-18  304  	 */
ce54d161630211 Tejun Heo      2007-12-18  305  	if (!(limit & ATA_MASK_PIO))
ce54d161630211 Tejun Heo      2007-12-18  306  		limit |=3D ATA_MASK_PIO;
ce54d161630211 Tejun Heo      2007-12-18  307  	if (!(limit & (ATA_MASK_MWD=
MA | ATA_MASK_UDMA)))
ce54d161630211 Tejun Heo      2007-12-18  308  		limit |=3D ATA_MASK_MWDMA =
| ATA_MASK_UDMA;
90950a2504b66d Robert Hancock 2009-09-12  309  	/* PIO4, MWDMA2, UDMA2 shou=
ld always be supported regardless of
90950a2504b66d Robert Hancock 2009-09-12  310  	   cable detection result */
90950a2504b66d Robert Hancock 2009-09-12  311  	limit |=3D ata_pack_xfermas=
k(ATA_PIO4, ATA_MWDMA2, ATA_UDMA2);
ce54d161630211 Tejun Heo      2007-12-18  312  =

a9a79dfec23956 Joe Perches    2011-04-15  313  	ata_port_dbg(ap, "nv_mode_f=
ilter: 0x%lx&0x%lx->0x%lx, "
ce54d161630211 Tejun Heo      2007-12-18  314  			"BIOS=3D0x%lx (0x%x) ACPI=
=3D0x%lx%s\n",
ce54d161630211 Tejun Heo      2007-12-18  315  			xfer_mask, limit, xfer_ma=
sk & limit, bios_limit,
ce54d161630211 Tejun Heo      2007-12-18  316  			saved_udma, acpi_limit, a=
cpi_str);
ce54d161630211 Tejun Heo      2007-12-18  317  =

ce54d161630211 Tejun Heo      2007-12-18  318  	return xfer_mask & limit;
ce54d161630211 Tejun Heo      2007-12-18  319  }
669a5db411d85a Jeff Garzik    2006-08-29  320  =


:::::: The code at line 280 was first introduced by commit
:::::: ce54d1616302117fa98513ae916bb3333e1c02ea pata_amd: update mode selec=
tion for NV PATAs

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8257659624470116011==--

