Content-Type: multipart/mixed; boundary="===============3774768518990207058=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/pmem.c:143:7: warning: Value stored to 'rc' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 23 Feb 2022 17:05:14 +0800
Message-ID: <202202231738.Itk7u3I6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3774768518990207058==
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
head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
commit: 21083f51521fb0f60dbac591f175c3ed48435af4 cxl/pmem: Register 'pmem' =
/ cxl_nvdimm devices
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220221 (https://download.01.org/0day-ci/arc=
hive/20220223/202202231738.Itk7u3I6-lkp(a)intel.com/config)
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
   drivers/bluetooth/btusb.c:2869:6: note: 'err' is 0
           if (err)
               ^~~
   drivers/bluetooth/btusb.c:2869:2: note: Taking false branch
           if (err)
           ^
   drivers/bluetooth/btusb.c:2874:8: note: Calling 'btusb_setup_intel_new_g=
et_fw_name'
           err =3D btusb_setup_intel_new_get_fw_name(&ver, &params, ddcname,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c:2414:2: note: Control jumps to 'case 12:'  at =
line 2416
           switch (ver->hw_variant) {
           ^
   drivers/bluetooth/btusb.c:2417:3: note: 5th function call argument is an=
 uninitialized value
                   snprintf(fw_name, len, "intel/ibt-%u-%u.%s",
                   ^
   drivers/bluetooth/btusb.c:3717:3: warning: Value stored to 'err' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   err =3D btusb_mtk_setup_firmware_79xx(hdev, fw_bin_name);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bluetooth/btusb.c:3717:3: note: Value stored to 'err' is never r=
ead
                   err =3D btusb_mtk_setup_firmware_79xx(hdev, fw_bin_name);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (4 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   fs/nilfs2/btree.c:377:2: warning: Value stored to 'flags' is never read =
[clang-analyzer-deadcode.DeadStores]
           flags =3D nilfs_btree_node_get_flags(node);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:377:2: note: Value stored to 'flags' is never read
           flags =3D nilfs_btree_node_get_flags(node);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:1430:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   fs/nilfs2/btree.c:1430:2: note: Value stored to 'ret' is never read
           ret =3D 0;
           ^     ~
   fs/nilfs2/btree.c:2332:7: warning: 1st function call argument is an unin=
itialized value [clang-analyzer-core.CallAndMessage]
           if (!buffer_dirty(bh))
                ^            ~~
   fs/nilfs2/btree.c:2312:2: note: 'bh' declared without an initial value
           struct buffer_head *bh;
           ^~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:2318:6: note: Assuming 'path' is not equal to NULL
           if (path =3D=3D NULL)
               ^~~~~~~~~~~~
   fs/nilfs2/btree.c:2318:2: note: Taking false branch
           if (path =3D=3D NULL)
           ^
   fs/nilfs2/btree.c:2322:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   fs/nilfs2/btree.c:2322:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/nilfs2/btree.c:2326:8: note: Calling 'nilfs_btree_get_block'
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:532:9: note: Calling '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:480:6: note: Assuming 'ret' is not equal to 0
           if (ret) {
               ^~~
   fs/nilfs2/btree.c:480:2: note: Taking true branch
           if (ret) {
           ^
   fs/nilfs2/btree.c:481:7: note: Assuming the condition is true
                   if (ret !=3D -EEXIST)
                       ^~~~~~~~~~~~~~
   fs/nilfs2/btree.c:481:3: note: Taking true branch
                   if (ret !=3D -EEXIST)
                   ^
   fs/nilfs2/btree.c:482:4: note: Returning without writing to '*bhp'
                           return ret;
                           ^
   fs/nilfs2/btree.c:532:9: note: Returning from '__nilfs_btree_get_block'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:532:2: note: Returning without writing to '*bhp'
           return __nilfs_btree_get_block(btree, ptr, bhp, NULL);
           ^
   fs/nilfs2/btree.c:2326:8: note: Returning from 'nilfs_btree_get_block'
           ret =3D nilfs_btree_get_block(btree, ptr, &bh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/btree.c:2327:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   fs/nilfs2/btree.c:2327:2: note: Taking false branch
           if (ret < 0) {
           ^
   fs/nilfs2/btree.c:2332:7: note: 1st function call argument is an uniniti=
alized value
           if (!buffer_dirty(bh))
                ^            ~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
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
--===============3774768518990207058==--

