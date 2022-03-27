Content-Type: multipart/mixed; boundary="===============7560154604630653035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 336/2399] kernel/locking/test-ww_mutex.c:172:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 27 Mar 2022 14:16:07 +0800
Message-ID: <202203271438.PM4bsZrq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7560154604630653035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   28355ba25d3468058a5470273bc7b9c8b411b958
commit: 53956aadc1f3755f43e9a8d6741cb2b1d4c58ac6 [336/2399] kernel/locking:=
 Add context to ww_mutex_trylock()
:::::: branch date: 6 days ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220327/202203271438.PM4bsZrq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel/linux-intel-lts/commit/53956aadc1f3755f4=
3e9a8d6741cb2b1d4c58ac6
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 53956aadc1f3755f43e9a8d6741cb2b1d4c58ac6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/arm/kernel/devtree.c:227:2: note: Value assigned to 'mdesc'
           mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mac=
h);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:229:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/devtree.c:229:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/devtree.c:239:10: note: Assuming 'size' is <=3D 0
                   while (size > 0) {
                          ^~~~~~~~
   arch/arm/kernel/devtree.c:239:3: note: Loop condition is false. Executio=
n continues on line 244
                   while (size > 0) {
                   ^
   arch/arm/kernel/devtree.c:250:6: note: Access to field 'dt_fixup' result=
s in a dereference of a null pointer (loaded from variable 'mdesc')
           if (mdesc->dt_fixup)
               ^~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
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
   2 warnings generated.
   drivers/phy/motorola/phy-mapphone-mdm6600.c:424:3: warning: Value stored=
 to 'error' is never read [clang-analyzer-deadcode.DeadStores]
                   error =3D -ETIMEDOUT;
                   ^       ~~~~~~~~~~
   drivers/phy/motorola/phy-mapphone-mdm6600.c:424:3: note: Value stored to=
 'error' is never read
                   error =3D -ETIMEDOUT;
                   ^       ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/phy/qualcomm/phy-qcom-qusb2.c:562:17: warning: Value stored to '=
dev' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct device *dev =3D &qphy->phy->dev;
                          ^~~   ~~~~~~~~~~~~~~~
   drivers/phy/qualcomm/phy-qcom-qusb2.c:562:17: note: Value stored to 'dev=
' during its initialization is never read
           struct device *dev =3D &qphy->phy->dev;
                          ^~~   ~~~~~~~~~~~~~~~
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
   drivers/phy/ralink/phy-mt7621-pci.c:120:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D phy->dev;
                          ^~~   ~~~~~~~~
   drivers/phy/ralink/phy-mt7621-pci.c:120:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D phy->dev;
                          ^~~   ~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> kernel/locking/test-ww_mutex.c:172:2: warning: Undefined or garbage valu=
e returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   kernel/locking/test-ww_mutex.c:625:2: note: Loop condition is false.  Ex=
iting loop
           printk(KERN_INFO "Beginning ww mutex selftests\n");
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   kernel/locking/test-ww_mutex.c:628:6: note: Assuming 'wq' is non-null
           if (!wq)
               ^~~
   kernel/locking/test-ww_mutex.c:628:2: note: Taking false branch
           if (!wq)
           ^
   kernel/locking/test-ww_mutex.c:632:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   kernel/locking/test-ww_mutex.c:632:2: note: Taking false branch
           if (ret)
           ^
   kernel/locking/test-ww_mutex.c:636:6: note: 'ret' is 0
           if (ret)
               ^~~
   kernel/locking/test-ww_mutex.c:636:2: note: Taking false branch
           if (ret)
           ^
   kernel/locking/test-ww_mutex.c:639:8: note: Calling 'test_aa'
           ret =3D test_aa(true);
                 ^~~~~~~~~~~~~
   kernel/locking/test-ww_mutex.c:125:2: note: 'ret' declared without an in=
itial value
           int ret;
           ^~~~~~~
   kernel/locking/test-ww_mutex.c:126:21: note: 'trylock' is true
           const char *from =3D trylock ? "trylock" : "lock";
                              ^~~~~~~
   kernel/locking/test-ww_mutex.c:126:21: note: '?' condition is true
   kernel/locking/test-ww_mutex.c:131:7: note: 'trylock' is true
           if (!trylock) {
                ^~~~~~~
   kernel/locking/test-ww_mutex.c:131:2: note: Taking false branch
           if (!trylock) {
           ^
   kernel/locking/test-ww_mutex.c:138:7: note: Assuming the condition is tr=
ue
                   if (!ww_mutex_trylock(&mutex, &ctx)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/test-ww_mutex.c:138:3: note: Taking true branch
                   if (!ww_mutex_trylock(&mutex, &ctx)) {
                   ^
   kernel/locking/test-ww_mutex.c:139:4: note: Loop condition is false.  Ex=
iting loop
                           pr_err("%s: initial trylock failed!\n", __func__=
);
                           ^
   include/linux/printk.h:493:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   kernel/locking/test-ww_mutex.c:140:4: note: Control jumps to line 171
                           goto out;
                           ^
   kernel/locking/test-ww_mutex.c:172:2: note: Undefined or garbage value r=
eturned to caller
           return ret;
           ^      ~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   lib/mpi/mpi-pow.c:164:10: warning: The result of the left shift is undef=
ined due to shifting by '32', which is greater or equal to the width of typ=
e 'mpi_limb_t' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   e =3D (e << c) << 1;      /* shift the exp bits to the l=
eft, lose msb */
                          ^  ~
   lib/mpi/mpi-pow.c:49:6: note: Assuming 'msize' is not equal to 0
           if (!msize)
               ^~~~~~
   lib/mpi/mpi-pow.c:49:2: note: Taking false branch
           if (!msize)
           ^
   lib/mpi/mpi-pow.c:52:6: note: Assuming 'esize' is not equal to 0
           if (!esize) {
               ^~~~~~
   lib/mpi/mpi-pow.c:52:2: note: Taking false branch
           if (!esize) {
           ^
   lib/mpi/mpi-pow.c:71:6: note: Assuming 'mp' is non-null
           if (!mp)
               ^~~
   lib/mpi/mpi-pow.c:71:2: note: Taking false branch

vim +172 kernel/locking/test-ww_mutex.c

f2a5fec17395f2 Chris Wilson      2016-12-01  120  =

53956aadc1f375 Maarten Lankhorst 2021-09-09  121  static int test_aa(bool t=
rylock)
c22fb3807fd0a3 Chris Wilson      2016-12-01  122  {
c22fb3807fd0a3 Chris Wilson      2016-12-01  123  	struct ww_mutex mutex;
c22fb3807fd0a3 Chris Wilson      2016-12-01  124  	struct ww_acquire_ctx ct=
x;
c22fb3807fd0a3 Chris Wilson      2016-12-01  125  	int ret;
53956aadc1f375 Maarten Lankhorst 2021-09-09  126  	const char *from =3D try=
lock ? "trylock" : "lock";
c22fb3807fd0a3 Chris Wilson      2016-12-01  127  =

c22fb3807fd0a3 Chris Wilson      2016-12-01  128  	ww_mutex_init(&mutex, &w=
w_class);
c22fb3807fd0a3 Chris Wilson      2016-12-01  129  	ww_acquire_init(&ctx, &w=
w_class);
c22fb3807fd0a3 Chris Wilson      2016-12-01  130  =

53956aadc1f375 Maarten Lankhorst 2021-09-09  131  	if (!trylock) {
53956aadc1f375 Maarten Lankhorst 2021-09-09  132  		ret =3D ww_mutex_lock(&=
mutex, &ctx);
53956aadc1f375 Maarten Lankhorst 2021-09-09  133  		if (ret) {
53956aadc1f375 Maarten Lankhorst 2021-09-09  134  			pr_err("%s: initial lo=
ck failed!\n", __func__);
53956aadc1f375 Maarten Lankhorst 2021-09-09  135  			goto out;
53956aadc1f375 Maarten Lankhorst 2021-09-09  136  		}
53956aadc1f375 Maarten Lankhorst 2021-09-09  137  	} else {
53956aadc1f375 Maarten Lankhorst 2021-09-09  138  		if (!ww_mutex_trylock(&=
mutex, &ctx)) {
53956aadc1f375 Maarten Lankhorst 2021-09-09  139  			pr_err("%s: initial tr=
ylock failed!\n", __func__);
53956aadc1f375 Maarten Lankhorst 2021-09-09  140  			goto out;
53956aadc1f375 Maarten Lankhorst 2021-09-09  141  		}
53956aadc1f375 Maarten Lankhorst 2021-09-09  142  	}
53956aadc1f375 Maarten Lankhorst 2021-09-09  143  =

53956aadc1f375 Maarten Lankhorst 2021-09-09  144  	if (ww_mutex_trylock(&mu=
tex, NULL))  {
53956aadc1f375 Maarten Lankhorst 2021-09-09  145  		pr_err("%s: trylocked i=
tself without context from %s!\n", __func__, from);
53956aadc1f375 Maarten Lankhorst 2021-09-09  146  		ww_mutex_unlock(&mutex);
53956aadc1f375 Maarten Lankhorst 2021-09-09  147  		ret =3D -EINVAL;
53956aadc1f375 Maarten Lankhorst 2021-09-09  148  		goto out;
53956aadc1f375 Maarten Lankhorst 2021-09-09  149  	}
c22fb3807fd0a3 Chris Wilson      2016-12-01  150  =

53956aadc1f375 Maarten Lankhorst 2021-09-09  151  	if (ww_mutex_trylock(&mu=
tex, &ctx))  {
53956aadc1f375 Maarten Lankhorst 2021-09-09  152  		pr_err("%s: trylocked i=
tself with context from %s!\n", __func__, from);
c22fb3807fd0a3 Chris Wilson      2016-12-01  153  		ww_mutex_unlock(&mutex);
c22fb3807fd0a3 Chris Wilson      2016-12-01  154  		ret =3D -EINVAL;
c22fb3807fd0a3 Chris Wilson      2016-12-01  155  		goto out;
c22fb3807fd0a3 Chris Wilson      2016-12-01  156  	}
c22fb3807fd0a3 Chris Wilson      2016-12-01  157  =

c22fb3807fd0a3 Chris Wilson      2016-12-01  158  	ret =3D ww_mutex_lock(&m=
utex, &ctx);
c22fb3807fd0a3 Chris Wilson      2016-12-01  159  	if (ret !=3D -EALREADY) {
53956aadc1f375 Maarten Lankhorst 2021-09-09  160  		pr_err("%s: missed dead=
lock for recursing, ret=3D%d from %s\n",
53956aadc1f375 Maarten Lankhorst 2021-09-09  161  		       __func__, ret, f=
rom);
c22fb3807fd0a3 Chris Wilson      2016-12-01  162  		if (!ret)
c22fb3807fd0a3 Chris Wilson      2016-12-01  163  			ww_mutex_unlock(&mutex=
);
c22fb3807fd0a3 Chris Wilson      2016-12-01  164  		ret =3D -EINVAL;
c22fb3807fd0a3 Chris Wilson      2016-12-01  165  		goto out;
c22fb3807fd0a3 Chris Wilson      2016-12-01  166  	}
c22fb3807fd0a3 Chris Wilson      2016-12-01  167  =

53956aadc1f375 Maarten Lankhorst 2021-09-09  168  	ww_mutex_unlock(&mutex);
c22fb3807fd0a3 Chris Wilson      2016-12-01  169  	ret =3D 0;
c22fb3807fd0a3 Chris Wilson      2016-12-01  170  out:
c22fb3807fd0a3 Chris Wilson      2016-12-01  171  	ww_acquire_fini(&ctx);
c22fb3807fd0a3 Chris Wilson      2016-12-01 @172  	return ret;
c22fb3807fd0a3 Chris Wilson      2016-12-01  173  }
c22fb3807fd0a3 Chris Wilson      2016-12-01  174  =


:::::: The code@line 172 was first introduced by commit
:::::: c22fb3807fd0a3bdd98c13c4d2190ab064e6c09d locking/ww_mutex: Add kself=
tests for ww_mutex AA deadlock detection

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7560154604630653035==--

