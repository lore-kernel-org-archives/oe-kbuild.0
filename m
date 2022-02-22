Content-Type: multipart/mixed; boundary="===============6779049488562453394=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/pmem.c:143:7: warning: Value stored to 'rc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 23 Feb 2022 00:52:43 +0800
Message-ID: <202202230052.LcyF8IAG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6779049488562453394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   038101e6b2cd5c55f888f85db42ea2ad3aecb4b6
commit: 21083f51521fb0f60dbac591f175c3ed48435af4 cxl/pmem: Register 'pmem' =
/ cxl_nvdimm devices
date:   8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220221 (https://download.01.org/0day-ci/arc=
hive/20220223/202202230052.LcyF8IAG-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D21083f51521fb0f60dbac591f175c3ed48435af4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 21083f51521fb0f60dbac591f175c3ed48435af4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                   ^
   fs/jfs/jfs_dtree.c:787:2: note: Assuming the condition is true
           DT_PUTPAGE(mp);
           ^
   fs/jfs/jfs_dtree.c:131:24: note: expanded from macro 'DT_PUTPAGE'
   #define DT_PUTPAGE(MP) BT_PUTPAGE(MP)
                          ^~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:87:8: note: expanded from macro 'BT_PUTPAGE'
           if (! BT_IS_ROOT(MP)) \
                 ^~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:47:25: note: expanded from macro 'BT_IS_ROOT'
   #define BT_IS_ROOT(MP) (((MP)->xflag & COMMIT_PAGE) =3D=3D 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:787:2: note: Taking false branch
           DT_PUTPAGE(mp);
           ^
   fs/jfs/jfs_dtree.c:131:24: note: expanded from macro 'DT_PUTPAGE'
   #define DT_PUTPAGE(MP) BT_PUTPAGE(MP)
                          ^
   fs/jfs/jfs_btree.h:87:2: note: expanded from macro 'BT_PUTPAGE'
           if (! BT_IS_ROOT(MP)) \
           ^
   fs/jfs/jfs_dtree.c:4528:12: note: Returning from 'dtSearch'
           if ((rc =3D dtSearch(ip, key, orig_ino, &btstack, flag)))
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:4528:7: note: Assuming 'rc' is 0
           if ((rc =3D dtSearch(ip, key, orig_ino, &btstack, flag)))
                ^~
   fs/jfs/jfs_dtree.c:4528:2: note: Taking false branch
           if ((rc =3D dtSearch(ip, key, orig_ino, &btstack, flag)))
           ^
   fs/jfs/jfs_dtree.c:4532:2: note: Assigned value is garbage or undefined
           DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
           ^
   fs/jfs/jfs_dtree.c:134:2: note: expanded from macro 'DT_GETSEARCH'
           BT_GETSEARCH(IP, LEAF, BN, MP, dtpage_t, P, INDEX, i_dtroot)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:144:5: note: expanded from macro 'BT_GETSEARCH'
           BN =3D (LEAF)->bn;\
              ^ ~~~~~~~~~~
   fs/jfs/jfs_types.h:67:33: warning: The left operand of '&' is a garbage =
value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(0xffffff)) |
                                          ^
   fs/jfs/jfs_dtree.c:946:7: note: Assuming the condition is false
           sp =3D DT_PAGE(ip, smp);
                ^
   fs/jfs/jfs_dtree.c:111:25: note: expanded from macro 'DT_PAGE'
   #define DT_PAGE(IP, MP) BT_PAGE(IP, MP, dtpage_t, i_dtroot)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:51:3: note: expanded from macro 'BT_PAGE'
           (BT_IS_ROOT(MP) ? (TYPE *)&JFS_IP(IP)->ROOT : (TYPE *)(MP)->data)
            ^~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:47:25: note: expanded from macro 'BT_IS_ROOT'
   #define BT_IS_ROOT(MP) (((MP)->xflag & COMMIT_PAGE) =3D=3D 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:946:7: note: '?' condition is false
           sp =3D DT_PAGE(ip, smp);
                ^
   fs/jfs/jfs_dtree.c:111:25: note: expanded from macro 'DT_PAGE'
   #define DT_PAGE(IP, MP) BT_PAGE(IP, MP, dtpage_t, i_dtroot)
                           ^
   fs/jfs/jfs_btree.h:51:3: note: expanded from macro 'BT_PAGE'
           (BT_IS_ROOT(MP) ? (TYPE *)&JFS_IP(IP)->ROOT : (TYPE *)(MP)->data)
            ^
   fs/jfs/jfs_btree.h:47:24: note: expanded from macro 'BT_IS_ROOT'
   #define BT_IS_ROOT(MP) (((MP)->xflag & COMMIT_PAGE) =3D=3D 0)
                          ^
   fs/jfs/jfs_dtree.c:949:6: note: Assuming field 'name' is non-null
           if (!key.name) {
               ^~~~~~~~~
   fs/jfs/jfs_dtree.c:949:2: note: Taking false branch
           if (!key.name) {
           ^
   fs/jfs/jfs_dtree.c:964:6: note: Assuming the condition is true
           if (sp->header.flag & BT_ROOT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:964:2: note: Taking true branch
           if (sp->header.flag & BT_ROOT) {
           ^
   fs/jfs/jfs_dtree.c:972:7: note: Assuming 'n' is > field 'nslot'
                   if (n <=3D split->nslot)
                       ^~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:972:3: note: Taking false branch
                   if (n <=3D split->nslot)
                   ^
   fs/jfs/jfs_dtree.c:974:8: note: Assuming 'rc' is 0
                   if ((rc =3D dbAlloc(ip, 0, (s64) xlen, &xaddr))) {
                        ^~
   fs/jfs/jfs_dtree.c:974:3: note: Taking false branch
                   if ((rc =3D dbAlloc(ip, 0, (s64) xlen, &xaddr))) {
                   ^
   fs/jfs/jfs_dtree.c:982:3: note: Calling 'PXDaddress'
                   PXDaddress(pxd, xaddr);
                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_types.h:67:33: note: The left operand of '&' is a garbage val=
ue
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(0xffffff)) |
                            ~~~~~~~~~~~~~ ^
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/cxl/pmem.c:143:7: warning: Value stored to 'rc' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
                   int rc =3D bus_rescan_devices(&cxl_bus_type);
                       ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/pmem.c:143:7: note: Value stored to 'rc' during its initiali=
zation is never read
                   int rc =3D bus_rescan_devices(&cxl_bus_type);
                       ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/ata/libata-core.c:92:8: warning: Excessive padding in 'struct at=
a_force_param' (12 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   name, =

   xfer_mask, =

   horkage_on, =

   horkage_off, =

   lflags, =

   cbl, =

   spd_limit, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ata_force_param {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:92:8: note: Excessive padding in 'struct ata_f=
orce_param' (12 padding bytes, where 4 is optimal). Optimal fields order: n=
ame, xfer_mask, horkage_on, horkage_off, lflags, cbl, spd_limit, consider r=
eordering the fields or adding explicit padding members
   struct ata_force_param {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:4544:7: warning: Access to field 'ap' results =
in a dereference of a null pointer (loaded from variable 'qc') [clang-analy=
zer-core.NullDereference]
           ap =3D qc->ap;
                ^~
   drivers/ata/libata-core.c:4543:15: note: Assuming 'qc' is equal to null
           WARN_ON_ONCE(qc =3D=3D NULL); /* ata_qc_from_tag _might_ return =
NULL */
                        ^
   include/asm-generic/bug.h:201:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ~~~~~~~~^~~~~~~~~~
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/ata/libata-core.c:4544:7: note: Access to field 'ap' results in =
a dereference of a null pointer (loaded from variable 'qc')
           ap =3D qc->ap;
                ^~
   drivers/ata/libata-core.c:5454:18: warning: Access to field 'pio_mask' r=
esults in a dereference of a null pointer (loaded from variable 'pi') [clan=
g-analyzer-core.NullDereference]
                   ap->pio_mask =3D pi->pio_mask;
                                  ^~
   drivers/ata/libata-core.c:5445:6: note: Assuming 'host' is non-null
           if (!host)
               ^~~~~
   drivers/ata/libata-core.c:5445:2: note: Taking false branch
           if (!host)
           ^
   drivers/ata/libata-core.c:5448:21: note: Null pointer value stored to 'p=
i'
           for (i =3D 0, j =3D 0, pi =3D NULL; i < host->n_ports; i++) {
                              ^~~~~~~~~
   drivers/ata/libata-core.c:5448:32: note: Assuming 'i' is < field 'n_port=
s'
           for (i =3D 0, j =3D 0, pi =3D NULL; i < host->n_ports; i++) {
                                         ^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5448:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0, j =3D 0, pi =3D NULL; i < host->n_ports; i++) {
           ^
   drivers/ata/libata-core.c:5451:7: note: Assuming the condition is false
                   if (ppi[j])
                       ^~~~~~
   drivers/ata/libata-core.c:5451:3: note: Taking false branch
                   if (ppi[j])
                   ^
   drivers/ata/libata-core.c:5454:18: note: Access to field 'pio_mask' resu=
lts in a dereference of a null pointer (loaded from variable 'pi')
                   ap->pio_mask =3D pi->pio_mask;
                                  ^~
   drivers/ata/libata-core.c:5576:6: warning: Access to field 'host_stop' r=
esults in a dereference of a null pointer (loaded from field 'ops') [clang-=
analyzer-core.NullDereference]
           if (host->ops->host_stop)
               ^
   drivers/ata/libata-core.c:5823:7: note: Calling 'ata_host_start'
           rc =3D ata_host_start(host);
                ^~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5559:6: note: Assuming the condition is false
           if (host->flags & ATA_HOST_STARTED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5559:2: note: Taking false branch
           if (host->flags & ATA_HOST_STARTED)
           ^
   drivers/ata/libata-core.c:5564:14: note: Assuming 'i' is < field 'n_port=
s'
           for (i =3D 0; i < host->n_ports; i++) {
                       ^~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5564:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < host->n_ports; i++) {
           ^
   drivers/ata/libata-core.c:5569:7: note: Assuming field 'ops' is null
                   if (!host->ops && !ata_port_is_dummy(ap))
                       ^~~~~~~~~~
   drivers/ata/libata-core.c:5569:7: note: Assuming pointer value is null
                   if (!host->ops && !ata_port_is_dummy(ap))
                       ^~~~~~~~~~
   drivers/ata/libata-core.c:5569:7: note: Left side of '&&' is true
   drivers/ata/libata-core.c:5569:21: note: Assuming the condition is false
                   if (!host->ops && !ata_port_is_dummy(ap))
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5569:3: note: Taking false branch
                   if (!host->ops && !ata_port_is_dummy(ap))
                   ^
   drivers/ata/libata-core.c:5572:7: note: Assuming field 'port_stop' is nu=
ll
                   if (ap->ops->port_stop)
                       ^~~~~~~~~~~~~~~~~~
   drivers/ata/libata-core.c:5572:3: note: Taking false branch

vim +/rc +143 drivers/cxl/pmem.c

8fdcb1704f61a8 Dan Williams 2021-06-15  112  =

8fdcb1704f61a8 Dan Williams 2021-06-15  113  static void cxl_nvb_update_sta=
te(struct work_struct *work)
8fdcb1704f61a8 Dan Williams 2021-06-15  114  {
8fdcb1704f61a8 Dan Williams 2021-06-15  115  	struct cxl_nvdimm_bridge *cxl=
_nvb =3D
8fdcb1704f61a8 Dan Williams 2021-06-15  116  		container_of(work, typeof(*c=
xl_nvb), state_work);
21083f51521fb0 Dan Williams 2021-06-15  117  	struct nvdimm_bus *victim_bus=
 =3D NULL;
21083f51521fb0 Dan Williams 2021-06-15  118  	bool release =3D false, resca=
n =3D false;
8fdcb1704f61a8 Dan Williams 2021-06-15  119  =

8fdcb1704f61a8 Dan Williams 2021-06-15  120  	device_lock(&cxl_nvb->dev);
8fdcb1704f61a8 Dan Williams 2021-06-15  121  	switch (cxl_nvb->state) {
8fdcb1704f61a8 Dan Williams 2021-06-15  122  	case CXL_NVB_ONLINE:
8fdcb1704f61a8 Dan Williams 2021-06-15  123  		if (!online_nvdimm_bus(cxl_n=
vb)) {
8fdcb1704f61a8 Dan Williams 2021-06-15  124  			dev_err(&cxl_nvb->dev,
8fdcb1704f61a8 Dan Williams 2021-06-15  125  				"failed to establish nvdim=
m bus\n");
8fdcb1704f61a8 Dan Williams 2021-06-15  126  			release =3D true;
21083f51521fb0 Dan Williams 2021-06-15  127  		} else
21083f51521fb0 Dan Williams 2021-06-15  128  			rescan =3D true;
8fdcb1704f61a8 Dan Williams 2021-06-15  129  		break;
8fdcb1704f61a8 Dan Williams 2021-06-15  130  	case CXL_NVB_OFFLINE:
8fdcb1704f61a8 Dan Williams 2021-06-15  131  	case CXL_NVB_DEAD:
21083f51521fb0 Dan Williams 2021-06-15  132  		victim_bus =3D cxl_nvb->nvdi=
mm_bus;
21083f51521fb0 Dan Williams 2021-06-15  133  		cxl_nvb->nvdimm_bus =3D NULL;
8fdcb1704f61a8 Dan Williams 2021-06-15  134  		break;
8fdcb1704f61a8 Dan Williams 2021-06-15  135  	default:
8fdcb1704f61a8 Dan Williams 2021-06-15  136  		break;
8fdcb1704f61a8 Dan Williams 2021-06-15  137  	}
8fdcb1704f61a8 Dan Williams 2021-06-15  138  	device_unlock(&cxl_nvb->dev);
8fdcb1704f61a8 Dan Williams 2021-06-15  139  =

8fdcb1704f61a8 Dan Williams 2021-06-15  140  	if (release)
8fdcb1704f61a8 Dan Williams 2021-06-15  141  		device_release_driver(&cxl_n=
vb->dev);
21083f51521fb0 Dan Williams 2021-06-15  142  	if (rescan) {
21083f51521fb0 Dan Williams 2021-06-15 @143  		int rc =3D bus_rescan_device=
s(&cxl_bus_type);
21083f51521fb0 Dan Williams 2021-06-15  144  =

21083f51521fb0 Dan Williams 2021-06-15  145  		dev_dbg(&cxl_nvb->dev, "resc=
an: %d\n", rc);
21083f51521fb0 Dan Williams 2021-06-15  146  	}
21083f51521fb0 Dan Williams 2021-06-15  147  	offline_nvdimm_bus(victim_bus=
);
8fdcb1704f61a8 Dan Williams 2021-06-15  148  =

8fdcb1704f61a8 Dan Williams 2021-06-15  149  	put_device(&cxl_nvb->dev);
8fdcb1704f61a8 Dan Williams 2021-06-15  150  }
8fdcb1704f61a8 Dan Williams 2021-06-15  151  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6779049488562453394==--

