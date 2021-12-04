Content-Type: multipart/mixed; boundary="===============0290534390748217709=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [toke:xdp-traffic-gen-01 6/8] net/bpf/test_run.c:30:2: warning: Excessive padding in 'struct bpf_test_timer::(unnamed at net/bpf/test_run.c:30:2)' (54 padding bytes, where 22 is optimal).
Date: Sat, 04 Dec 2021 20:03:16 +0800
Message-ID: <202112041936.QwqdC2Tc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0290534390748217709==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-=
traffic-gen-01
head:   9d97ef92c1e2b1808898e817203409c3b5bb68fa
commit: 87e1824a874a236d6506bf22b313c9a8f1199a7d [6/8] bpf: Add XDP_REDIREC=
T support to XDP for bpf_prog_run()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20211203 (https://download.01.org/0day-ci/archi=
ve/20211204/202112041936.QwqdC2Tc-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fca=
df07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/co=
mmit/?id=3D87e1824a874a236d6506bf22b313c9a8f1199a7d
        git remote add toke https://git.kernel.org/pub/scm/linux/kernel/git=
/toke/linux.git
        git fetch --no-tags toke xdp-traffic-gen-01
        git checkout 87e1824a874a236d6506bf22b313c9a8f1199a7d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/core/device.c:237:2: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:765:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:565:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   sound/core/device.c:226:17: note: Assuming 'card' is non-null
           if (snd_BUG_ON(!card))
                          ^
   include/sound/core.h:401:35: note: expanded from macro 'snd_BUG_ON'
   #define snd_BUG_ON(cond)        WARN_ON((cond))
                                            ^~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/core/device.c:226:2: note: Taking false branch
           if (snd_BUG_ON(!card))
           ^
   sound/core/device.c:228:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:764:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:230:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_CONTROL
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:7: note: Left side of '||' is false
   sound/core/device.c:231:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_LOWLEVEL
                       dev->type =3D=3D SNDRV_DEV_LOWLEVEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:3: note: Taking false branch
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                   ^
   sound/core/device.c:233:3: note: Calling '__snd_device_free'
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:6: note: Assuming field 'dev_free' is null
           if (dev->ops->dev_free) {
               ^~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:2: note: Taking false branch
           if (dev->ops->dev_free) {
           ^
   sound/core/device.c:79:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   sound/core/device.c:233:3: note: Returning; memory was released via 1st =
parameter
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:228:2: note: Loop condition is false. Execution cont=
inues on line 237
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:764:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:237:2: note: Use of memory after it is freed
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:765:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:565:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iio/adc/ad7266.c:157:3: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ad7266_read_single(st, val, chan->address);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7266.c:157:3: note: Value stored to 'ret' is never read
                   ret =3D ad7266_read_single(st, val, chan->address);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
>> net/bpf/test_run.c:30:2: warning: Excessive padding in 'struct bpf_test_=
timer::(unnamed at net/bpf/test_run.c:30:2)' (54 padding bytes, where 22 is=
 optimal). =

   Optimal fields order: =

   rxq, =

   orig_ctx, =

   pp, =

   frame_cnt, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
           struct {
           ^~~~~~~~
   net/bpf/test_run.c:30:2: note: Excessive padding in 'struct bpf_test_tim=
er::(unnamed at net/bpf/test_run.c:30:2)' (54 padding bytes, where 22 is op=
timal). Optimal fields order: rxq, orig_ctx, pp, frame_cnt, consider reorde=
ring the fields or adding explicit padding members
           struct {
           ^~~~~~~~
   Suppressed 20 warnings (8 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/ethtool/ioctl.c:2117:4: warning: Called function pointer is null (nu=
ll dereference) [clang-analyzer-core.CallAndMessage]
                           ops->get_ethtool_phy_stats(dev, &stats, data);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2087:6: note: Assuming 'phydev' is non-null
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
               ^~~~~~~
   net/ethtool/ioctl.c:2087:14: note: Left side of '&&' is false
           if (!phydev && (!ops->get_ethtool_phy_stats || !ops->get_sset_co=
unt))
                       ^
   net/ethtool/ioctl.c:2090:11: note: Field 'phydev' is non-null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                    ^
   net/ethtool/ioctl.c:2090:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2090:21: note: Assuming field 'get_ethtool_phy_stats=
' is null
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2090:6: note: Left side of '&&' is true
           if (dev->phydev && !ops->get_ethtool_phy_stats &&
               ^
   net/ethtool/ioctl.c:2091:6: note: Assuming 'phy_ops' is null
               phy_ops && phy_ops->get_sset_count)
               ^~~~~~~
   net/ethtool/ioctl.c:2091:14: note: Left side of '&&' is false
               phy_ops && phy_ops->get_sset_count)
                       ^
   net/ethtool/ioctl.c:2095:6: note: Assuming 'n_stats' is >=3D 0
           if (n_stats < 0)
               ^~~~~~~~~~~
   net/ethtool/ioctl.c:2095:2: note: Taking false branch
           if (n_stats < 0)
           ^
   net/ethtool/ioctl.c:2097:6: note: Assuming the condition is false
           if (n_stats > S32_MAX / sizeof(u64))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ethtool/ioctl.c:2097:2: note: Taking false branch
           if (n_stats > S32_MAX / sizeof(u64))
           ^
   net/ethtool/ioctl.c:2099:15: note: Assuming 'n_stats' is not equal to 0
           WARN_ON_ONCE(!n_stats);
                        ^
   include/asm-generic/bug.h:179:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/ethtool/ioctl.c:2101:6: note: Calling 'copy_from_user'
           if (copy_from_user(&stats, useraddr, sizeof(stats)))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:6: note: Assuming the condition is false
           if (likely(check_copy_size(to, n, false)))
               ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Calling 'should_fail_usercopy'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/fault-inject-usercopy.h:18:49: note: Returning zero, which=
 participates in a condition later
   static inline bool should_fail_usercopy(void) { return false; }
                                                   ^~~~~~~~~~~~
   include/linux/uaccess.h:157:7: note: Returning from 'should_fail_usercop=
y'
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:23:50: note: expanded from macro '__branch_chec=
k__'
   #define __branch_check__(x, expect, is_constant) ({                     \

vim +30 net/bpf/test_run.c

e950e843367d79 Matt Mullins           2019-04-26  25  =

607b9cc92bd720 Lorenz Bauer           2021-03-03  26  struct bpf_test_timer=
 {
87e1824a874a23 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  27  	enum { NO_=
PREEMPT, NO_MIGRATE, XDP } mode;
607b9cc92bd720 Lorenz Bauer           2021-03-03  28  	u32 i;
607b9cc92bd720 Lorenz Bauer           2021-03-03  29  	u64 time_start, time=
_spent;
87e1824a874a23 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08 @30  	struct {
87e1824a874a23 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  31  		struct xd=
p_buff *orig_ctx;
87e1824a874a23 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  32  		struct xd=
p_rxq_info rxq;
87e1824a874a23 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  33  		struct pa=
ge_pool *pp;
87e1824a874a23 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  34  		u16 frame=
_cnt;
87e1824a874a23 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  35  	} xdp;
607b9cc92bd720 Lorenz Bauer           2021-03-03  36  };
607b9cc92bd720 Lorenz Bauer           2021-03-03  37  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0290534390748217709==--

