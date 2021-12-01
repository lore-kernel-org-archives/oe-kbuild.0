Content-Type: multipart/mixed; boundary="===============3422868618805118891=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/megaraid/megaraid_sas_base.c:3156:2: warning: Value stored to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 02 Dec 2021 01:48:43 +0800
Message-ID: <202112020151.Y12EsJGV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3422868618805118891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kashyap Desai <kashyap.desai@broadcom.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: 9e4bec5b2a230066a0dc9f79f24b4c1bcb668c5a scsi: megaraid_sas: mq_pol=
l support
date:   9 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-c001-20211126 (https://download.01.org/0day-ci/arch=
ive/20211202/202112020151.Y12EsJGV-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9e4bec5b2a230066a0dc9f79f24b4c1bcb668c5a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9e4bec5b2a230066a0dc9f79f24b4c1bcb668c5a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~
   fs/f2fs/compress.c:1062:3: note: Taking true branch
                   if (ret)
                   ^
   fs/f2fs/compress.c:1063:4: note: Control jumps to line 1120
                           goto release_pages;
                           ^
   fs/f2fs/compress.c:1122:2: note: Returning without writing to '*fsdata'
           return ret;
           ^
   fs/f2fs/compress.c:1137:9: note: Returning from 'prepare_compress_overwr=
ite'
           return prepare_compress_overwrite(&cc, pagep, index, fsdata);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1137:2: note: Returning without writing to '*fsdata'
           return prepare_compress_overwrite(&cc, pagep, index, fsdata);
           ^
   fs/f2fs/compress.c:1179:8: note: Returning from 'f2fs_prepare_compress_o=
verwrite'
           err =3D f2fs_prepare_compress_overwrite(inode, &pagep,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1183:32: note: 'err' is not equal to 0
           f2fs_bug_on(F2FS_I_SB(inode), err =3D=3D 0);
                                         ^
   fs/f2fs/f2fs.h:32:44: note: expanded from macro 'f2fs_bug_on'
   #define f2fs_bug_on(sbi, condition)     BUG_ON(condition)
                                                  ^~~~~~~~~
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/f2fs/compress.c:1183:32: note: 'err' is not equal to 0
           f2fs_bug_on(F2FS_I_SB(inode), err =3D=3D 0);
                                         ^
   fs/f2fs/f2fs.h:32:44: note: expanded from macro 'f2fs_bug_on'
   #define f2fs_bug_on(sbi, condition)     BUG_ON(condition)
                                                  ^~~~~~~~~
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/f2fs/compress.c:1183:2: note: Taking false branch
           f2fs_bug_on(F2FS_I_SB(inode), err =3D=3D 0);
           ^
   fs/f2fs/f2fs.h:32:37: note: expanded from macro 'f2fs_bug_on'
   #define f2fs_bug_on(sbi, condition)     BUG_ON(condition)
                                           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/f2fs/compress.c:1183:2: note: Loop condition is false.  Exiting loop
           f2fs_bug_on(F2FS_I_SB(inode), err =3D=3D 0);
           ^
   fs/f2fs/f2fs.h:32:37: note: expanded from macro 'f2fs_bug_on'
   #define f2fs_bug_on(sbi, condition)     BUG_ON(condition)
                                           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   fs/f2fs/compress.c:1185:6: note: Assuming 'err' is > 0
           if (err <=3D 0)
               ^~~~~~~~
   fs/f2fs/compress.c:1185:2: note: Taking false branch
           if (err <=3D 0)
           ^
   fs/f2fs/compress.c:1188:6: note: 'err' is > 0
           if (err > 0) {
               ^~~
   fs/f2fs/compress.c:1188:2: note: Taking true branch
           if (err > 0) {
           ^
   fs/f2fs/compress.c:1189:3: note: 'rpages' initialized to a null pointer =
value
                   struct page **rpages =3D fsdata;
                   ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/compress.c:1193:30: note: Assuming 'i' is >=3D 0
                   for (i =3D cluster_size - 1; i >=3D 0; i--) {
                                              ^~~~~~
   fs/f2fs/compress.c:1193:3: note: Loop condition is true.  Entering loop =
body
                   for (i =3D cluster_size - 1; i >=3D 0; i--) {
                   ^
   fs/f2fs/compress.c:1194:19: note: Array access (from variable 'rpages') =
results in a null pointer dereference
                           loff_t start =3D rpages[i]->index << PAGE_SHIFT;
                                          ^~~~~~
   fs/f2fs/compress.c:1473:5: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                                   ret =3D 0;
                                   ^     ~
   fs/f2fs/compress.c:1473:5: note: Value stored to 'ret' is never read
                                   ret =3D 0;
                                   ^     ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/scsi/megaraid/megaraid_sas_base.c:3156:2: warning: Value stored =
to 'offset' is never read [clang-analyzer-deadcode.DeadStores]
           offset +=3D map->nr_queues;
           ^         ~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:3156:2: note: Value stored to =
'offset' is never read
           offset +=3D map->nr_queues;
           ^         ~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:3602:22: warning: Access to fi=
eld 'result' results in a dereference of a null pointer (loaded from field =
'scmd') [clang-analyzer-core.NullDereference]
                           cmd->scmd->result =3D DID_OK << 16;
                                             ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8815:3: note: Left side of '&&=
' is false
                   container_of(work, struct megasas_aen_event, hotplug_wor=
k.work);
                   ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8815:3: note: Taking false bra=
nch
                   container_of(work, struct megasas_aen_event, hotplug_wor=
k.work);
                   ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8815:3: note: Loop condition i=
s false.  Exiting loop
                   container_of(work, struct megasas_aen_event, hotplug_wor=
k.work);
                   ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8823:6: note: Assuming 'instan=
ce' is non-null
           if (!instance) {
               ^~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:8823:2: note: Taking false bra=
nch
           if (!instance) {
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8833:6: note: Assuming field '=
evt_detail' is non-null
           if (instance->evt_detail) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:8833:2: note: Taking true bran=
ch
           if (instance->evt_detail) {
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8836:3: note: Control jumps to=
 'case 303:'  at line 8858
                   switch (le32_to_cpu(instance->evt_detail->code)) {
                   ^
   drivers/scsi/megaraid/megaraid_sas_base.c:8859:15: note: Calling 'megasa=
s_get_ctrl_info'
                           dcmd_ret =3D megasas_get_ctrl_info(instance);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:5219:7: note: 'cmd' is non-null
           if (!cmd) {
                ^~~
   drivers/scsi/megaraid/megaraid_sas_base.c:5219:2: note: Taking false bra=
nch
           if (!cmd) {
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:5242:7: note: Assuming field '=
adapter_type' is equal to MFI_SERIES
           if ((instance->adapter_type !=3D MFI_SERIES) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:5242:45: note: Left side of '&=
&' is false
           if ((instance->adapter_type !=3D MFI_SERIES) &&
                                                      ^
   drivers/scsi/megaraid/megaraid_sas_base.c:5250:2: note: Control jumps to=
 'case DCMD_FAILED:'  at line 5332
           switch (ret) {
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:5333:3: note: Calling 'megarai=
d_sas_kill_hba'
                   megaraid_sas_kill_hba(instance);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:2177:6: note: Assuming the con=
dition is false
           if (atomic_read(&instance->adprecovery) =3D=3D MEGASAS_HW_CRITIC=
AL_ERROR) {
               ^
   include/asm-generic/atomic-instrumented.h:30:21: note: expanded from mac=
ro 'atomic_read'
   #define atomic_read atomic_read
                       ^
   drivers/scsi/megaraid/megaraid_sas_base.c:2177:2: note: Taking false bra=
nch
           if (atomic_read(&instance->adprecovery) =3D=3D MEGASAS_HW_CRITIC=
AL_ERROR) {
           ^
   drivers/scsi/megaraid/megaraid_sas_base.c:2187:7: note: Assuming field '=
device' is not equal to PCI_DEVICE_ID_LSI_SAS0073SKINNY
           if ((instance->pdev->device =3D=3D PCI_DEVICE_ID_LSI_SAS0073SKIN=
NY) ||
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/megaraid/megaraid_sas_base.c:2187:6: note: Left side of '||=
' is false
           if ((instance->pdev->device =3D=3D PCI_DEVICE_ID_LSI_SAS0073SKIN=
NY) ||

vim +/offset +3156 drivers/scsi/megaraid/megaraid_sas_base.c

cf62a0a543fbab drivers/scsi/megaraid/megaraid_sas.c      Sumant Patro      =
 2007-02-14  3136  =

81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3137  static int megasas_map_queues(struct Scsi_Host *shost)
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3138  {
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3139  	struct megasas_instance *instance;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3140  	int qoff =3D 0, offset;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3141  	struct blk_mq_queue_map *map;
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3142  =

81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3143  	instance =3D (struct megasas_instance *)shost->hostdata;
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3144  =

81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3145  	if (shost->nr_hw_queues =3D=3D 1)
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3146  		return 0;
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3147  =

9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3148  	offset =3D instance->low_latency_index_start;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3149  =

9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3150  	/* Setup Default hctx */
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3151  	map =3D &shost->tag_set.map[HCTX_TYPE_DEFAULT];
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3152  	map->nr_queues =3D instance->msix_vectors - offset;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3153  	map->queue_offset =3D 0;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3154  	blk_mq_pci_map_queues(map, instance->pdev, offset);
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3155  	qoff +=3D map->nr_queues;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15 @3156  	offset +=3D map->nr_queues;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3157  =

9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3158  	/* Setup Poll hctx */
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3159  	map =3D &shost->tag_set.map[HCTX_TYPE_POLL];
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3160  	map->nr_queues =3D instance->iopoll_q_count;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3161  	if (map->nr_queues) {
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3162  		/*
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3163  		 * The poll queue(s) doesn't have an IRQ (and hence IRQ
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3164  		 * affinity), so use the regular blk-mq cpu mapping
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3165  		 */
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3166  		map->queue_offset =3D qoff;
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3167  		blk_mq_map_queues(map);
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3168  	}
9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3169  =

9e4bec5b2a2300 drivers/scsi/megaraid/megaraid_sas_base.c Kashyap Desai     =
 2021-02-15  3170  	return 0;
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3171  }
81e7eb5bf08f36 drivers/scsi/megaraid/megaraid_sas_base.c Martin K. Petersen=
 2020-12-16  3172  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3422868618805118891==--

