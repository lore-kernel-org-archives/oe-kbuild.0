Content-Type: multipart/mixed; boundary="===============4320273174492903872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/qat/qat_4xxx/adf_drv.c:66:3: warning: Value stored to 'instances' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 16 Apr 2022 03:58:14 +0800
Message-ID: <202204160333.IELFF12V-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4320273174492903872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd
commit: 8893d27ffcaf6ec6267038a177cb87bcde4dd3de crypto: qat - disable regi=
stration of algorithms
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220416/202204160333.IELFF12V-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f=
560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8893d27ffcaf6ec6267038a177cb87bcde4dd3de
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8893d27ffcaf6ec6267038a177cb87bcde4dd3de
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skbuff.h:2167:2: note: Left side of '||' is false
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skbuff.h:2167:2: note: Left side of '||' is false
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/skbuff.h:2167:2: note: Left side of '||' is true
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/skbuff.h:2167:2: note: Taking false branch
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/skbuff.h:2167:2: note: Loop condition is false.  Exiting l=
oop
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skbuff.h:2167:2: note: Dereference of null pointer
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   2 warnings generated.
   drivers/mtd/devices/block2mtd.c:402:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/block2mtd.c:402:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/crypto/qat/qat_4xxx/adf_drv.c:66:3: warning: Value stored to 'in=
stances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D min(cpus, banks / 2);
                   ^
   drivers/crypto/qat/qat_4xxx/adf_drv.c:66:3: note: Value stored to 'insta=
nces' is never read
   drivers/crypto/qat/qat_4xxx/adf_drv.c:68:3: warning: Value stored to 'in=
stances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D 0;
                   ^           ~
   drivers/crypto/qat/qat_4xxx/adf_drv.c:68:3: note: Value stored to 'insta=
nces' is never read
                   instances =3D 0;
                   ^           ~
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/cifs/ioctl.c:334:4: warning: Value stored to 'caps' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                           caps =3D le64_to_cpu(tcon->fsUnixInfo.Capability=
);
                           ^
   fs/cifs/ioctl.c:334:4: note: Value stored to 'caps' is never read
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/nfs/nfs4session.c:127:10: warning: The left operand of '=3D=3D' is a =
garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (*p =3D=3D NULL) {
                          ^
   fs/nfs/nfs4session.c:405:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:406:8: note: Calling 'nfs41_try_wake_next_slot_tabl=
e_entry'
                   if (!nfs41_try_wake_next_slot_table_entry(tbl))
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:393:27: note: Calling 'nfs4_alloc_slot'
           struct nfs4_slot *slot =3D nfs4_alloc_slot(tbl);
                                    ^~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:247:2: note: Loop condition is false.  Exiting loop
           dprintk("--> %s used_slots=3D%04lx highest_used=3D%u max_slots=
=3D%u\n",
           ^
   include/linux/sunrpc/debug.h:25:2: note: expanded from macro 'dprintk'
           dfprintk(FACILITY, fmt, ##__VA_ARGS__)
           ^
   include/linux/sunrpc/debug.h:70:34: note: expanded from macro 'dfprintk'
   # define dfprintk(fac, fmt, ...)        do {} while (0)
                                           ^
   fs/nfs/nfs4session.c:251:6: note: Assuming 'slotid' is <=3D field 'max_s=
lotid'
           if (slotid <=3D tbl->max_slotid) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:251:2: note: Taking true branch
           if (slotid <=3D tbl->max_slotid) {
           ^
   fs/nfs/nfs4session.c:252:9: note: Calling 'nfs4_find_or_create_slot'
                   ret =3D nfs4_find_or_create_slot(tbl, slotid, 1, GFP_NOW=
AIT);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/nfs/nfs4session.c:126:2: note: Loop condition is true.  Entering loop=
 body
           for (;;) {
           ^
   fs/nfs/nfs4session.c:127:7: note: Assuming the condition is true
                   if (*p =3D=3D NULL) {
                       ^~~~~~~~~~
   fs/nfs/nfs4session.c:127:3: note: Taking true branch
                   if (*p =3D=3D NULL) {
                   ^
   fs/nfs/nfs4session.c:128:9: note: Calling 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Calling 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:715:9: note: Uninitialized value stored to field 'n=
ext'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:109:9: note: Returning from 'kzalloc'
           slot =3D kzalloc(sizeof(*slot), gfp_mask);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:110:6: note: Assuming 'slot' is non-null
           if (slot) {
               ^~~~
   fs/nfs/nfs4session.c:110:2: note: Taking true branch
           if (slot) {
           ^
   fs/nfs/nfs4session.c:128:9: note: Returning from 'nfs4_new_slot'
                           *p =3D nfs4_new_slot(tbl, tbl->max_slots,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:130:4: note: Taking false branch
                           if (*p =3D=3D NULL)
                           ^
   fs/nfs/nfs4session.c:135:7: note: Assuming 'slotid' is not equal to fiel=
d 'slot_nr'
                   if (slot->slot_nr =3D=3D slotid)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/nfs4session.c:135:3: note: Taking false branch
                   if (slot->slot_nr =3D=3D slotid)
                   ^
--
   drivers/media/tuners/mt20xx.c:395:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:395:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+12,2);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/comedi/drivers/mite.c:686:13: warning: Access to field 'next' re=
sults in a dereference of a null pointer (loaded from variable 'desc') [cla=
ng-analyzer-core.NullDereference]
           desc->next =3D cpu_to_le32(ring->dma_addr);
                      ^
   drivers/comedi/drivers/mite.c:724:6: note: Assuming field 'prealloc_bufs=
z' is not equal to 0
           if (async->prealloc_bufsz =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/mite.c:724:2: note: Taking false branch
           if (async->prealloc_bufsz =3D=3D 0)
           ^
   drivers/comedi/drivers/mite.c:732:6: note: Assuming 'descs' is non-null
           if (!descs) {
               ^~~~~~
   drivers/comedi/drivers/mite.c:732:2: note: Taking false branch
           if (!descs) {
           ^
   drivers/comedi/drivers/mite.c:740:9: note: Calling 'mite_init_ring_descr=
iptors'
           return mite_init_ring_descriptors(ring, s, n_links << PAGE_SHIFT=
);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/mite.c:654:2: note: 'desc' initialized to a null =
pointer value
           struct mite_dma_desc *desc =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/mite.c:659:2: note: Taking false branch
           dev_dbg(s->device->class_dev,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/comedi/drivers/mite.c:662:23: note: Assuming 'remainder' is <=3D=
 0
           if ((n_full_links + (remainder > 0 ? 1 : 0)) > ring->n_links) {
                                ^~~~~~~~~~~~~
   drivers/comedi/drivers/mite.c:662:23: note: '?' condition is false
   drivers/comedi/drivers/mite.c:662:6: note: Assuming the condition is fal=
se
           if ((n_full_links + (remainder > 0 ? 1 : 0)) > ring->n_links) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/comedi/drivers/mite.c:662:2: note: Taking false branch
           if ((n_full_links + (remainder > 0 ? 1 : 0)) > ring->n_links) {
           ^
   drivers/comedi/drivers/mite.c:669:14: note: Assuming 'i' is >=3D 'n_full=
_links'
           for (i =3D 0; i < n_full_links; ++i) {
                       ^~~~~~~~~~~~~~~~
   drivers/comedi/drivers/mite.c:669:2: note: Loop condition is false. Exec=
ution continues on line 678
           for (i =3D 0; i < n_full_links; ++i) {
           ^
   drivers/comedi/drivers/mite.c:678:6: note: 'remainder' is <=3D 0
           if (remainder > 0) {
               ^~~~~~~~~
   drivers/comedi/drivers/mite.c:678:2: note: Taking false branch
           if (remainder > 0) {
           ^
   drivers/comedi/drivers/mite.c:686:13: note: Access to field 'next' resul=
ts in a dereference of a null pointer (loaded from variable 'desc')
           desc->next =3D cpu_to_le32(ring->dma_addr);
           ~~~~       ^
   drivers/comedi/drivers/mite.c:841:3: warning: Value stored to 'wpdep' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   wpdep =3D BIT(wpdep);
                   ^
   drivers/comedi/drivers/mite.c:841:3: note: Value stored to 'wpdep' is ne=
ver read
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
   2 warnings generated.
   drivers/extcon/extcon-ptn5150.c:173:2: warning: Value stored to 'vendor_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           vendor_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VENDOR, reg_data);
           ^
   drivers/extcon/extcon-ptn5150.c:173:2: note: Value stored to 'vendor_id'=
 is never read
   drivers/extcon/extcon-ptn5150.c:174:2: warning: Value stored to 'version=
_id' is never read [clang-analyzer-deadcode.DeadStores]
           version_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VERSION, reg_data=
);
           ^
   drivers/extcon/extcon-ptn5150.c:174:2: note: Value stored to 'version_id=
' is never read
   1 warning generated.
   drivers/extcon/extcon-sm5502.c:24:8: warning: Excessive padding in 'stru=
ct muic_irq' (8 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   irq, =

   virq, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   drivers/extcon/extcon-sm5502.c:24:8: note: Excessive padding in 'struct =
muic_irq' (8 padding bytes, where 0 is optimal). Optimal fields order: name=
, irq, virq, consider reordering the fields or adding explicit padding memb=
ers
   struct muic_irq {
   ~~~~~~~^~~~~~~~~~
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/crypto/qat/qat_common/qat_crypto.c:152:3: warning: Value stored =
to 'instances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D min(cpus, banks);
                   ^
   drivers/crypto/qat/qat_common/qat_crypto.c:152:3: note: Value stored to =
'instances' is never read
   drivers/crypto/qat/qat_common/qat_crypto.c:154:3: warning: Value stored =
to 'instances' is never read [clang-analyzer-deadcode.DeadStores]
                   instances =3D 0;
                   ^           ~
   drivers/crypto/qat/qat_common/qat_crypto.c:154:3: note: Value stored to =
'instances' is never read
                   instances =3D 0;
                   ^           ~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-dev.c:1053:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-dev.c:1053:2: note: Value stored to 'ret' i=
s never read
           ret =3D video_register_media_controller(vdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/v4l2-core/v4l2-ioctl.c:3311:3: warning: Value stored to 'e=
rr' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D -EFAULT;
                   ^     ~~~~~~~
   drivers/media/v4l2-core/v4l2-ioctl.c:3311:3: note: Value stored to 'err'=
 is never read
                   err =3D -EFAULT;
                   ^     ~~~~~~~
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
   1 warning generated.
   drivers/hwmon/adm1026.c:1574:6: warning: Value stored to 'address' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           int address =3D client->addr;
               ^~~~~~~   ~~~~~~~~~~~~
   drivers/hwmon/adm1026.c:1574:6: note: Value stored to 'address' during i=
ts initialization is never read
           int address =3D client->addr;
               ^~~~~~~   ~~~~~~~~~~~~
   4 warnings generated.
   drivers/mtd/inftlmount.c:550:2: warning: Value stored to 'logical_block'=
 is never read [clang-analyzer-deadcode.DeadStores]
           logical_block =3D block =3D BLOCK_NIL;
           ^               ~~~~~~~~~~~~~~~~~
   drivers/mtd/inftlmount.c:550:2: note: Value stored to 'logical_block' is=
 never read
           logical_block =3D block =3D BLOCK_NIL;
           ^               ~~~~~~~~~~~~~~~~~
   drivers/mtd/inftlmount.c:550:18: warning: Although the value stored to '=
block' is used in the enclosing expression, the value is never actually rea=
d from 'block' [clang-analyzer-deadcode.DeadStores]
           logical_block =3D block =3D BLOCK_NIL;
                           ^
   drivers/mtd/inftlmount.c:550:18: note: Although the value stored to 'blo=
ck' is used in the enclosing expression, the value is never actually read f=
rom 'block'
   drivers/mtd/inftlmount.c:693:3: warning: Value stored to 'logical_block'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   logical_block =3D BLOCK_NIL;
                   ^
   drivers/mtd/inftlmount.c:693:3: note: Value stored to 'logical_block' is=
 never read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   fs/btrfs/free-space-tree.c:1476:3: warning: Value stored to 'total_found=
' is never read [clang-analyzer-deadcode.DeadStores]
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/btrfs/free-space-tree.c:1476:3: note: Value stored to 'total_found' i=
s never read
                   total_found +=3D add_new_free_space(block_group, extent_=
start,
                   ^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   1 warning generated.
   fs/btrfs/space-info.c:1565:3: warning: Value stored to 'used' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   fs/btrfs/space-info.c:1565:3: note: Value stored to 'used' is never read
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   1 warning generated.
   drivers/crypto/qat/qat_common/adf_gen4_pfvf.c:46:9: warning: Although th=
e value stored to 'sou' is used in the enclosing expression, the value is n=
ever actually read from 'sou' [clang-analyzer-deadcode.DeadStores]
           return sou &=3D ~mask;
                  ^      ~~~~~
   drivers/crypto/qat/qat_common/adf_gen4_pfvf.c:46:9: note: Although the v=
alue stored to 'sou' is used in the enclosing expression, the value is neve=
r actually read from 'sou'
           return sou &=3D ~mask;
                  ^      ~~~~~
   5 warnings generated.
   drivers/scsi/snic/snic_scsi.c:519:4: warning: Value stored to 'xfer_len'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           xfer_len -=3D le32_to_cpu(icmnd_cmpl->resid);
                           ^
   drivers/scsi/snic/snic_scsi.c:519:4: note: Value stored to 'xfer_len' is=
 never read
   drivers/scsi/snic/snic_scsi.c:1890:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D FAILED;
                   ^     ~~~~~~
   drivers/scsi/snic/snic_scsi.c:1890:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D FAILED;

vim +/instances +66 drivers/crypto/qat/qat_4xxx/adf_drv.c

0cec19c761e5cc Tomasz Kowalik   2021-12-16   54  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   55  static int adf_crypto_dev_=
config(struct adf_accel_dev *accel_dev)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   56  {
8c8268166e8342 Giovanni Cabiddu 2020-11-13   57  	char key[ADF_CFG_MAX_KEY_=
LEN_IN_BYTES];
8c8268166e8342 Giovanni Cabiddu 2020-11-13   58  	int banks =3D GET_MAX_BAN=
KS(accel_dev);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   59  	int cpus =3D num_online_c=
pus();
8c8268166e8342 Giovanni Cabiddu 2020-11-13   60  	unsigned long bank, val;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   61  	int instances;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   62  	int ret;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   63  	int i;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   64  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   65  	if (adf_hw_dev_has_crypto=
(accel_dev))
8c8268166e8342 Giovanni Cabiddu 2020-11-13  @66  		instances =3D min(cpus, =
banks / 2);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   67  	else
8c8268166e8342 Giovanni Cabiddu 2020-11-13   68  		instances =3D 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   69  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   70  	ret =3D adf_cfg_section_a=
dd(accel_dev, ADF_KERNEL_SEC);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   71  	if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   72  		goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   73  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   74  	ret =3D adf_cfg_section_a=
dd(accel_dev, "Accelerator0");
8c8268166e8342 Giovanni Cabiddu 2020-11-13   75  	if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   76  		goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   77  =

8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   78  	/* Temporarily set the nu=
mber of crypto instances to zero to avoid
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   79  	 * registering the crypto=
 algorithms.
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   80  	 * This will be removed w=
hen the algorithms will support the
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   81  	 * CRYPTO_TFM_REQ_MAY_BAC=
KLOG flag
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   82  	 */
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   83  	instances =3D 0;
8893d27ffcaf6e Giovanni Cabiddu 2022-03-04   84  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   85  	for (i =3D 0; i < instanc=
es; i++) {
8c8268166e8342 Giovanni Cabiddu 2020-11-13   86  		val =3D i;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   87  		bank =3D i * 2;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   88  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_BANK_NUM, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   89  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13   90  						  key, &bank, ADF_DE=
C);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   91  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   92  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   93  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13   94  		bank +=3D 1;
8c8268166e8342 Giovanni Cabiddu 2020-11-13   95  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_BANK_NUM, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   96  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13   97  						  key, &bank, ADF_DE=
C);
8c8268166e8342 Giovanni Cabiddu 2020-11-13   98  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13   99  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  100  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  101  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_ETRMGR_CORE_AFFINITY,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  102  			 i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  103  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  104  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  105  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  106  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  107  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  108  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_SIZE, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  109  		val =3D 128;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  110  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  111  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  112  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  113  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  114  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  115  		val =3D 512;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  116  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_SIZE, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  117  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  118  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  119  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  120  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  121  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  122  		val =3D 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  123  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_TX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  124  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  125  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  126  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  127  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  128  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  129  		val =3D 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  130  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_TX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  131  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  132  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  133  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  134  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  135  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  136  		val =3D 1;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  137  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_ASYM_RX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  138  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  139  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  140  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  141  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  142  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  143  		val =3D 1;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  144  		snprintf(key, sizeof(key=
), ADF_CY "%d" ADF_RING_SYM_RX, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  145  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, ADF_KERNEL_SEC,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  146  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  147  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  148  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  149  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  150  		val =3D ADF_COALESCING_D=
EF_TIME;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  151  		snprintf(key, sizeof(key=
), ADF_ETRMGR_COALESCE_TIMER_FORMAT, i);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  152  		ret =3D adf_cfg_add_key_=
value_param(accel_dev, "Accelerator0",
8c8268166e8342 Giovanni Cabiddu 2020-11-13  153  						  key, &val, ADF_DEC=
);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  154  		if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  155  			goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  156  	}
8c8268166e8342 Giovanni Cabiddu 2020-11-13  157  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  158  	val =3D i;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  159  	ret =3D adf_cfg_add_key_v=
alue_param(accel_dev, ADF_KERNEL_SEC, ADF_NUM_CY,
8c8268166e8342 Giovanni Cabiddu 2020-11-13  160  					  &val, ADF_DEC);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  161  	if (ret)
8c8268166e8342 Giovanni Cabiddu 2020-11-13  162  		goto err;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  163  =

8c8268166e8342 Giovanni Cabiddu 2020-11-13  164  	set_bit(ADF_STATUS_CONFIG=
URED, &accel_dev->status);
8c8268166e8342 Giovanni Cabiddu 2020-11-13  165  	return 0;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  166  err:
8c8268166e8342 Giovanni Cabiddu 2020-11-13  167  	dev_err(&GET_DEV(accel_de=
v), "Failed to start QAT accel dev\n");
8c8268166e8342 Giovanni Cabiddu 2020-11-13  168  	return ret;
8c8268166e8342 Giovanni Cabiddu 2020-11-13  169  }
8c8268166e8342 Giovanni Cabiddu 2020-11-13  170  =


:::::: The code at line 66 was first introduced by commit
:::::: 8c8268166e83425243789c5781c92e7fa33b703b crypto: qat - add qat_4xxx =
driver

:::::: TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4320273174492903872==--

