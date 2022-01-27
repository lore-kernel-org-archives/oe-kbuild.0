Content-Type: multipart/mixed; boundary="===============7579323906270451421=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: warning: Value stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 27 Jan 2022 19:58:00 +0800
Message-ID: <202201271949.lEgOVTo1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7579323906270451421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yannick Vignon <yannick.vignon@nxp.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 8a7cb245cf28cb3e541e0d6c8624b95d079e155b net: stmmac: Do not enable=
 RX FIFO overflow interrupts
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220122 (https://download.01.org/0day-ci/archi=
ve/20220127/202201271949.lEgOVTo1-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8a7cb245cf28cb3e541e0d6c8624b95d079e155b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8a7cb245cf28cb3e541e0d6c8624b95d079e155b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/nsproxy.c:544:9: note: Returning from 'check_setns_flags'
                   err =3D check_setns_flags(flags);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:548:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/nsproxy.c:548:2: note: Taking false branch
           if (err)
           ^
   kernel/nsproxy.c:551:8: note: Calling 'prepare_nsset'
           err =3D prepare_nsset(flags, &nsset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:317:2: note: Taking false branch
           if (IS_ERR(nsset->nsproxy))
           ^
   kernel/nsproxy.c:320:6: note: Assuming the condition is true
           if (flags & CLONE_NEWUSER)
               ^~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:320:2: note: Taking true branch
           if (flags & CLONE_NEWUSER)
           ^
   kernel/nsproxy.c:324:6: note: Assuming field 'cred' is non-null
           if (!nsset->cred)
               ^~~~~~~~~~~~
   kernel/nsproxy.c:324:2: note: Taking false branch
           if (!nsset->cred)
           ^
   kernel/nsproxy.c:328:6: note: 'flags' is not equal to CLONE_NEWNS
           if (flags =3D=3D CLONE_NEWNS) {
               ^~~~~
   kernel/nsproxy.c:328:2: note: Taking false branch
           if (flags =3D=3D CLONE_NEWNS) {
           ^
   kernel/nsproxy.c:330:13: note: Assuming the condition is false
           } else if (flags & CLONE_NEWNS) {
                      ^~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:330:9: note: Taking false branch
           } else if (flags & CLONE_NEWNS) {
                  ^
   kernel/nsproxy.c:337:2: note: Returning zero, which participates in a co=
ndition later
           return 0;
           ^~~~~~~~
   kernel/nsproxy.c:551:8: note: Returning from 'prepare_nsset'
           err =3D prepare_nsset(flags, &nsset);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:552:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/nsproxy.c:552:2: note: Taking false branch
           if (err)
           ^
   kernel/nsproxy.c:555:6: note: Assuming the condition is true
           if (proc_ns_file(file))
               ^~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:555:2: note: Taking true branch
           if (proc_ns_file(file))
           ^
   kernel/nsproxy.c:556:29: note: Passing null pointer value via 2nd parame=
ter 'ns'
                   err =3D validate_ns(&nsset, ns);
                                             ^~
   kernel/nsproxy.c:556:9: note: Calling 'validate_ns'
                   err =3D validate_ns(&nsset, ns);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/nsproxy.c:346:9: note: Access to field 'ops' results in a derefer=
ence of a null pointer (loaded from variable 'ns')
           return ns->ops->install(nsset, ns);
                  ^~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3572:3: warning: Value=
 stored to 'irq_err' is never read [clang-analyzer-deadcode.DeadStores]
                   irq_err =3D REQ_IRQ_ERR_MAC;
                   ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3572:3: note: Value st=
ored to 'irq_err' is never read
                   irq_err =3D REQ_IRQ_ERR_MAC;
                   ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3586:4: warning: Value=
 stored to 'irq_err' is never read [clang-analyzer-deadcode.DeadStores]
                           irq_err =3D REQ_IRQ_ERR_WOL;
                           ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3586:4: note: Value st=
ored to 'irq_err' is never read
                           irq_err =3D REQ_IRQ_ERR_WOL;
                           ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4890:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4890:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5087:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5087:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5088:3: warning: Value=
 stored to 'buf2_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf2_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5088:3: note: Value st=
ored to 'buf2_len' is never read
                   buf2_len =3D 0;
                   ^          ~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: warning: Value=
 stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D stmmac_host_mtl_irq_status(priv, priv=
->hw,
                           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: note: Value st=
ored to 'status' is never read
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5655:14: warning: Acce=
ss to field 'dev' results in a dereference of a null pointer (loaded from v=
ariable 'priv') [clang-analyzer-core.NullDereference]
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5651:2: note: 'dev' in=
itialized here
           struct net_device *dev =3D (struct net_device *)dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5652:41: note: Passing=
 'dev' via 1st parameter 'dev'
           struct stmmac_priv *priv =3D netdev_priv(dev);
                                                  ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5652:2: note: 'priv' i=
nitialized here
           struct stmmac_priv *priv =3D netdev_priv(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5654:15: note: Assumin=
g 'dev' is null
           if (unlikely(!dev)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5654:2: note: Taking t=
rue branch
           if (unlikely(!dev)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5655:14: note: Access =
to field 'dev' results in a dereference of a null pointer (loaded from vari=
able 'priv')
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5675:14: warning: Acce=
ss to field 'dev' results in a dereference of a null pointer (loaded from v=
ariable 'priv') [clang-analyzer-core.NullDereference]
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5671:2: note: 'dev' in=
itialized here
           struct net_device *dev =3D (struct net_device *)dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5672:41: note: Passing=
 'dev' via 1st parameter 'dev'
           struct stmmac_priv *priv =3D netdev_priv(dev);
                                                  ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5672:2: note: 'priv' i=
nitialized here
           struct stmmac_priv *priv =3D netdev_priv(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5674:15: note: Assumin=
g 'dev' is null
           if (unlikely(!dev)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5674:2: note: Taking t=
rue branch
           if (unlikely(!dev)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5675:14: note: Access =
to field 'dev' results in a dereference of a null pointer (loaded from vari=
able 'priv')
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   include/linux/math64.h:91:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:242:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5796:6: note: Assuming=
 the condition is false
           if (!netif_running(dev))
               ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5796:2: note: Taking f=
alse branch
           if (!netif_running(dev))
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5799:2: note: Control =
jumps to 'case 35248:'  at line 5805
           switch (cmd) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5806:9: note: Calling =
'stmmac_hwtstamp_set'
                   ret =3D stmmac_hwtstamp_set(dev, rq);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:621:2: note: 'sec_inc'=
 initialized to 0
           u32 sec_inc =3D 0;
           ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:625:9: note: Assuming =
field 'has_gmac4' is 0
           xmac =3D priv->plat->has_gmac4 || priv->plat->has_xgmac;
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:625:9: note: Left side=
 of '||' is false
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:8: note: Assuming =
field 'time_stamp' is 0
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:8: note: Left side=
 of '||' is false
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:6: note: Assuming =
the condition is false
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:2: note: Taking fa=
lse branch
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:635:6: note: Calling '=
copy_from_user'
           if (copy_from_user(&config, ifr->ifr_data,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
   include/linux/uaccess.h:157:2: note: Taking true branch
--
   include/kunit/test.h:380:31: note: Left side of '&&' is false
           struct kunit_resource *res =3D container_of(kref, struct kunit_r=
esource,
                                        ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   include/kunit/test.h:380:31: note: Taking false branch
           struct kunit_resource *res =3D container_of(kref, struct kunit_r=
esource,
                                        ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/kunit/test.h:380:31: note: Loop condition is false.  Exiting loop
           struct kunit_resource *res =3D container_of(kref, struct kunit_r=
esource,
                                        ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/kunit/test.h:384:6: note: Assuming field 'free' is non-null
           if (res->free) {
               ^~~~~~~~~
   include/kunit/test.h:384:2: note: Taking true branch
           if (res->free) {
           ^
   include/kunit/test.h:386:3: note: Memory is released
                   kfree(res);
                   ^~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/kunit/test.h:404:2: note: Returning; memory was released
           kref_put(&res->refcount, kunit_release_resource);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:554:2: note: Returning; memory was released via 1st par=
ameter
           kunit_put_resource(res);
           ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:623:2: note: Returning; memory was released via 2nd par=
ameter
           kunit_remove_resource(test, res);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:625:2: note: Use of memory after it is freed
           kunit_put_resource(res);
           ^                  ~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3572:3: warning: Value=
 stored to 'irq_err' is never read [clang-analyzer-deadcode.DeadStores]
                   irq_err =3D REQ_IRQ_ERR_MAC;
                   ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3572:3: note: Value st=
ored to 'irq_err' is never read
                   irq_err =3D REQ_IRQ_ERR_MAC;
                   ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3586:4: warning: Value=
 stored to 'irq_err' is never read [clang-analyzer-deadcode.DeadStores]
                           irq_err =3D REQ_IRQ_ERR_WOL;
                           ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3586:4: note: Value st=
ored to 'irq_err' is never read
                           irq_err =3D REQ_IRQ_ERR_WOL;
                           ^         ~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4890:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:4890:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5087:3: warning: Value=
 stored to 'buf1_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5087:3: note: Value st=
ored to 'buf1_len' is never read
                   buf1_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5088:3: warning: Value=
 stored to 'buf2_len' is never read [clang-analyzer-deadcode.DeadStores]
                   buf2_len =3D 0;
                   ^          ~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5088:3: note: Value st=
ored to 'buf2_len' is never read
                   buf2_len =3D 0;
                   ^          ~
>> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: warning: Value=
 stored to 'status' is never read [clang-analyzer-deadcode.DeadStores]
                           status =3D stmmac_host_mtl_irq_status(priv, priv=
->hw,
                           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5600:4: note: Value st=
ored to 'status' is never read
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5655:14: warning: Acce=
ss to field 'dev' results in a dereference of a null pointer (loaded from v=
ariable 'priv') [clang-analyzer-core.NullDereference]
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5651:2: note: 'dev' in=
itialized here
           struct net_device *dev =3D (struct net_device *)dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5652:41: note: Passing=
 'dev' via 1st parameter 'dev'
           struct stmmac_priv *priv =3D netdev_priv(dev);
                                                  ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5652:2: note: 'priv' i=
nitialized here
           struct stmmac_priv *priv =3D netdev_priv(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5654:15: note: Assumin=
g 'dev' is null
           if (unlikely(!dev)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5654:2: note: Taking t=
rue branch
           if (unlikely(!dev)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5655:14: note: Access =
to field 'dev' results in a dereference of a null pointer (loaded from vari=
able 'priv')
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5675:14: warning: Acce=
ss to field 'dev' results in a dereference of a null pointer (loaded from v=
ariable 'priv') [clang-analyzer-core.NullDereference]
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5671:2: note: 'dev' in=
itialized here
           struct net_device *dev =3D (struct net_device *)dev_id;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5672:41: note: Passing=
 'dev' via 1st parameter 'dev'
           struct stmmac_priv *priv =3D netdev_priv(dev);
                                                  ^~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5672:2: note: 'priv' i=
nitialized here
           struct stmmac_priv *priv =3D netdev_priv(dev);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5674:15: note: Assumin=
g 'dev' is null
           if (unlikely(!dev)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5674:2: note: Taking t=
rue branch
           if (unlikely(!dev)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5675:14: note: Access =
to field 'dev' results in a dereference of a null pointer (loaded from vari=
able 'priv')
                   netdev_err(priv->dev, "%s: invalid dev pointer\n", __fun=
c__);
                              ^~~~
   include/linux/math64.h:91:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:242:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5796:6: note: Assuming=
 the condition is false
           if (!netif_running(dev))
               ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5796:2: note: Taking f=
alse branch
           if (!netif_running(dev))
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5799:2: note: Control =
jumps to 'case 35248:'  at line 5805
           switch (cmd) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5806:9: note: Calling =
'stmmac_hwtstamp_set'
                   ret =3D stmmac_hwtstamp_set(dev, rq);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:621:2: note: 'sec_inc'=
 initialized to 0
           u32 sec_inc =3D 0;
           ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:625:9: note: Assuming =
field 'has_gmac4' is 0
           xmac =3D priv->plat->has_gmac4 || priv->plat->has_xgmac;
                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:625:9: note: Left side=
 of '||' is false
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:8: note: Assuming =
field 'time_stamp' is 0
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:8: note: Left side=
 of '||' is false
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:6: note: Assuming =
the condition is false
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:627:2: note: Taking fa=
lse branch
           if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
           ^
   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:635:6: note: Calling '=
copy_from_user'
           if (copy_from_user(&config, ifr->ifr_data,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Assuming the condition is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
   include/linux/uaccess.h:157:2: note: Taking true branch

vim +/status +5600 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5561  =

29e6573c61aaa71 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-26  5562  static void stmmac_common_interrupt(struct stm=
mac_priv *priv)
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro  2009-10-14  5563  {
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5564  	u32 rx_cnt =3D priv->plat->rx_queues_to_use;
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5565  	u32 tx_cnt =3D priv->plat->tx_queues_to_use;
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5566  	u32 queues_count;
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5567  	u32 queue;
7d9e6c5afab6bfb drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u          2018-08-08  5568  	bool xmac;
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5569  =

7d9e6c5afab6bfb drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u          2018-08-08  5570  	xmac =3D priv->plat->has_gmac4 || priv->plat-=
>has_xgmac;
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5571  	queues_count =3D (rx_cnt > tx_cnt) ? rx_cnt :=
 tx_cnt;
47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro  2009-10-14  5572  =

89f7f2cfdd7ade5 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Srinivas =
Kandagatla 2014-01-16  5573  	if (priv->irq_wake)
89f7f2cfdd7ade5 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Srinivas =
Kandagatla 2014-01-16  5574  		pm_wakeup_event(priv->device, 0);
89f7f2cfdd7ade5 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Srinivas =
Kandagatla 2014-01-16  5575  =

e49aa315cb01828 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Voon Weif=
eng        2021-03-18  5576  	if (priv->dma_cap.estsel)
9f298959191b0a3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-18  5577  		stmmac_est_irq_status(priv, priv->ioaddr, pr=
iv->dev,
9f298959191b0a3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-18  5578  				      &priv->xstats, tx_cnt);
e49aa315cb01828 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Voon Weif=
eng        2021-03-18  5579  =

5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5580  	if (priv->dma_cap.fpesel) {
5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5581  		int status =3D stmmac_fpe_irq_status(priv, p=
riv->ioaddr,
5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5582  						   priv->dev);
5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5583  =

5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5584  		stmmac_fpe_event_status(priv, status);
5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5585  	}
5a5586112b92954 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-24  5586  =

47dd7a540b8a0cd drivers/net/stmmac/stmmac_main.c                  Giuseppe =
Cavallaro  2009-10-14  5587  	/* To handle GMAC own interrupts */
7d9e6c5afab6bfb drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u          2018-08-08  5588  	if ((priv->plat->has_gmac) || xmac) {
c10d4c82a5c84c2 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Jose Abre=
u          2018-04-16  5589  		int status =3D stmmac_host_irq_status(priv, =
priv->hw, &priv->xstats);
8f71a88d3619db0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-10  5590  =

d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2012-06-27  5591  		if (unlikely(status)) {
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2012-06-27  5592  			/* For LPI we need to save the tx status */
0982a0f6d1be5f0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2013-03-26  5593  			if (status & CORE_IRQ_TX_PATH_IN_LPI_MODE)
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2012-06-27  5594  				priv->tx_path_in_lpi_mode =3D true;
0982a0f6d1be5f0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2013-03-26  5595  			if (status & CORE_IRQ_TX_PATH_EXIT_LPI_MODE)
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2012-06-27  5596  				priv->tx_path_in_lpi_mode =3D false;
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5597  		}
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5598  =

7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5599  		for (queue =3D 0; queue < queues_count; queu=
e++) {
8a7cb245cf28cb3 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Yannick V=
ignon      2021-05-06 @5600  			status =3D stmmac_host_mtl_irq_status(priv,=
 priv->hw,
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5601  							    queue);
7bac4e1ec3ca234 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Joao Pint=
o          2017-03-15  5602  		}
70523e639bf8ca0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2016-06-24  5603  =

70523e639bf8ca0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2016-06-24  5604  		/* PCS link status */
3fe5cadbd3494b9 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2016-06-24  5605  		if (priv->hw->pcs) {
70523e639bf8ca0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2016-06-24  5606  			if (priv->xstats.pcs_link)
29e6573c61aaa71 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-26  5607  				netif_carrier_on(priv->dev);
70523e639bf8ca0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2016-06-24  5608  			else
29e6573c61aaa71 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-26  5609  				netif_carrier_off(priv->dev);
29e6573c61aaa71 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Ong Boon =
Leong      2021-03-26  5610  		}
f4da56529da6020 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan Tee M=
in         2021-04-14  5611  =

f4da56529da6020 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Tan Tee M=
in         2021-04-14  5612  		stmmac_timestamp_interrupt(priv, priv);
70523e639bf8ca0 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2016-06-24  5613  	}
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2012-06-27  5614  }
d765955d2ae0b88 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c Giuseppe =
CAVALLARO  2012-06-27  5615  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7579323906270451421==--

