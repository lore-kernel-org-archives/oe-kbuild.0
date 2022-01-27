Content-Type: multipart/mixed; boundary="===============3958769168035458605=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_amd.c:280:9: warning: Although the value stored to 'saved_udma' is used in the enclosing expression, the value is never actually read from 'saved_udma' [clang-analyzer-deadcode.DeadStores]
Date: Thu, 27 Jan 2022 20:48:50 +0800
Message-ID: <202201272057.UH2JO43i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3958769168035458605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 742bef476ca5352b16063161fb73a56629a6d995 ata: libata: move ata_{por=
t,link,dev}_dbg to standard pr_XXX() macros
date:   3 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220127/202201272057.UH2JO43i-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D742bef476ca5352b16063161fb73a56629a6d995
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 742bef476ca5352b16063161fb73a56629a6d995
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/list.h:484:3: note: Calling '__list_splice'
                   __list_splice(list, head, head->next);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:442:14: note: Use of memory after it is freed
           first->prev =3D prev;
           ~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mfd/sm501.c:513:16: warning: Value stored to 'mode' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:513:16: note: Value stored to 'mode' during its init=
ialization is never read
           unsigned long mode =3D smc501_readl(sm->regs + SM501_POWER_MODE_=
CONTROL);
                         ^~~~
   drivers/mfd/sm501.c:514:16: warning: Value stored to 'gate' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:514:16: note: Value stored to 'gate' during its init=
ialization is never read
           unsigned long gate =3D smc501_readl(sm->regs + SM501_CURRENT_GAT=
E);
                         ^~~~
   drivers/mfd/sm501.c:515:16: warning: Value stored to 'clock' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   drivers/mfd/sm501.c:515:16: note: Value stored to 'clock' during its ini=
tialization is never read
           unsigned long clock =3D smc501_readl(sm->regs + SM501_CURRENT_CL=
OCK);
                         ^~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/xfs/libxfs/xfs_da_btree.c:1611:10: warning: Access to field 'b_addr' =
results in a dereference of a null pointer (loaded from field 'bp') [clang-=
analyzer-core.NullDereference]
                   curr =3D blk->bp->b_addr;
                          ^    ~~
   fs/xfs/libxfs/xfs_da_btree.c:1597:2: note: Loop condition is true.  Ente=
ring loop body
           for (blk =3D &state->path.blk[0], state->path.active =3D 1;
           ^
   fs/xfs/libxfs/xfs_da_btree.c:1604:11: note: Calling 'xfs_da3_node_read'
                   error =3D xfs_da3_node_read(args->trans, args->dp, blkno,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:378:10: note: Calling 'xfs_da_read_buf'
           error =3D xfs_da_read_buf(tp, dp, bno, 0, bpp, whichfork,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2632:2: note: Null pointer value stored to =
field 'bp'
           *bpp =3D NULL;
           ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2634:6: note: Assuming 'error' is 0, which =
participates in a condition later
           if (error || !nmap)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2634:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_da_btree.c:2634:15: note: Assuming 'nmap' is 0
           if (error || !nmap)
                        ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2634:2: note: Taking true branch
           if (error || !nmap)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2635:3: note: Control jumps to line 2648
                   goto out_free;
                   ^
   fs/xfs/libxfs/xfs_da_btree.c:2648:2: note: Taking true branch
           if (mapp !=3D &map)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2651:2: note: Returning zero (loaded from '=
error'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:378:10: note: Returning from 'xfs_da_read_b=
uf'
           error =3D xfs_da_read_buf(tp, dp, bno, 0, bpp, whichfork,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:380:6: note: 'error' is 0
           if (error || !*bpp || !tp)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:380:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_da_btree.c:380:21: note: Left side of '||' is true
           if (error || !*bpp || !tp)
                              ^
   fs/xfs/libxfs/xfs_da_btree.c:381:3: note: Returning zero (loaded from 'e=
rror'), which participates in a condition later
                   return error;
                   ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:1604:11: note: Returning from 'xfs_da3_node=
_read'
                   error =3D xfs_da3_node_read(args->trans, args->dp, blkno,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:1606:7: note: 'error' is 0
                   if (error) {
                       ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:1606:3: note: Taking false branch
                   if (error) {
                   ^
   fs/xfs/libxfs/xfs_da_btree.c:1611:10: note: Access to field 'b_addr' res=
ults in a dereference of a null pointer (loaded from field 'bp')
                   curr =3D blk->bp->b_addr;
                          ^    ~~
   fs/xfs/libxfs/xfs_da_btree.c:2203:22: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           if (got !=3D count || mapp[0].br_startoff !=3D *bno ||
                               ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2153:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2153:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2163:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2163:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2166:9: note: Assuming 'nmap' is <=3D 1
           ASSERT(nmap <=3D 1);
                  ^
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~

vim +280 drivers/ata/pata_amd.c

669a5db411d85a1 Jeff Garzik    2006-08-29  260  =

ce54d1616302117 Tejun Heo      2007-12-18  261  /* Both host-side and drive=
-side detection results are worthless on NV
ce54d1616302117 Tejun Heo      2007-12-18  262   * PATAs.  Ignore them and =
just follow what BIOS configured.  Both the
ce54d1616302117 Tejun Heo      2007-12-18  263   * current configuration in=
 PCI config reg and ACPI GTM result are
ce54d1616302117 Tejun Heo      2007-12-18  264   * cached during driver att=
ach and are consulted to select transfer
ce54d1616302117 Tejun Heo      2007-12-18  265   * mode.
ce54d1616302117 Tejun Heo      2007-12-18  266   */
ce54d1616302117 Tejun Heo      2007-12-18  267  static unsigned long nv_mod=
e_filter(struct ata_device *dev,
ce54d1616302117 Tejun Heo      2007-12-18  268  				    unsigned long xfer_=
mask)
ce54d1616302117 Tejun Heo      2007-12-18  269  {
ce54d1616302117 Tejun Heo      2007-12-18  270  	static const unsigned int =
udma_mask_map[] =3D
ce54d1616302117 Tejun Heo      2007-12-18  271  		{ ATA_UDMA2, ATA_UDMA1, A=
TA_UDMA0, 0,
ce54d1616302117 Tejun Heo      2007-12-18  272  		  ATA_UDMA3, ATA_UDMA4, A=
TA_UDMA5, ATA_UDMA6 };
ce54d1616302117 Tejun Heo      2007-12-18  273  	struct ata_port *ap =3D de=
v->link->ap;
ce54d1616302117 Tejun Heo      2007-12-18  274  	char acpi_str[32] =3D "";
ce54d1616302117 Tejun Heo      2007-12-18  275  	u32 saved_udma, udma;
ce54d1616302117 Tejun Heo      2007-12-18  276  	const struct ata_acpi_gtm =
*gtm;
ce54d1616302117 Tejun Heo      2007-12-18  277  	unsigned long bios_limit =
=3D 0, acpi_limit =3D 0, limit;
ce54d1616302117 Tejun Heo      2007-12-18  278  =

ce54d1616302117 Tejun Heo      2007-12-18  279  	/* find out what BIOS conf=
igured */
ce54d1616302117 Tejun Heo      2007-12-18 @280  	udma =3D saved_udma =3D (u=
nsigned long)ap->host->private_data;
ce54d1616302117 Tejun Heo      2007-12-18  281  =

ce54d1616302117 Tejun Heo      2007-12-18  282  	if (ap->port_no =3D=3D 0)
ce54d1616302117 Tejun Heo      2007-12-18  283  		udma >>=3D 16;
ce54d1616302117 Tejun Heo      2007-12-18  284  	if (dev->devno =3D=3D 0)
ce54d1616302117 Tejun Heo      2007-12-18  285  		udma >>=3D 8;
ce54d1616302117 Tejun Heo      2007-12-18  286  =

ce54d1616302117 Tejun Heo      2007-12-18  287  	if ((udma & 0xc0) =3D=3D 0=
xc0)
ce54d1616302117 Tejun Heo      2007-12-18  288  		bios_limit =3D ata_pack_x=
fermask(0, 0, udma_mask_map[udma & 0x7]);
ce54d1616302117 Tejun Heo      2007-12-18  289  =

ce54d1616302117 Tejun Heo      2007-12-18  290  	/* consult ACPI GTM too */
ce54d1616302117 Tejun Heo      2007-12-18  291  	gtm =3D ata_acpi_init_gtm(=
ap);
ce54d1616302117 Tejun Heo      2007-12-18  292  	if (gtm) {
ce54d1616302117 Tejun Heo      2007-12-18  293  		acpi_limit =3D ata_acpi_g=
tm_xfermask(dev, gtm);
ce54d1616302117 Tejun Heo      2007-12-18  294  =

ce54d1616302117 Tejun Heo      2007-12-18  295  		snprintf(acpi_str, sizeof=
(acpi_str), " (%u:%u:0x%x)",
ce54d1616302117 Tejun Heo      2007-12-18  296  			 gtm->drive[0].dma, gtm-=
>drive[1].dma, gtm->flags);
ce54d1616302117 Tejun Heo      2007-12-18  297  	}
ce54d1616302117 Tejun Heo      2007-12-18  298  =

ce54d1616302117 Tejun Heo      2007-12-18  299  	/* be optimistic, EH can t=
ake care of things if something goes wrong */
ce54d1616302117 Tejun Heo      2007-12-18  300  	limit =3D bios_limit | acp=
i_limit;
ce54d1616302117 Tejun Heo      2007-12-18  301  =

ce54d1616302117 Tejun Heo      2007-12-18  302  	/* If PIO or DMA isn't con=
figured at all, don't limit.  Let EH
ce54d1616302117 Tejun Heo      2007-12-18  303  	 * handle it.
ce54d1616302117 Tejun Heo      2007-12-18  304  	 */
ce54d1616302117 Tejun Heo      2007-12-18  305  	if (!(limit & ATA_MASK_PIO=
))
ce54d1616302117 Tejun Heo      2007-12-18  306  		limit |=3D ATA_MASK_PIO;
ce54d1616302117 Tejun Heo      2007-12-18  307  	if (!(limit & (ATA_MASK_MW=
DMA | ATA_MASK_UDMA)))
ce54d1616302117 Tejun Heo      2007-12-18  308  		limit |=3D ATA_MASK_MWDMA=
 | ATA_MASK_UDMA;
90950a2504b66d6 Robert Hancock 2009-09-12  309  	/* PIO4, MWDMA2, UDMA2 sho=
uld always be supported regardless of
90950a2504b66d6 Robert Hancock 2009-09-12  310  	   cable detection result =
*/
90950a2504b66d6 Robert Hancock 2009-09-12  311  	limit |=3D ata_pack_xferma=
sk(ATA_PIO4, ATA_MWDMA2, ATA_UDMA2);
ce54d1616302117 Tejun Heo      2007-12-18  312  =

a9a79dfec239568 Joe Perches    2011-04-15  313  	ata_port_dbg(ap, "nv_mode_=
filter: 0x%lx&0x%lx->0x%lx, "
ce54d1616302117 Tejun Heo      2007-12-18  314  			"BIOS=3D0x%lx (0x%x) ACP=
I=3D0x%lx%s\n",
ce54d1616302117 Tejun Heo      2007-12-18  315  			xfer_mask, limit, xfer_m=
ask & limit, bios_limit,
ce54d1616302117 Tejun Heo      2007-12-18  316  			saved_udma, acpi_limit, =
acpi_str);
ce54d1616302117 Tejun Heo      2007-12-18  317  =

ce54d1616302117 Tejun Heo      2007-12-18  318  	return xfer_mask & limit;
ce54d1616302117 Tejun Heo      2007-12-18  319  }
669a5db411d85a1 Jeff Garzik    2006-08-29  320  =


:::::: The code at line 280 was first introduced by commit
:::::: ce54d1616302117fa98513ae916bb3333e1c02ea pata_amd: update mode selec=
tion for NV PATAs

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3958769168035458605==--

