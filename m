Content-Type: multipart/mixed; boundary="===============5181088132713768839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 336/2399] kernel/locking/test-ww_mutex.c:172:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 17 Apr 2022 16:14:21 +0800
Message-ID: <202204171609.7n9Nq9AC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5181088132713768839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   d86220b9804b7e73ffc262a6d8bf5afbbf17be81
commit: 53956aadc1f3755f43e9a8d6741cb2b1d4c58ac6 [336/2399] kernel/locking:=
 Add context to ww_mutex_trylock()
:::::: branch date: 5 days ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220417/202204171609.7n9Nq9AC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 64c045=
e25b8471bbb572bd29159c294a82a86a25)
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
                                           ^
   include/linux/spinlock_api_up.h:65:35: note: expanded from macro '_raw_s=
pin_lock_irq'
   #define _raw_spin_lock_irq(lock)                __LOCK_IRQ(lock)
                                                   ^
   include/linux/spinlock_api_up.h:37:29: note: expanded from macro '__LOCK=
_IRQ'
     do { local_irq_disable(); __LOCK(lock); } while (0)
                               ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   kernel/locking/rtmutex_api.c:394:2: note: Loop condition is false.  Exit=
ing loop
           raw_spin_lock_irq(&lock->wait_lock);
           ^
   include/linux/spinlock.h:286:34: note: expanded from macro 'raw_spin_loc=
k_irq'
   #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
                                           ^
   include/linux/spinlock_api_up.h:65:35: note: expanded from macro '_raw_s=
pin_lock_irq'
   #define _raw_spin_lock_irq(lock)                __LOCK_IRQ(lock)
                                                   ^
   include/linux/spinlock_api_up.h:37:3: note: expanded from macro '__LOCK_=
IRQ'
     do { local_irq_disable(); __LOCK(lock); } while (0)
     ^
   kernel/locking/rtmutex_api.c:411:6: note: Assuming the condition is true
           if (rt_mutex_owner(lock) !=3D current) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex_api.c:411:2: note: Taking true branch
           if (rt_mutex_owner(lock) !=3D current) {
           ^
   kernel/locking/rtmutex_api.c:412:23: note: Passing value via 2nd paramet=
er 'waiter'
                   remove_waiter(lock, waiter);
                                       ^~~~~~
   kernel/locking/rtmutex_api.c:412:3: note: Calling 'remove_waiter'
                   remove_waiter(lock, waiter);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1411:24: note: Assuming pointer value is null
           bool is_top_waiter =3D (waiter =3D=3D rt_mutex_top_waiter(lock));
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:1415:2: note: Loop condition is false.  Exiting=
 loop
           lockdep_assert_held(&lock->wait_lock);
           ^
   include/linux/lockdep.h:411:34: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)                  do { (void)(l); } while =
(0)
                                                   ^
   kernel/locking/rtmutex.c:1417:2: note: Loop condition is false.  Exiting=
 loop
           raw_spin_lock(&current->pi_lock);
           ^
   include/linux/spinlock.h:229:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^
   include/linux/spinlock_api_up.h:58:32: note: expanded from macro '_raw_s=
pin_lock'
   #define _raw_spin_lock(lock)                    __LOCK(lock)
                                                   ^
   include/linux/spinlock_api_up.h:31:8: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
          ^
   include/linux/preempt.h:179:27: note: expanded from macro 'preempt_disab=
le'
   #define preempt_disable() \
                             ^
   kernel/locking/rtmutex.c:1417:2: note: Loop condition is false.  Exiting=
 loop
           raw_spin_lock(&current->pi_lock);
           ^
   include/linux/spinlock.h:229:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^
   include/linux/spinlock_api_up.h:58:32: note: expanded from macro '_raw_s=
pin_lock'
   #define _raw_spin_lock(lock)                    __LOCK(lock)
                                                   ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   kernel/locking/rtmutex.c:1417:2: note: Loop condition is false.  Exiting=
 loop
           raw_spin_lock(&current->pi_lock);
           ^
   include/linux/spinlock.h:229:29: note: expanded from macro 'raw_spin_loc=
k'
   #define raw_spin_lock(lock)     _raw_spin_lock(lock)
                                   ^
   include/linux/spinlock_api_up.h:58:32: note: expanded from macro '_raw_s=
pin_lock'
   #define _raw_spin_lock(lock)                    __LOCK(lock)
                                                   ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   kernel/locking/rtmutex.c:1418:25: note: Passing null pointer value via 2=
nd parameter 'waiter'
           rt_mutex_dequeue(lock, waiter);
                                  ^~~~~~
   kernel/locking/rtmutex.c:1418:2: note: Calling 'rt_mutex_dequeue'
           rt_mutex_dequeue(lock, waiter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rtmutex.c:404:6: note: Access to field '__rb_parent_color=
' results in a dereference of a null pointer
           if (RB_EMPTY_NODE(&waiter->tree_entry))
               ^
   include/linux/rbtree.h:34:3: note: expanded from macro 'RB_EMPTY_NODE'
           ((node)->__rb_parent_color =3D=3D (unsigned long)(node))
            ^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> kernel/locking/test-ww_mutex.c:172:2: warning: Undefined or garbage valu=
e returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   kernel/locking/test-ww_mutex.c:625:2: note: Left side of '&&' is true
           printk(KERN_INFO "Beginning ww mutex selftests\n");
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   kernel/locking/test-ww_mutex.c:625:2: note: Taking true branch
           printk(KERN_INFO "Beginning ww mutex selftests\n");
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:374:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   kernel/locking/test-ww_mutex.c:625:2: note: '?' condition is true
           printk(KERN_INFO "Beginning ww mutex selftests\n");
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   kernel/locking/test-ww_mutex.c:625:2: note: '?' condition is true
           printk(KERN_INFO "Beginning ww mutex selftests\n");
           ^
   include/linux/printk.h:450:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:421:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:387:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
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
   include/linux/printk.h:373:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
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


:::::: The code at line 172 was first introduced by commit
:::::: c22fb3807fd0a3bdd98c13c4d2190ab064e6c09d locking/ww_mutex: Add kself=
tests for ww_mutex AA deadlock detection

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5181088132713768839==--

