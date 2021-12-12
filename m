Content-Type: multipart/mixed; boundary="===============4983299546159634001=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pci-aardvark.c:595:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 13:56:41 +0800
Message-ID: <202112121327.GJb6ozIM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4983299546159634001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Marek Beh=C3=BAn" <kabel@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 464de7e7fff767e87429cd7be09c4f2cb50a6ccb PCI: aardvark: Don't spam =
about PIO Response Status
date:   9 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20211130 (https://download.01.org/0day-ci/arc=
hive/20211212/202112121327.GJb6ozIM-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D464de7e7fff767e87429cd7be09c4f2cb50a6ccb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 464de7e7fff767e87429cd7be09c4f2cb50a6ccb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                               ^~~~~~~~~~~~~~~~~
   fs/mpage.c:526:8: note: Left side of '||' is false
   fs/mpage.c:526:29: note: Assuming the condition is false
                           if (!buffer_dirty(bh) || !buffer_uptodate(bh))
                                                    ^~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:526:4: note: Taking false branch
                           if (!buffer_dirty(bh) || !buffer_uptodate(bh))
                           ^
   fs/mpage.c:528:8: note: 'page_block' is 0
                           if (page_block) {
                               ^~~~~~~~~~
   fs/mpage.c:528:4: note: Taking false branch
                           if (page_block) {
                           ^
   fs/mpage.c:534:8: note: Assuming 'boundary' is 0
                           if (boundary) {
                               ^~~~~~~~
   fs/mpage.c:534:4: note: Taking false branch
                           if (boundary) {
                           ^
   fs/mpage.c:539:12: note: Assuming the condition is false
                   } while ((bh =3D bh->b_this_page) !=3D head);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:509:3: note: Loop condition is false.  Exiting loop
                   do {
                   ^
   fs/mpage.c:541:7: note: Assuming 'first_unmapped' is not equal to 0
                   if (first_unmapped)
                       ^~~~~~~~~~~~~~
   fs/mpage.c:541:3: note: Taking true branch
                   if (first_unmapped)
                   ^
   fs/mpage.c:542:4: note: Control jumps to line 588
                           goto page_is_mapped;
                           ^
   fs/mpage.c:589:6: note: Assuming 'end_index' is > field 'index'
           if (page->index >=3D end_index) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:589:2: note: Taking false branch
           if (page->index >=3D end_index) {
           ^
   fs/mpage.c:608:6: note: Assuming 'bio' is non-null
           if (bio && mpd->last_block_in_bio !=3D blocks[0] - 1)
               ^~~
   fs/mpage.c:608:6: note: Left side of '&&' is true
   fs/mpage.c:608:13: note: Assuming the condition is false
           if (bio && mpd->last_block_in_bio !=3D blocks[0] - 1)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:608:2: note: Taking false branch
           if (bio && mpd->last_block_in_bio !=3D blocks[0] - 1)
           ^
   fs/mpage.c:612:6: note: 'bio' is not equal to NULL
           if (bio =3D=3D NULL) {
               ^~~
   fs/mpage.c:612:2: note: Taking false branch
           if (bio =3D=3D NULL) {
           ^
   fs/mpage.c:634:6: note: Assuming the condition is false
           if (bio_add_page(bio, page, length, 0) < length) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/mpage.c:634:2: note: Taking false branch
           if (bio_add_page(bio, page, length, 0) < length) {
           ^
   fs/mpage.c:641:2: note: Assuming the condition is true
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:65:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/mpage.c:641:2: note: Taking false branch
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:65:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/mpage.c:641:2: note: Loop condition is false.  Exiting loop
           BUG_ON(PageWriteback(page));
           ^
   include/asm-generic/bug.h:65:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/mpage.c:644:6: note: 'boundary' is 0
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
               ^~~~~~~~
   fs/mpage.c:644:6: note: Left side of '||' is false
   fs/mpage.c:644:19: note: 'first_unmapped' is equal to 'blocks_per_page'
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
                            ^~~~~~~~~~~~~~
   fs/mpage.c:644:2: note: Taking false branch
           if (boundary || (first_unmapped !=3D blocks_per_page)) {
           ^
   fs/mpage.c:651:26: note: Assigned value is garbage or undefined
                   mpd->last_block_in_bio =3D blocks[blocks_per_page - 1];
                                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pci/controller/pci-aardvark.c:595:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D &pcie->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:595:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D &pcie->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
>> drivers/pci/controller/pci-aardvark.c:682:3: warning: Value stored to 's=
tr_posted' is never read [clang-analyzer-deadcode.DeadStores]
                   str_posted =3D "Non-posted";
                   ^            ~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:682:3: note: Value stored to 'str_=
posted' is never read
                   str_posted =3D "Non-posted";
                   ^            ~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:684:3: warning: Value stored to 's=
tr_posted' is never read [clang-analyzer-deadcode.DeadStores]
                   str_posted =3D "Posted";
                   ^            ~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:684:3: note: Value stored to 'str_=
posted' is never read
                   str_posted =3D "Posted";
                   ^            ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/dma/tegra20-apb-dma.c:1329:2: note: Loop condition is false.  Ex=
iting loop
           dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
           ^
   include/linux/dev_printk.h:158:2: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/dma/tegra20-apb-dma.c:1341:2: note: Loop condition is true.  Ent=
ering loop body
           while (!list_empty(&dma_desc_list)) {
           ^
   drivers/dma/tegra20-apb-dma.c:1342:14: note: Left side of '&&' is false
                   dma_desc =3D list_first_entry(&dma_desc_list, typeof(*dm=
a_desc),
                              ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/tegra20-apb-dma.c:1342:14: note: Taking false branch
                   dma_desc =3D list_first_entry(&dma_desc_list, typeof(*dm=
a_desc),
                              ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/dma/tegra20-apb-dma.c:1342:14: note: Loop condition is false.  E=
xiting loop
                   dma_desc =3D list_first_entry(&dma_desc_list, typeof(*dm=
a_desc),
                              ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^

vim +/dev +595 drivers/pci/controller/pci-aardvark.c

8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  592  =

43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  593  static int advk_pcie_check_pio_status(struct advk_pcie *pc=
ie, bool allow_crs, u32 *val)
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  594  {
9aec2feaf787a7 drivers/pci/host/pci-aardvark.c       Bjorn Helgaas    2016-=
10-06 @595  	struct device *dev =3D &pcie->pdev->dev;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  596  	u32 reg;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  597  	unsigned int status;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  598  	char *strcomp_status, *str_posted;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  599  =

8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  600  	reg =3D advk_readl(pcie, PIO_STAT);
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  601  	status =3D (reg & PIO_COMPLETION_STATUS_MASK) >>
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  602  		PIO_COMPLETION_STATUS_SHIFT;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  603  =

fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  604  	/*
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  605  	 * According to HW spec, the PIO status check sequence as belo=
w:
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  606  	 * 1) even if COMPLETION_STATUS(bit9:7) indicates successful,
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  607  	 *    it still needs to check Error Status(bit11), only when t=
his bit
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  608  	 *    indicates no error happen, the operation is successful.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  609  	 * 2) value Unsupported Request(1) of COMPLETION_STATUS(bit9:7=
) only
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  610  	 *    means a PIO write error, and for PIO read it is successf=
ul with
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  611  	 *    a read value of 0xFFFFFFFF.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  612  	 * 3) value Completion Retry Status(CRS) of COMPLETION_STATUS(=
bit9:7)
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  613  	 *    only means a PIO write error, and for PIO read it is suc=
cessful
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  614  	 *    with a read value of 0xFFFF0001.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  615  	 * 4) value Completer Abort (CA) of COMPLETION_STATUS(bit9:7) =
means
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  616  	 *    error for both PIO read and PIO write operation.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  617  	 * 5) other errors are indicated as 'unknown'.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  618  	 */
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  619  	switch (status) {
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  620  	case PIO_COMPLETION_STATUS_OK:
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  621  		if (reg & PIO_ERR_STATUS) {
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  622  			strcomp_status =3D "COMP_ERR";
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  623  			break;
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  624  		}
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  625  		/* Get the read result */
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  626  		if (val)
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  627  			*val =3D advk_readl(pcie, PIO_RD_DATA);
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  628  		/* No error */
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  629  		strcomp_status =3D NULL;
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  630  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  631  	case PIO_COMPLETION_STATUS_UR:
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  632  		strcomp_status =3D "UR";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  633  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  634  	case PIO_COMPLETION_STATUS_CRS:
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  635  		if (allow_crs && val) {
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  636  			/* PCIe r4.0, sec 2.3.2, says:
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  637  			 * If CRS Software Visibility is enabled:
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  638  			 * For a Configuration Read Request that includes both
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  639  			 * bytes of the Vendor ID field of a device Function's
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  640  			 * Configuration Space Header, the Root Complex must
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  641  			 * complete the Request to the host by returning a
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  642  			 * read-data value of 0001h for the Vendor ID field and
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  643  			 * all '1's for any additional bytes included in the
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  644  			 * request.
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  645  			 *
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  646  			 * So CRS in this case is not an error status.
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  647  			 */
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  648  			*val =3D CFG_RD_CRS_VAL;
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  649  			strcomp_status =3D NULL;
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  650  			break;
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  651  		}
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  652  		/* PCIe r4.0, sec 2.3.2, says:
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  653  		 * If CRS Software Visibility is not enabled, the Root Complex
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  654  		 * must re-issue the Configuration Request as a new Request.
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  655  		 * If CRS Software Visibility is enabled: For a Configur=
ation
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  656  		 * Write Request or for any other Configuration Read Req=
uest,
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  657  		 * the Root Complex must re-issue the Configuration Requ=
est as
43f5c77bcbd27c drivers/pci/controller/pci-aardvark.c Pali Roh=C3=A1r       =
2021-07-22  658  		 * a new Request.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  659  		 * A Root Complex implementation may choose to limit the numb=
er
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  660  		 * of Configuration Request/CRS Completion Status loops before
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  661  		 * determining that something is wrong with the target of the
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  662  		 * Request and taking appropriate action, e.g., complete the
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  663  		 * Request to the host as a failed transaction.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  664  		 *
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  665  		 * To simplify implementation do not re-issue the Configurati=
on
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  666  		 * Request and complete the Request as a failed transaction.
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  667  		 */
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  668  		strcomp_status =3D "CRS";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  669  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  670  	case PIO_COMPLETION_STATUS_CA:
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  671  		strcomp_status =3D "CA";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  672  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  673  	default:
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  674  		strcomp_status =3D "Unknown";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  675  		break;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  676  	}
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  677  =

fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  678  	if (!strcomp_status)
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  679  		return 0;
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  680  =

8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  681  	if (reg & PIO_NON_POSTED_REQ)
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30 @682  		str_posted =3D "Non-posted";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  683  	else
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  684  		str_posted =3D "Posted";
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  685  =

464de7e7fff767 drivers/pci/controller/pci-aardvark.c Marek Beh=C3=BAn      =
2021-10-05  686  	dev_dbg(dev, "%s PIO Response Status: %s, %#x @ %#x\n",
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  687  		str_posted, strcomp_status, reg, advk_readl(pcie, PIO_ADDR_LS=
));
fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  688  =

fcb461e2bc8b83 drivers/pci/controller/pci-aardvark.c Evan Wang        2021-=
07-22  689  	return -EFAULT;
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  690  }
8c39d710363c14 drivers/pci/host/pci-aardvark.c       Thomas Petazzoni 2016-=
06-30  691  =


:::::: The code at line 595 was first introduced by commit
:::::: 9aec2feaf787a766f802172e9021c7422029bc64 PCI: aardvark: Add local st=
ruct device pointers

:::::: TO: Bjorn Helgaas <bhelgaas@google.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4983299546159634001==--

