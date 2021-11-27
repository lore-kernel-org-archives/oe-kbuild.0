Content-Type: multipart/mixed; boundary="===============7777710523726251555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/clk/at91/clk-master.c:197:7: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 28 Nov 2021 07:41:48 +0800
Message-ID: <202111280723.1QYfzt93-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7777710523726251555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4f0dda359c4563cbb1b0f97b0dbbcdc553156541
commit: 7029db09b2025f863f191b3d5b1d7859a5e26a8d clk: at91: clk-master: add=
 notifier for divider
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20211114 (https://download.01.org/0day-ci/archi=
ve/20211128/202111280723.1QYfzt93-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3ddde=
eafb529e769cde87bd29ef6271ac6bfa5c)
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
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/pinctrl/stm32/pinctrl-stm32.c:1465:7: note: Assuming the conditi=
on is false
                   if (hwlock_id =3D=3D -EPROBE_DEFER)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1465:3: note: Taking false branch
                   if (hwlock_id =3D=3D -EPROBE_DEFER)
                   ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1471:2: note: Loop condition is fa=
lse.  Exiting loop
           spin_lock_init(&pctl->irqmux_lock);
           ^
   include/linux/spinlock.h:353:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1481:6: note: Assuming field 'pins=
' is non-null
           if (!pctl->pins)
               ^~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1481:2: note: Taking false branch
           if (!pctl->pins)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1485:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1485:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1489:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1489:2: note: Taking false branch
           if (ret) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1494:6: note: Assuming field 'doma=
in' is non-null
           if (pctl->domain) {
               ^~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1494:2: note: Taking true branch
           if (pctl->domain) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1495:9: note: Calling 'stm32_pctrl=
_dt_setup_irq'
                   ret =3D stm32_pctrl_dt_setup_irq(pdev, pctl);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1333:6: note: Calling 'IS_ERR'
           if (IS_ERR(pctl->regmap))
               ^~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1333:6: note: Returning from 'IS_E=
RR'
           if (IS_ERR(pctl->regmap))
               ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1333:2: note: Taking false branch
           if (IS_ERR(pctl->regmap))
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1339:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1339:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1343:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1343:2: note: Taking false branch
           if (ret)
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1348:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < STM32_GPIO_PINS_PER_BANK; i++) {
           ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1349:3: note: 'mux' initialized he=
re
                   struct reg_field mux;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/stm32/pinctrl-stm32.c:1355:3: note: Loop condition is fa=
lse.  Exiting loop
                   dev_dbg(dev, "irqmux%d: reg:%#x, lsb:%d, msb:%d\n",
                   ^
   include/linux/dev_printk.h:158:2: note: expanded from macro 'dev_dbg'
           dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dev_printk.h:128:3: note: expanded from macro 'dev_printk'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:413:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/pinctrl/stm32/pinctrl-stm32.c:1358:21: note: Passed-by-value str=
uct argument contains uninitialized data (e.g., field: 'id_size')
                   pctl->irqmux[i] =3D devm_regmap_field_alloc(dev, rm, mux=
);
                                     ^                                ~~~
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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7777710523726251555==--

