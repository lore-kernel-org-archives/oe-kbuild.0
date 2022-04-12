Content-Type: multipart/mixed; boundary="===============0172929120449382165=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_amd.c:280:9: warning: Although the value stored to 'saved_udma' is used in the enclosing expression, the value is never actually read from 'saved_udma' [clang-analyzer-deadcode.DeadStores]
Date: Tue, 12 Apr 2022 17:39:13 +0800
Message-ID: <202204121702.NUAEcKdN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0172929120449382165==
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
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: 742bef476ca5352b16063161fb73a56629a6d995 ata: libata: move ata_{por=
t,link,dev}_dbg to standard pr_XXX() macros
date:   3 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220411 (https://download.01.org/0day-ci/arc=
hive/20220412/202204121702.NUAEcKdN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
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
               ^~~
   drivers/media/i2c/ov5647.c:1423:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/media/i2c/ov5647.c:1424:3: note: Control jumps to line 1440
                   goto power_off;
                   ^
   drivers/media/i2c/ov5647.c:1440:2: note: Calling 'ov5647_power_off'
           ov5647_power_off(dev);
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov5647.c:798:2: note: 'rdval' declared without an init=
ial value
           u8 rdval;
           ^~~~~~~~
   drivers/media/i2c/ov5647.c:801:2: note: Taking false branch
           dev_dbg(dev, "OV5647 power off\n");
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/i2c/ov5647.c:805:6: note: 'ret' is < 0
           if (ret < 0)
               ^~~
   drivers/media/i2c/ov5647.c:805:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/media/i2c/ov5647.c:806:3: note: Taking false branch
                   dev_dbg(dev, "disable oe failed\n");
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/i2c/ov5647.c:809:8: note: Calling 'ov5647_read'
           ret =3D ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov5647.c:622:6: note: Assuming 'ret' is < 0
           if (ret < 0) {
               ^~~~~~~
   drivers/media/i2c/ov5647.c:622:2: note: Taking true branch
           if (ret < 0) {
           ^
   drivers/media/i2c/ov5647.c:623:3: note: Taking false branch
                   dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/i2c/ov5647.c:625:3: note: Returning without writing to '*v=
al'
                   return ret;
                   ^
   drivers/media/i2c/ov5647.c:809:8: note: Returning from 'ov5647_read'
           ret =3D ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ov5647.c:810:6: note: 'ret' is < 0
           if (ret < 0)
               ^~~
   drivers/media/i2c/ov5647.c:810:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/media/i2c/ov5647.c:811:3: note: Taking false branch
                   dev_dbg(dev, "software standby failed\n");
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/i2c/ov5647.c:813:8: note: The left expression of the compo=
und assignment is an uninitialized value. The computed value will also be g=
arbage
           rdval &=3D ~0x01;
           ~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/ata/sata_sx4.c:1326:8: warning: Although the value stored to 'sp=
eed' is used in the enclosing expression, the value is never actually read =
from 'speed' [clang-analyzer-deadcode.DeadStores]
           if (!(speed =3D pdc20621_detect_dimm(host))) {
                 ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/sata_sx4.c:1326:8: note: Although the value stored to 'speed=
' is used in the enclosing expression, the value is never actually read fro=
m 'speed'
           if (!(speed =3D pdc20621_detect_dimm(host))) {
                 ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   5 warnings generated.
   drivers/ata/pata_ali.c:126:10: warning: Although the value stored to 'ma=
sk' is used in the enclosing expression, the value is never actually read f=
rom 'mask' [clang-analyzer-deadcode.DeadStores]
                   return mask &=3D ~ATA_MASK_UDMA;
                          ^       ~~~~~~~~~~~~~~
   drivers/ata/pata_ali.c:126:10: note: Although the value stored to 'mask'=
 is used in the enclosing expression, the value is never actually read from=
 'mask'
                   return mask &=3D ~ATA_MASK_UDMA;
                          ^       ~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/tty/mxser.c:389:7: warning: Although the value stored to 'hwid' =
is used in the enclosing expression, the value is never actually read from =
'hwid' [clang-analyzer-deadcode.DeadStores]
           if ((hwid =3D inb(io + UART_MCR)) !=3D 0) {
                ^
   drivers/tty/mxser.c:389:7: note: Although the value stored to 'hwid' is =
used in the enclosing expression, the value is never actually read from 'hw=
id'
   drivers/tty/mxser.c:1489:12: warning: Although the value stored to 'lsr'=
 is used in the enclosing expression, the value is never actually read from=
 'lsr' [clang-analyzer-deadcode.DeadStores]
           while (!((lsr =3D inb(info->ioaddr + UART_LSR)) & UART_LSR_TEMT)=
) {
                     ^
   drivers/tty/mxser.c:1489:12: note: Although the value stored to 'lsr' is=
 used in the enclosing expression, the value is never actually read from 'l=
sr'
   drivers/tty/mxser.c:1687:3: warning: Value stored to 'status' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   status =3D inb(port->ioaddr + UART_LSR);
                   ^
   drivers/tty/mxser.c:1687:3: note: Value stored to 'status' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/namespace.c:2242:13: warning: Access to field 'd_inode' results in a =
dereference of a null pointer (loaded from variable 'dentry') [clang-analyz=
er-core.NullDereference]
           inode_lock(dentry->d_inode);
                      ^
   fs/namespace.c:3816:1: note: Calling '__do_sys_pivot_root'
   SYSCALL_DEFINE2(pivot_root, const char __user *, new_root,
   ^
   include/linux/syscalls.h:218:36: note: expanded from macro 'SYSCALL_DEFI=
NE2'
   #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   fs/namespace.c:3824:6: note: Assuming the condition is false
           if (!may_mount())
               ^~~~~~~~~~~~
   fs/namespace.c:3824:2: note: Taking false branch
           if (!may_mount())
           ^
   fs/namespace.c:3829:6: note: Assuming 'error' is 0

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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0172929120449382165==--

