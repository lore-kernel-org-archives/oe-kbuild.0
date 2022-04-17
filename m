Content-Type: multipart/mixed; boundary="===============6648435531945263631=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/wwan_hwsim.c:286:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Sun, 17 Apr 2022 16:44:48 +0800
Message-ID: <202204171651.3XFL5mUb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6648435531945263631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Loic Poulain <loic.poulain@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a2c29ccd9477861b16ddc02c411a6c9665250558
commit: 89212e160b81e778f829b89743570665810e3b13 net: wwan: Fix WWAN config=
 symbols
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220417/202204171651.3XFL5mUb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D89212e160b81e778f829b89743570665810e3b13
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 89212e160b81e778f829b89743570665810e3b13
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/media/cec/core/cec-api.c:677:4: note: Loop condition is false.  =
Exiting loop
                           list_first_entry(&fh->msgs, struct cec_msg_entry=
, list);
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/media/cec/core/cec-api.c:679:3: note: Calling 'list_del'
                   list_del(&entry->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/fsi/fsi-core.c:719:4: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:719:4: note: Value stored to 'rc' is never read
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:724:2: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rc =3D count;
           ^    ~~~~~
   drivers/fsi/fsi-core.c:724:2: note: Value stored to 'rc' is never read
           rc =3D count;
           ^    ~~~~~
   drivers/fsi/fsi-core.c:753:4: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:753:4: note: Value stored to 'rc' is never read
                           rc =3D -EFAULT;
                           ^    ~~~~~~~
   drivers/fsi/fsi-core.c:761:2: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rc =3D count;
           ^    ~~~~~
   drivers/fsi/fsi-core.c:761:2: note: Value stored to 'rc' is never read
           rc =3D count;
           ^    ~~~~~
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
   3 warnings generated.
>> drivers/net/wwan/wwan_hwsim.c:286:3: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
                   wwan_hwsim_port_del(port);
                   ^
   drivers/net/wwan/wwan_hwsim.c:489:2: note: Calling 'wwan_hwsim_free_devs'
           wwan_hwsim_free_devs();
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wwan/wwan_hwsim.c:444:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&wwan_hwsim_devs)) {
           ^
   drivers/net/wwan/wwan_hwsim.c:445:9: note: Left side of '&&' is false
                   dev =3D list_first_entry(&wwan_hwsim_devs, struct wwan_h=
wsim_dev,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/wwan/wwan_hwsim.c:445:9: note: Taking false branch
                   dev =3D list_first_entry(&wwan_hwsim_devs, struct wwan_h=
wsim_dev,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/net/wwan/wwan_hwsim.c:445:9: note: Loop condition is false.  Exi=
ting loop
                   dev =3D list_first_entry(&wwan_hwsim_devs, struct wwan_h=
wsim_dev,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/net/wwan/wwan_hwsim.c:449:3: note: Calling 'wwan_hwsim_dev_del'
                   wwan_hwsim_dev_del(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wwan/wwan_hwsim.c:279:2: note: Loop condition is true.  Ente=
ring loop body
           while (!list_empty(&dev->ports)) {
           ^
   drivers/net/wwan/wwan_hwsim.c:282:10: note: Left side of '&&' is false
                   port =3D list_first_entry(&dev->ports, struct wwan_hwsim=
_port,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/wwan/wwan_hwsim.c:282:10: note: Taking false branch
                   port =3D list_first_entry(&dev->ports, struct wwan_hwsim=
_port,
                          ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)

vim +286 drivers/net/wwan/wwan_hwsim.c

f36a111a74e71ed Sergey Ryazanov 2021-06-08  273  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  274  static void wwan_hwsim_dev=
_del(struct wwan_hwsim_dev *dev)
f36a111a74e71ed Sergey Ryazanov 2021-06-08  275  {
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  276  	debugfs_remove(dev->debug=
fs_portcreate);	/* Avoid new ports */
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  277  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  278  	spin_lock(&dev->ports_loc=
k);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  279  	while (!list_empty(&dev->=
ports)) {
f36a111a74e71ed Sergey Ryazanov 2021-06-08  280  		struct wwan_hwsim_port *=
port;
f36a111a74e71ed Sergey Ryazanov 2021-06-08  281  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  282  		port =3D list_first_entr=
y(&dev->ports, struct wwan_hwsim_port,
f36a111a74e71ed Sergey Ryazanov 2021-06-08  283  					list);
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  284  		list_del_init(&port->lis=
t);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  285  		spin_unlock(&dev->ports_=
lock);
f36a111a74e71ed Sergey Ryazanov 2021-06-08 @286  		wwan_hwsim_port_del(port=
);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  287  		spin_lock(&dev->ports_lo=
ck);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  288  	}
f36a111a74e71ed Sergey Ryazanov 2021-06-08  289  	spin_unlock(&dev->ports_l=
ock);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  290  =

9ee23f48f6705ff Sergey Ryazanov 2021-06-08  291  	debugfs_remove(dev->debug=
fs_topdir);
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  292  =

9ee23f48f6705ff Sergey Ryazanov 2021-06-08  293  	/* Make sure that there i=
s no pending deletion work */
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  294  	if (current_work() !=3D &=
dev->del_work)
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  295  		cancel_work_sync(&dev->d=
el_work);
9ee23f48f6705ff Sergey Ryazanov 2021-06-08  296  =

f36a111a74e71ed Sergey Ryazanov 2021-06-08  297  	device_unregister(&dev->d=
ev);
f36a111a74e71ed Sergey Ryazanov 2021-06-08  298  	/* Memory will be freed i=
n the device release callback */
f36a111a74e71ed Sergey Ryazanov 2021-06-08  299  }
f36a111a74e71ed Sergey Ryazanov 2021-06-08  300  =


:::::: The code at line 286 was first introduced by commit
:::::: f36a111a74e71edbba27d4c0cf3d7bbccc172108 wwan_hwsim: WWAN device sim=
ulator

:::::: TO: Sergey Ryazanov <ryazanov.s.a@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6648435531945263631==--

