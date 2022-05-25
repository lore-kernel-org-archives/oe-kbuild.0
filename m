Content-Type: multipart/mixed; boundary="===============3186200412635539855=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/at91/clk-master.c:197:7: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Wed, 25 May 2022 10:41:13 +0800
Message-ID: <202205251054.2iG5BOpr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3186200412635539855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   268db333b561c77dee3feb6831806412293b4a7e
commit: 7029db09b2025f863f191b3d5b1d7859a5e26a8d clk: at91: clk-master: add=
 notifier for divider
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220525/202205251054.2iG5BOpr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7029db09b2025f863f191b3d5b1d7859a5e26a8d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7029db09b2025f863f191b3d5b1d7859a5e26a8d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/nilfs2/recovery.c:409:9: note: Loop condition is false.  Exiting loop
                   ent =3D list_first_entry(head, struct nilfs_segment_entr=
y, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/nilfs2/recovery.c:411:3: note: Memory is released
                   kfree(ent);
                   ^~~~~~~~~~
   fs/nilfs2/recovery.c:406:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(head)) {
           ^
   fs/nilfs2/recovery.c:409:9: note: Left side of '&&' is false
                   ent =3D list_first_entry(head, struct nilfs_segment_entr=
y, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/nilfs2/recovery.c:409:9: note: Taking false branch
                   ent =3D list_first_entry(head, struct nilfs_segment_entr=
y, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/nilfs2/recovery.c:409:9: note: Loop condition is false.  Exiting loop
                   ent =3D list_first_entry(head, struct nilfs_segment_entr=
y, list);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/nilfs2/recovery.c:410:3: note: Calling 'list_del'
                   list_del(&ent->list);
                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:146:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:132:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:135:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/at91/clk-master.c:197:7: warning: Division by zero [clang-an=
alyzer-core.DivideZero]
           rate /=3D characteristics->divisors[div_index];
                ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(master_div->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:278:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:237:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(master_div->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:278:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:237:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(master_div->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:278:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(master_div->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:278:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:3: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
     ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(master_div->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:278:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:3: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
     ^
   drivers/clk/at91/clk-master.c:260:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_irqsave(master_div->lock, flags);
           ^
   include/linux/spinlock.h:393:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \

vim +197 drivers/clk/at91/clk-master.c

7a110b9107ed8f Claudiu Beznea 2020-11-19  160  =

7029db09b2025f Claudiu Beznea 2021-10-11  161  /* This function must be cal=
led with lock acquired. */
7029db09b2025f Claudiu Beznea 2021-10-11  162  static int clk_master_div_se=
t(struct clk_master *master,
7029db09b2025f Claudiu Beznea 2021-10-11  163  			      unsigned long paren=
t_rate, int div)
7a110b9107ed8f Claudiu Beznea 2020-11-19  164  {
7a110b9107ed8f Claudiu Beznea 2020-11-19  165  	const struct clk_master_cha=
racteristics *characteristics =3D
7a110b9107ed8f Claudiu Beznea 2020-11-19  166  						master->characteristic=
s;
7029db09b2025f Claudiu Beznea 2021-10-11  167  	unsigned long rate =3D pare=
nt_rate;
7029db09b2025f Claudiu Beznea 2021-10-11  168  	unsigned int max_div =3D 0,=
 div_index =3D 0, max_div_index =3D 0;
7029db09b2025f Claudiu Beznea 2021-10-11  169  	unsigned int i, mckr, tmp;
36971566ea7a51 Claudiu Beznea 2021-10-11  170  	int ret;
7a110b9107ed8f Claudiu Beznea 2020-11-19  171  =

7a110b9107ed8f Claudiu Beznea 2020-11-19  172  	for (i =3D 0; i < ARRAY_SIZ=
E(characteristics->divisors); i++) {
7a110b9107ed8f Claudiu Beznea 2020-11-19  173  		if (!characteristics->divi=
sors[i])
7a110b9107ed8f Claudiu Beznea 2020-11-19  174  			break;
7a110b9107ed8f Claudiu Beznea 2020-11-19  175  =

7029db09b2025f Claudiu Beznea 2021-10-11  176  		if (div =3D=3D characteris=
tics->divisors[i])
7029db09b2025f Claudiu Beznea 2021-10-11  177  			div_index =3D i;
7029db09b2025f Claudiu Beznea 2021-10-11  178  =

7029db09b2025f Claudiu Beznea 2021-10-11  179  		if (max_div < characterist=
ics->divisors[i]) {
7029db09b2025f Claudiu Beznea 2021-10-11  180  			max_div =3D characteristi=
cs->divisors[i];
7029db09b2025f Claudiu Beznea 2021-10-11  181  			max_div_index =3D i;
7a110b9107ed8f Claudiu Beznea 2020-11-19  182  		}
7a110b9107ed8f Claudiu Beznea 2020-11-19  183  	}
7a110b9107ed8f Claudiu Beznea 2020-11-19  184  =

7029db09b2025f Claudiu Beznea 2021-10-11  185  	if (div > max_div)
7029db09b2025f Claudiu Beznea 2021-10-11  186  		div_index =3D max_div_inde=
x;
7a110b9107ed8f Claudiu Beznea 2020-11-19  187  =

36971566ea7a51 Claudiu Beznea 2021-10-11  188  	ret =3D regmap_read(master-=
>regmap, master->layout->offset, &mckr);
36971566ea7a51 Claudiu Beznea 2021-10-11  189  	if (ret)
7029db09b2025f Claudiu Beznea 2021-10-11  190  		return ret;
36971566ea7a51 Claudiu Beznea 2021-10-11  191  =

a27748adeacab6 Claudiu Beznea 2021-10-11  192  	mckr &=3D master->layout->m=
ask;
a27748adeacab6 Claudiu Beznea 2021-10-11  193  	tmp =3D (mckr >> MASTER_DIV=
_SHIFT) & MASTER_DIV_MASK;
7029db09b2025f Claudiu Beznea 2021-10-11  194  	if (tmp =3D=3D div_index)
7029db09b2025f Claudiu Beznea 2021-10-11  195  		return 0;
7029db09b2025f Claudiu Beznea 2021-10-11  196  =

7029db09b2025f Claudiu Beznea 2021-10-11 @197  	rate /=3D characteristics->=
divisors[div_index];
7029db09b2025f Claudiu Beznea 2021-10-11  198  	if (rate < characteristics-=
>output.min)
7029db09b2025f Claudiu Beznea 2021-10-11  199  		pr_warn("master clk div is=
 underclocked");
7029db09b2025f Claudiu Beznea 2021-10-11  200  	else if (rate > characteris=
tics->output.max)
7029db09b2025f Claudiu Beznea 2021-10-11  201  		pr_warn("master clk div is=
 overclocked");
36971566ea7a51 Claudiu Beznea 2021-10-11  202  =

36971566ea7a51 Claudiu Beznea 2021-10-11  203  	mckr &=3D ~(MASTER_DIV_MASK=
 << MASTER_DIV_SHIFT);
7029db09b2025f Claudiu Beznea 2021-10-11  204  	mckr |=3D (div_index << MAS=
TER_DIV_SHIFT);
36971566ea7a51 Claudiu Beznea 2021-10-11  205  	ret =3D regmap_write(master=
->regmap, master->layout->offset, mckr);
36971566ea7a51 Claudiu Beznea 2021-10-11  206  	if (ret)
7029db09b2025f Claudiu Beznea 2021-10-11  207  		return ret;
36971566ea7a51 Claudiu Beznea 2021-10-11  208  =

7a110b9107ed8f Claudiu Beznea 2020-11-19  209  	while (!clk_master_ready(ma=
ster))
7a110b9107ed8f Claudiu Beznea 2020-11-19  210  		cpu_relax();
7029db09b2025f Claudiu Beznea 2021-10-11  211  =

7029db09b2025f Claudiu Beznea 2021-10-11  212  	master->div =3D characteris=
tics->divisors[div_index];
7a110b9107ed8f Claudiu Beznea 2020-11-19  213  =

7a110b9107ed8f Claudiu Beznea 2020-11-19  214  	return 0;
7a110b9107ed8f Claudiu Beznea 2020-11-19  215  }
7a110b9107ed8f Claudiu Beznea 2020-11-19  216  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3186200412635539855==--

