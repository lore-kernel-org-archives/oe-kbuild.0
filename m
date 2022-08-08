Content-Type: multipart/mixed; boundary="===============4577668671028380685=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 41/207] drivers/pinctrl/samsung/pinctrl-s3c24xx.c:160:32: error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible pointer type
Date: Mon, 08 Aug 2022 08:02:10 +0800
Message-ID: <202208080714.84vGyCkq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4577668671028380685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   1ec5fba16dd51c564b43e1de41ff50e30ecd0e9b
commit: aecbe5feac8e1a307a3357c83536307dd8a9f224 [41/207] pinctrl: samsung:=
 irq_pipeline: convert per-bank lock to hard form
:::::: branch date: 9 days ago
:::::: commit date: 4 months ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20220808=
/202208080714.84vGyCkq-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/aecbe5feac8e1a307=
a3357c83536307dd8a9f224
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.10/dovetail-xenomai
        git checkout aecbe5feac8e1a307a3357c83536307dd8a9f224
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dm68k SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the intel-lts/5.10/dovetail-xenomai HEAD 1ec5fba16dd51c564b43e1de41ff=
50e30ecd0e9b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/ratelimit_types.h:7,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/pinctrl/samsung/pinctrl-s3c24xx.c:12:
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c: In function 's3c24xx_eint_set=
_function':
>> drivers/pinctrl/samsung/pinctrl-s3c24xx.c:153:27: error: passing argumen=
t 1 of 'spinlock_check' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
     153 |         spin_lock_irqsave(&bank->slock, flags);
         |                           ^~~~~~~~~~~~
         |                           |
         |                           hard_spinlock_t * {aka struct raw_spin=
lock *}
   include/linux/spinlock_types.h:217:9: note: in definition of macro 'LOCK=
_ALTERNATIVES'
     217 |         __raw_form
         |         ^~~~~~~~~~
   include/linux/spinlock.h:266:48: note: in expansion of macro '__RAWLOCK'
     266 |                 flags =3D _raw_spin_lock_irqsave(__RAWLOCK(lock)=
);        \
         |                                                ^~~~~~~~~
   include/linux/spinlock.h:416:9: note: in expansion of macro 'raw_spin_lo=
ck_irqsave'
     416 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-s3c24xx.c:153:9: note: in expansion of m=
acro 'spin_lock_irqsave'
     153 |         spin_lock_irqsave(&bank->slock, flags);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/linux/wait.h:9,
                    from include/linux/pid.h:6,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6:
   include/linux/spinlock.h:358:67: note: expected 'spinlock_t *' {aka 'str=
uct spinlock *'} but argument is of type 'hard_spinlock_t *' {aka 'struct r=
aw_spinlock *'}
     358 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t=
 *lock)
         |                                                       ~~~~~~~~~~=
~~^~~~
>> drivers/pinctrl/samsung/pinctrl-s3c24xx.c:160:32: error: passing argumen=
t 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=3Di=
ncompatible-pointer-types]
     160 |         spin_unlock_irqrestore(&bank->slock, flags);
         |                                ^~~~~~~~~~~~
         |                                |
         |                                hard_spinlock_t * {aka struct raw=
_spinlock *}
   include/linux/spinlock.h:439:64: note: expected 'spinlock_t *' {aka 'str=
uct spinlock *'} but argument is of type 'hard_spinlock_t *' {aka 'struct r=
aw_spinlock *'}
     439 | static __always_inline void spin_unlock_irqrestore(spinlock_t *l=
ock, unsigned long flags)
         |                                                    ~~~~~~~~~~~~^=
~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/ratelimit_types.h:7,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
   drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_irq_set_=
function':
>> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:27: error: passing argumen=
t 1 of 'spinlock_check' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
     289 |         spin_lock_irqsave(&bank->slock, flags);
         |                           ^~~~~~~~~~~~
         |                           |
         |                           hard_spinlock_t * {aka struct raw_spin=
lock *}
   include/linux/spinlock_types.h:217:9: note: in definition of macro 'LOCK=
_ALTERNATIVES'
     217 |         __raw_form
         |         ^~~~~~~~~~
   include/linux/spinlock.h:266:48: note: in expansion of macro '__RAWLOCK'
     266 |                 flags =3D _raw_spin_lock_irqsave(__RAWLOCK(lock)=
);        \
         |                                                ^~~~~~~~~
   include/linux/spinlock.h:416:9: note: in expansion of macro 'raw_spin_lo=
ck_irqsave'
     416 |         raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:9: note: in expansion of m=
acro 'spin_lock_irqsave'
     289 |         spin_lock_irqsave(&bank->slock, flags);
         |         ^~~~~~~~~~~~~~~~~
   In file included from include/linux/wait.h:9,
                    from include/linux/pid.h:6,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6:
   include/linux/spinlock.h:358:67: note: expected 'spinlock_t *' {aka 'str=
uct spinlock *'} but argument is of type 'hard_spinlock_t *' {aka 'struct r=
aw_spinlock *'}
     358 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t=
 *lock)
         |                                                       ~~~~~~~~~~=
~~^~~~
>> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:32: error: passing argumen=
t 1 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=3Di=
ncompatible-pointer-types]
     296 |         spin_unlock_irqrestore(&bank->slock, flags);
         |                                ^~~~~~~~~~~~
         |                                |
         |                                hard_spinlock_t * {aka struct raw=
_spinlock *}
   include/linux/spinlock.h:439:64: note: expected 'spinlock_t *' {aka 'str=
uct spinlock *'} but argument is of type 'hard_spinlock_t *' {aka 'struct r=
aw_spinlock *'}
     439 | static __always_inline void spin_unlock_irqrestore(spinlock_t *l=
ock, unsigned long flags)
         |                                                    ~~~~~~~~~~~~^=
~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NEED_MULTIPLE_NODES
   Depends on [n]: DISCONTIGMEM [=3Dn] || NUMA
   Selected by [y]:
   - SINGLE_MEMORY_CHUNK [=3Dy] && MMU [=3Dy]


vim +/spin_unlock_irqrestore +160 drivers/pinctrl/samsung/pinctrl-s3c24xx.c

af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  137  =

af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  138  static void s3c24xx_eint_set_function(struct samsung_pin=
ctrl_drv_data *d,
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  139  					struct samsung_pin_bank *bank, int pin)
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  140  {
94ce944bed8a84 drivers/pinctrl/samsung/pinctrl-s3c24xx.c Tomasz Figa       =
  2014-09-23  141  	const struct samsung_pin_bank_type *bank_type =3D bank-=
>type;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  142  	unsigned long flags;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  143  	void __iomem *reg;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  144  	u8 shift;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  145  	u32 mask;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  146  	u32 val;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  147  =

af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  148  	/* Make sure that pin is configured as interrupt */
cee7413d84044a drivers/pinctrl/samsung/pinctrl-s3c24xx.c Krzysztof Kozlowsk=
i 2017-06-15  149  	reg =3D d->virt_base + bank->pctl_offset;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  150  	shift =3D pin * bank_type->fld_width[PINCFG_TYPE_FUNC];
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  151  	mask =3D (1 << bank_type->fld_width[PINCFG_TYPE_FUNC]) =
- 1;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  152  =

af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21 @153  	spin_lock_irqsave(&bank->slock, flags);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  154  =

af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  155  	val =3D readl(reg);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  156  	val &=3D ~(mask << shift);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  157  	val |=3D bank->eint_func << shift;
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  158  	writel(val, reg);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  159  =

af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21 @160  	spin_unlock_irqrestore(&bank->slock, flags);
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  161  }
af99a7507469d4 drivers/pinctrl/pinctrl-s3c24xx.c         Heiko Stuebner    =
  2013-05-21  162  =


:::::: The code at line 160 was first introduced by commit
:::::: af99a7507469d4fa6dd4d8d633e093b1ff7aff6e pinctrl: Add pinctrl-s3c24x=
x driver

:::::: TO: Heiko Stuebner <heiko@sntech.de>
:::::: CC: Kukjin Kim <kgene.kim@samsung.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4577668671028380685==--

