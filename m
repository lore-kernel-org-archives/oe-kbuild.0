Content-Type: multipart/mixed; boundary="===============2871656661119183269=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/qat/qat_4xxx/adf_drv.c:66:3: warning: Value stored to 'instances' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 12 Apr 2022 08:41:04 +0800
Message-ID: <202204120841.GsX6fmUp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2871656661119183269==
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
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: 8893d27ffcaf6ec6267038a177cb87bcde4dd3de crypto: qat - disable regi=
stration of algorithms
date:   5 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c007-20220411 (https://download.01.org/0day-ci/ar=
chive/20220412/202204120841.GsX6fmUp-lkp(a)intel.com/config)
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
           if (WARN_ON_ONCE(!first))
           ^
   net/ipv6/route.c:4748:10: note: Calling 'rt6_multipath_total_weight'
           total =3D rt6_multipath_total_weight(first);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4692:2: note: 'total' initialized to 0
           int total =3D 0;
           ^~~~~~~~~
   net/ipv6/route.c:4694:2: note: Taking false branch
           if (!rt6_is_dead(rt))
           ^
   net/ipv6/route.c:4697:2: note: Loop condition is false. Execution contin=
ues on line 4702
           list_for_each_entry(iter, &rt->fib6_siblings, fib6_siblings) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   net/ipv6/route.c:4702:2: note: Returning zero (loaded from 'total')
           return total;
           ^~~~~~~~~~~~
   net/ipv6/route.c:4748:10: note: Returning from 'rt6_multipath_total_weig=
ht'
           total =3D rt6_multipath_total_weight(first);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4748:2: note: The value 0 is assigned to 'total'
           total =3D rt6_multipath_total_weight(first);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4749:39: note: Passing the value 0 via 2nd parameter 't=
otal'
           rt6_multipath_upper_bound_set(first, total);
                                                ^~~~~
   net/ipv6/route.c:4749:2: note: Calling 'rt6_multipath_upper_bound_set'
           rt6_multipath_upper_bound_set(first, total);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4722:35: note: Passing the value 0 via 3rd parameter 't=
otal'
           rt6_upper_bound_set(rt, &weight, total);
                                            ^~~~~
   net/ipv6/route.c:4722:2: note: Calling 'rt6_upper_bound_set'
           rt6_upper_bound_set(rt, &weight, total);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4709:2: note: Taking true branch
           if (!rt6_is_dead(rt)) {
           ^
   net/ipv6/route.c:4711:17: note: '__d' initialized to 0
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:102:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           typeof(divisor) __d =3D divisor;                  \
           ^~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4711:17: note: '__base' initialized to 0
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:46:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                               \
           ^~~~~~~~~~~~~~~
   net/ipv6/route.c:4711:17: note: Division by zero
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:48:26: note: expanded from macro 'do_div'
           __rem =3D ((uint64_t)(n)) % __base;                       \
                   ~~~~~~~~~~~~~~~~^~~~~~~~
   net/ipv6/route.c:5937:11: warning: Although the value stored to 'count' =
is used in the enclosing expression, the value is never actually read from =
'count' [clang-analyzer-deadcode.DeadStores]
                           return count +=3D w.count;
                                  ^        ~~~~~~~
   net/ipv6/route.c:5937:11: note: Although the value stored to 'count' is =
used in the enclosing expression, the value is never actually read from 'co=
unt'
                           return count +=3D w.count;
                                  ^        ~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/base/dd.c:689:2: warning: Value stored to 'calltime' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:689:2: note: Value stored to 'calltime' is never read
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:691:2: warning: Value stored to 'rettime' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:691:2: note: Value stored to 'rettime' is never read
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:1085:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/dd.c:1085:2: note: Value stored to 'ret' is never read
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/base/platform.c:578:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:578:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/input/joystick/tmdc.c:76:21: warning: Excessive padding in 'stru=
ct tmdc_model' (13 padding bytes, where 5 is optimal). =

   Optimal fields order: =

   name, =

   axes, =

   buttons, =

   id, =

   abs, =

   hats, =

   btnc, =

   btno, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct tmdc_model {
                ~~~~~~~^~~~~~~~~~~~
   drivers/input/joystick/tmdc.c:76:21: note: Excessive padding in 'struct =
tmdc_model' (13 padding bytes, where 5 is optimal). Optimal fields order: n=
ame, axes, buttons, id, abs, hats, btnc, btno, consider reordering the fiel=
ds or adding explicit padding members
   static const struct tmdc_model {
                ~~~~~~~^~~~~~~~~~~~
   2 warnings generated.
   drivers/leds/leds-pca9532.c:516:23: warning: Value stored to 'data' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-pca9532.c:516:23: note: Value stored to 'data' during =
its initialization is never read
           struct pca9532_data *data =3D i2c_get_clientdata(client);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   Suppressed 3 warnings (3 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
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
   drivers/firmware/dmi-sysfs.c:635:2: warning: Use of memory after it is f=
reed [clang-analyzer-unix.Malloc]
           kobject_put(entry->child);
           ^           ~~~~~~~~~~~~
   drivers/firmware/dmi-sysfs.c:587:6: note: Assuming the condition is false
           if (*ret)
               ^~~~
   drivers/firmware/dmi-sysfs.c:587:2: note: Taking false branch
           if (*ret)
           ^
--
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
   4 warnings generated.
   drivers/gpu/drm/i915/i915_pmu.c:1046:19: warning: Value stored to 'pmu' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i915_pmu *pmu =3D hlist_entry_safe(node, typeof(*pmu), cp=
uhp.node);
                            ^~~
   drivers/gpu/drm/i915/i915_pmu.c:1046:19: note: Value stored to 'pmu' dur=
ing its initialization is never read
           struct i915_pmu *pmu =3D hlist_entry_safe(node, typeof(*pmu), cp=
uhp.node);
                            ^~~
   Suppressed 3 warnings (3 in non-user code).
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
   6 warnings generated.
   drivers/media/tuners/mt20xx.c:253:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:253:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:263:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:265:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:383:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+1,4);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/tuners/mt20xx.c:391:2: note: Value stored to 'ret' is neve=
r read
           ret=3Dtuner_i2c_xfer_send(&priv->i2c_props,buf+5,6);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   drivers/hwmon/fschmd.c:757:7: warning: Access to field 'client' results =
in a dereference of a null pointer (loaded from variable 'data') [clang-ana=
lyzer-core.NullDereference]
           if (!data->client) {
                ^
   drivers/hwmon/fschmd.c:796:28: note: 'data' initialized to a null pointe=
r value
           struct fschmd_data *pos, *data =3D NULL;
                                     ^~~~
   drivers/hwmon/fschmd.c:805:6: note: Assuming the condition is false
           if (!mutex_trylock(&watchdog_data_mutex))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/fschmd.c:805:2: note: Taking false branch
           if (!mutex_trylock(&watchdog_data_mutex))
           ^
   drivers/hwmon/fschmd.c:807:2: note: Loop condition is false. Execution c=
ontinues on line 814
           list_for_each_entry(pos, &watchdog_data_list, list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/hwmon/fschmd.c:815:6: note: Assuming 'watchdog_is_open' is 0
           if (!watchdog_is_open)
               ^~~~~~~~~~~~~~~~~
   drivers/hwmon/fschmd.c:815:2: note: Taking true branch
           if (!watchdog_is_open)
           ^
   drivers/hwmon/fschmd.c:819:6: note: 'watchdog_is_open' is 0
           if (watchdog_is_open)
               ^~~~~~~~~~~~~~~~
   drivers/hwmon/fschmd.c:819:2: note: Taking false branch
           if (watchdog_is_open)
           ^
   drivers/hwmon/fschmd.c:823:19: note: Passing null pointer value via 1st =
parameter 'data'
           watchdog_trigger(data);
                            ^~~~
   drivers/hwmon/fschmd.c:823:2: note: Calling 'watchdog_trigger'
           watchdog_trigger(data);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/fschmd.c:757:7: note: Access to field 'client' results in =
a dereference of a null pointer (loaded from variable 'data')
           if (!data->client) {
                ^~~~
   3 warnings generated.
   drivers/staging/media/av7110/av7110_av.c:638:2: warning: Value stored to=
 'c2' is never read [clang-analyzer-deadcode.DeadStores]
           c2 =3D 0;
           ^    ~
   drivers/staging/media/av7110/av7110_av.c:638:2: note: Value stored to 'c=
2' is never read
           c2 =3D 0;
           ^    ~
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
                   ^     ~~~~~~
   drivers/scsi/snic/snic_scsi.c:1955:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]

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
--===============2871656661119183269==--

