Content-Type: multipart/mixed; boundary="===============2348265099485671141=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pci-aardvark.c:595:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 13 Mar 2022 22:35:05 +0800
Message-ID: <202203132225.vKAkPROX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2348265099485671141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Marek Beh=C3=BAn" <kabel@kernel.org>
CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aad611a868d16cdc16a7d4a764cef955293e47e3
commit: 464de7e7fff767e87429cd7be09c4f2cb50a6ccb PCI: aardvark: Don't spam =
about PIO Response Status
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220307 (https://download.01.org/0day-ci/arc=
hive/20220313/202203132225.vKAkPROX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
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
   drivers/gpu/drm/savage/savage_bci.c:987:9: note: Returning from 'savage_=
freelist_get'
                   buf =3D savage_freelist_get(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:988:8: note: 'buf' is non-null
                   if (!buf)
                        ^~~
   drivers/gpu/drm/savage/savage_bci.c:988:3: note: Taking false branch
                   if (!buf)
                   ^
   drivers/gpu/drm/savage/savage_bci.c:993:7: note: Assuming the condition =
is false
                   if (copy_to_user(&d->request_indices[i],
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:993:3: note: Taking false branch
                   if (copy_to_user(&d->request_indices[i],
                   ^
   drivers/gpu/drm/savage/savage_bci.c:996:7: note: Assuming the condition =
is false
                   if (copy_to_user(&d->request_sizes[i],
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:996:3: note: Taking false branch
                   if (copy_to_user(&d->request_sizes[i],
                   ^
   drivers/gpu/drm/savage/savage_bci.c:986:29: note: Assuming 'i' is < fiel=
d 'request_count'
           for (i =3D d->granted_count; i < d->request_count; i++) {
                                      ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:986:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D d->granted_count; i < d->request_count; i++) {
           ^
   drivers/gpu/drm/savage/savage_bci.c:987:9: note: Calling 'savage_freelis=
t_get'
                   buf =3D savage_freelist_get(dev);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Field 'status_ptr' is n=
on-null
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:562:16: note: expanded from macro 'U=
PDATE_EVENT_COUNTER'
           if (dev_priv->status_ptr) {                     \
                         ^
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Taking true branch
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:562:2: note: expanded from macro 'UP=
DATE_EVENT_COUNTER'
           if (dev_priv->status_ptr) {                     \
           ^
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: 'count' is >=3D field '=
event_counter'
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:566:7: note: expanded from macro 'UP=
DATE_EVENT_COUNTER'
                   if (count < dev_priv->event_counter)    \
                       ^~~~~
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Taking false branch
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:566:3: note: expanded from macro 'UP=
DATE_EVENT_COUNTER'
                   if (count < dev_priv->event_counter)    \
                   ^
   drivers/gpu/drm/savage/savage_bci.c:256:2: note: Loop condition is false=
.  Exiting loop
           UPDATE_EVENT_COUNTER();
           ^
   drivers/gpu/drm/savage/savage_drv.h:561:33: note: expanded from macro 'U=
PDATE_EVENT_COUNTER'
   #define UPDATE_EVENT_COUNTER( ) do {                    \
                                   ^
   drivers/gpu/drm/savage/savage_bci.c:257:16: note: Field 'status_ptr' is =
non-null
           if (dev_priv->status_ptr)
                         ^
   drivers/gpu/drm/savage/savage_bci.c:257:2: note: Taking true branch
           if (dev_priv->status_ptr)
           ^
   drivers/gpu/drm/savage/savage_bci.c:262:6: note: 'event' is <=3D field '=
event_counter'
           if (event > dev_priv->event_counter)
               ^~~~~
   drivers/gpu/drm/savage/savage_bci.c:262:2: note: Taking false branch
           if (event > dev_priv->event_counter)
           ^
   drivers/gpu/drm/savage/savage_bci.c:268:12: note: Field 'buf' is non-null
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
                     ^
   drivers/gpu/drm/savage/savage_bci.c:268:6: note: Left side of '&&' is tr=
ue
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
               ^
   drivers/gpu/drm/savage/savage_bci.c:268:20: note: 'wrap' is > field 'wra=
p'
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
                             ^
   drivers/gpu/drm/savage/savage_drv.h:578:18: note: expanded from macro 'T=
EST_AGE'
           ( (age)->wrap < (w) || ( (age)->wrap =3D=3D (w) && (age)->event =
<=3D (e) ) )
                           ^~~
   drivers/gpu/drm/savage/savage_bci.c:268:20: note: Left side of '||' is t=
rue
           if (tail->buf && (TEST_AGE(&tail->age, event, wrap) || event =3D=
=3D 0)) {
                             ^
   drivers/gpu/drm/savage/savage_drv.h:578:22: note: expanded from macro 'T=
EST_AGE'
           ( (age)->wrap < (w) || ( (age)->wrap =3D=3D (w) && (age)->event =
<=3D (e) ) )
                               ^
   drivers/gpu/drm/savage/savage_bci.c:270:3: note: 'prev' initialized to a=
 null pointer value
                   drm_savage_buf_priv_t *prev =3D tail->prev;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/savage/savage_bci.c:271:14: note: Access to field 'next'=
 results in a dereference of a null pointer (loaded from variable 'prev')
                   prev->next =3D next;
                   ~~~~       ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
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
   drivers/pci/controller/pci-aardvark.c:1439:21: warning: The result of th=
e left shift is undefined because the right operand is negative [clang-anal=
yzer-core.UndefinedBinaryOperatorResult]
                           win_size =3D (1ULL << (fls64(size)-1)) |
                                            ^  ~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:1396:6: note: Assuming 'bridge' is=
 non-null
           if (!bridge)
               ^~~~~~~
   drivers/pci/controller/pci-aardvark.c:1396:2: note: Taking false branch
           if (!bridge)
           ^
   drivers/pci/controller/pci-aardvark.c:1403:2: note: Left side of '&&' is=
 false
           resource_list_for_each_entry(entry, &bridge->windows) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
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
   drivers/pci/controller/pci-aardvark.c:1403:2: note: Taking false branch
           resource_list_for_each_entry(entry, &bridge->windows) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/pci/controller/pci-aardvark.c:1403:2: note: Loop condition is fa=
lse.  Exiting loop
           resource_list_for_each_entry(entry, &bridge->windows) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
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
   drivers/pci/controller/pci-aardvark.c:1403:2: note: Loop condition is tr=
ue.  Entering loop body
           resource_list_for_each_entry(entry, &bridge->windows) {
           ^
   include/linux/resource_ext.h:64:2: note: expanded from macro 'resource_l=
ist_for_each_entry'
           list_for_each_entry((entry), (list), node)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/controller/pci-aardvark.c:1415:7: note: Assuming 'type' is e=
qual to IORESOURCE_MEM
                   if (type !=3D IORESOURCE_MEM && type !=3D IORESOURCE_MEM=
_64 &&
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-aardvark.c:1415:30: note: Left side of '&&' i=
s false
                   if (type !=3D IORESOURCE_MEM && type !=3D IORESOURCE_MEM=
_64 &&
                                              ^
   drivers/pci/controller/pci-aardvark.c:1424:8: note: 'type' is equal to I=
ORESOURCE_MEM
                   if ((type =3D=3D IORESOURCE_MEM || type =3D=3D IORESOURC=
E_MEM_64) &&
                        ^~~~

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
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2348265099485671141==--

