Content-Type: multipart/mixed; boundary="===============4426045769658852843=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2052/3632] drivers/pinctrl/pinctrl-rockchip.c:912:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 25 Nov 2021 16:07:30 +0800
Message-ID: <202111251514.XKLa1xWr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4426045769658852843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f81e94e91878bded599cc60f2881cfd50991aeb9
commit: e4dd7fd5ff0acb3f3ed290f52afe20fd840d22b0 [2052/3632] pinctrl/rockch=
ip: Use temporary variable for struct device
:::::: branch date: 3 hours ago
:::::: commit date: 7 days ago
config: arm-randconfig-c002-20211119 (https://download.01.org/0day-ci/archi=
ve/20211125/202111251514.XKLa1xWr-lkp(a)intel.com/config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De4dd7fd5ff0acb3f3ed290f52afe20fd840d22b0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e4dd7fd5ff0acb3f3ed290f52afe20fd840d22b0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   ipc/sem.c:1426:35: note: 'cmd' is equal to SETALL
           if (ipcperms(ns, &sma->sem_perm, cmd =3D=3D SETALL ? S_IWUGO : S=
_IRUGO))
                                            ^~~
   ipc/sem.c:1426:35: note: '?' condition is true
   ipc/sem.c:1426:6: note: Assuming the condition is false
           if (ipcperms(ns, &sma->sem_perm, cmd =3D=3D SETALL ? S_IWUGO : S=
_IRUGO))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   ipc/sem.c:1426:2: note: Taking false branch
           if (ipcperms(ns, &sma->sem_perm, cmd =3D=3D SETALL ? S_IWUGO : S=
_IRUGO))
           ^
   ipc/sem.c:1430:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   ipc/sem.c:1430:2: note: Taking false branch
           if (err)
           ^
   ipc/sem.c:1434:2: note: Control jumps to 'case 17:'  at line 1475
           switch (cmd) {
           ^
   ipc/sem.c:1480:7: note: Assuming the condition is false
                   if (!ipc_rcu_getref(&sma->sem_perm)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1480:3: note: Taking false branch
                   if (!ipc_rcu_getref(&sma->sem_perm)) {
                   ^
   ipc/sem.c:1486:7: note: Assuming 'nsems' is <=3D SEMMSL_FAST
                   if (nsems > SEMMSL_FAST) {
                       ^~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1486:3: note: Taking false branch
                   if (nsems > SEMMSL_FAST) {
                   ^
   ipc/sem.c:1495:7: note: Calling 'copy_from_user'
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:13: note: Calling 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/thread_info.h:207:15: note: Assuming 'sz' is >=3D 0
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:15: note: Left side of '&&' is true
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                        ^
   include/linux/thread_info.h:207:26: note: Assuming 'sz' is < 'bytes', wh=
ich participates in a condition later
           if (unlikely(sz >=3D 0 && sz < bytes)) {
                                   ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/thread_info.h:207:2: note: Taking true branch
           if (unlikely(sz >=3D 0 && sz < bytes)) {
           ^
   include/linux/thread_info.h:208:3: note: Taking true branch
                   if (!__builtin_constant_p(bytes))
                   ^
   include/linux/uaccess.h:191:13: note: Returning from 'check_copy_size'
           if (likely(check_copy_size(to, n, false)))
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/linux/uaccess.h:191:2: note: Taking false branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:193:2: note: Returning without writing to '*to'
           return n;
           ^
   include/linux/uaccess.h:193:2: note: Returning value (loaded from 'n'), =
which participates in a condition later
           return n;
           ^~~~~~~~
   ipc/sem.c:1495:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1495:7: note: Assuming the condition is false
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ipc/sem.c:1495:3: note: Taking false branch
                   if (copy_from_user(sem_io, p, nsems*sizeof(ushort))) {
                   ^
   ipc/sem.c:1501:8: note: The value 0 is assigned to 'i'
                   for (i =3D 0; i < nsems; i++) {
                        ^~~~~
   ipc/sem.c:1501:15: note: Assuming 'i' is < 'nsems'
                   for (i =3D 0; i < nsems; i++) {
                               ^~~~~~~~~
   ipc/sem.c:1501:3: note: Loop condition is true.  Entering loop body
                   for (i =3D 0; i < nsems; i++) {
                   ^
   ipc/sem.c:1502:18: note: The left operand of '>' is a garbage value
                           if (sem_io[i] > SEMVMX) {
                               ~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/pinctrl/pinctrl-rockchip.c:912:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:912:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:1965:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:1965:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:2031:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:2031:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/pinctrl/pinctrl-rockchip.c:2759:14: note: Assuming 'i' is < fiel=
d 'nr_banks'
           for (i =3D 0; i < info->ctrl->nr_banks; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:2759:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < info->ctrl->nr_banks; i++) {
           ^
   drivers/pinctrl/pinctrl-rockchip.c:2763:3: note: Loop condition is true.=
  Entering loop body
                   while (!list_empty(&bank->deferred_output)) {
                   ^
   drivers/pinctrl/pinctrl-rockchip.c:2767:4: note: Memory is released
                           kfree(cfg);
                           ^~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:2763:3: note: Loop condition is true.=
  Entering loop body
                   while (!list_empty(&bank->deferred_output)) {
                   ^
   drivers/pinctrl/pinctrl-rockchip.c:2766:4: note: Calling 'list_del'
                           list_del(&cfg->head);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   drivers/pinctrl/pinctrl-rockchip.c:2759:14: note: Assuming 'i' is < fiel=
d 'nr_banks'
           for (i =3D 0; i < info->ctrl->nr_banks; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:2759:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 0; i < info->ctrl->nr_banks; i++) {
           ^
   drivers/pinctrl/pinctrl-rockchip.c:2763:3: note: Loop condition is true.=
  Entering loop body
                   while (!list_empty(&bank->deferred_output)) {
                   ^
   drivers/pinctrl/pinctrl-rockchip.c:2767:4: note: Memory is released
                           kfree(cfg);
                           ^~~~~~~~~~
   drivers/pinctrl/pinctrl-rockchip.c:2763:3: note: Loop condition is true.=
  Entering loop body
                   while (!list_empty(&bank->deferred_output)) {
                   ^
   drivers/pinctrl/pinctrl-rockchip.c:2766:4: note: Calling 'list_del'
                           list_del(&cfg->head);
                           ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   arch/arm/kernel/devtree.c:232:6: warning: Access to field 'dt_fixup' res=
ults in a dereference of a null pointer (loaded from variable 'mdesc') [cla=
ng-analyzer-core.NullDereference]
           if (mdesc->dt_fixup)
               ^~~~~
   arch/arm/kernel/devtree.c:206:6: note: Assuming 'dt_virt' is non-null
           if (!dt_virt || !early_init_dt_verify(dt_virt))
               ^~~~~~~~
   arch/arm/kernel/devtree.c:206:6: note: Left side of '||' is false
   arch/arm/kernel/devtree.c:206:18: note: Assuming the condition is false
           if (!dt_virt || !early_init_dt_verify(dt_virt))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:206:2: note: Taking false branch
           if (!dt_virt || !early_init_dt_verify(dt_virt))
           ^
   arch/arm/kernel/devtree.c:209:2: note: Value assigned to 'mdesc'
           mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mac=
h);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:211:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/devtree.c:211:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/devtree.c:221:10: note: Assuming 'size' is <=3D 0

vim +/dev +912 drivers/pinctrl/pinctrl-rockchip.c

05709c3e88f5f0 John Keeping    2017-03-23  895  =

d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  896  /*
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  897   * Set a new mux funct=
ion for a pin.
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  898   *
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  899   * The register is div=
ided into the upper and lower 16 bit. When changing
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  900   * a value, the previo=
us register value is not read and changed. Instead
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  901   * it seems the change=
d bits are marked in the upper 16 bit, while the
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  902   * changed value gets =
set in the same offset in the lower 16 bit.
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  903   * All pin settings se=
em to be 2 bit wide in both the upper and lower
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  904   * parts.
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  905   * @bank: pin bank to =
change
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  906   * @pin: pin to change
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  907   * @mux: new mux funct=
ion to set
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  908   */
14797189b35e9e Heiko St=C3=BCbner   2014-03-26  909  static int rockchip_se=
t_mux(struct rockchip_pin_bank *bank, int pin, int mux)
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  910  {
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  911  	struct rockchip_pinct=
rl *info =3D bank->drvdata;
e4dd7fd5ff0acb Andy Shevchenko 2021-11-05 @912  	struct device *dev =3D inf=
o->dev;
fc72c923e50d5c Heiko St=C3=BCbner   2014-06-16  913  	int iomux_num =3D (pi=
n / 8);
95ec8ae4498e99 Heiko St=C3=BCbner   2014-06-16  914  	struct regmap *regmap;
ea262ad6e4019f david.wu        2017-02-10  915  	int reg, ret, mask, mux_ty=
pe;
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  916  	u8 bit;
51ff47aa4c933f Heiko Stuebner  2018-11-11  917  	u32 data, rmask, route_loc=
ation, route_reg, route_val;
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  918  =

05709c3e88f5f0 John Keeping    2017-03-23  919  	ret =3D rockchip_verify_mu=
x(bank, pin, mux);
05709c3e88f5f0 John Keeping    2017-03-23  920  	if (ret < 0)
05709c3e88f5f0 John Keeping    2017-03-23  921  		return ret;
62f49226b03b64 Heiko St=C3=BCbner   2014-06-16  922  =

05709c3e88f5f0 John Keeping    2017-03-23  923  	if (bank->iomux[iomux_num]=
.type & IOMUX_GPIO_ONLY)
c4a532dee6b6e4 Heiko St=C3=BCbner   2014-03-26  924  		return 0;
c4a532dee6b6e4 Heiko St=C3=BCbner   2014-03-26  925  =

e4dd7fd5ff0acb Andy Shevchenko 2021-11-05  926  	dev_dbg(dev, "setting mux =
of GPIO%d-%d to %d\n", bank->bank_num, pin, mux);
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  927  =

95ec8ae4498e99 Heiko St=C3=BCbner   2014-06-16  928  	regmap =3D (bank->iom=
ux[iomux_num].type & IOMUX_SOURCE_PMU)
95ec8ae4498e99 Heiko St=C3=BCbner   2014-06-16  929  				? info->regmap_pmu=
 : info->regmap_base;
95ec8ae4498e99 Heiko St=C3=BCbner   2014-06-16  930  =

d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  931  	/* get basic quadrupe=
l of mux registers and the correct reg inside */
ea262ad6e4019f david.wu        2017-02-10  932  	mux_type =3D bank->iomux[i=
omux_num].type;
6bc0d121a95b31 Heiko St=C3=BCbner   2014-06-16  933  	reg =3D bank->iomux[i=
omux_num].offset;
ea262ad6e4019f david.wu        2017-02-10  934  	if (mux_type & IOMUX_WIDTH=
_4BIT) {
03716e1dd01b0e Heiko St=C3=BCbner   2014-06-16  935  		if ((pin % 8) >=3D 4)
03716e1dd01b0e Heiko St=C3=BCbner   2014-06-16  936  			reg +=3D 0x4;
03716e1dd01b0e Heiko St=C3=BCbner   2014-06-16  937  		bit =3D (pin % 4) * =
4;
8b6c6f930da9d2 david.wu        2017-02-10  938  		mask =3D 0xf;
ea262ad6e4019f david.wu        2017-02-10  939  	} else if (mux_type & IOMU=
X_WIDTH_3BIT) {
8b6c6f930da9d2 david.wu        2017-02-10  940  		if ((pin % 8) >=3D 5)
8b6c6f930da9d2 david.wu        2017-02-10  941  			reg +=3D 0x4;
8b6c6f930da9d2 david.wu        2017-02-10  942  		bit =3D (pin % 8 % 5) * 3;
8b6c6f930da9d2 david.wu        2017-02-10  943  		mask =3D 0x7;
03716e1dd01b0e Heiko St=C3=BCbner   2014-06-16  944  	} else {
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  945  		bit =3D (pin % 8) * =
2;
8b6c6f930da9d2 david.wu        2017-02-10  946  		mask =3D 0x3;
03716e1dd01b0e Heiko St=C3=BCbner   2014-06-16  947  	}
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  948  =

c04c3fa65ac5c6 David Wu        2017-07-21  949  	if (bank->recalced_mask & =
BIT(pin))
c04c3fa65ac5c6 David Wu        2017-07-21  950  		rockchip_get_recalced_mux=
(bank, pin, &reg, &bit, &mask);
ea262ad6e4019f david.wu        2017-02-10  951  =

bd35b9bf828433 David Wu        2017-05-26  952  	if (bank->route_mask & BIT=
(pin)) {
51ff47aa4c933f Heiko Stuebner  2018-11-11  953  		if (rockchip_get_mux_rout=
e(bank, pin, mux, &route_location,
51ff47aa4c933f Heiko Stuebner  2018-11-11  954  					   &route_reg, &route_=
val)) {
51ff47aa4c933f Heiko Stuebner  2018-11-11  955  			struct regmap *route_reg=
map =3D regmap;
51ff47aa4c933f Heiko Stuebner  2018-11-11  956  =

51ff47aa4c933f Heiko Stuebner  2018-11-11  957  			/* handle special locati=
ons */
51ff47aa4c933f Heiko Stuebner  2018-11-11  958  			switch (route_location) {
51ff47aa4c933f Heiko Stuebner  2018-11-11  959  			case ROCKCHIP_ROUTE_PMU:
51ff47aa4c933f Heiko Stuebner  2018-11-11  960  				route_regmap =3D info->=
regmap_pmu;
51ff47aa4c933f Heiko Stuebner  2018-11-11  961  				break;
51ff47aa4c933f Heiko Stuebner  2018-11-11  962  			case ROCKCHIP_ROUTE_GRF:
51ff47aa4c933f Heiko Stuebner  2018-11-11  963  				route_regmap =3D info->=
regmap_base;
51ff47aa4c933f Heiko Stuebner  2018-11-11  964  				break;
51ff47aa4c933f Heiko Stuebner  2018-11-11  965  			}
51ff47aa4c933f Heiko Stuebner  2018-11-11  966  =

51ff47aa4c933f Heiko Stuebner  2018-11-11  967  			ret =3D regmap_write(rou=
te_regmap, route_reg, route_val);
bd35b9bf828433 David Wu        2017-05-26  968  			if (ret)
bd35b9bf828433 David Wu        2017-05-26  969  				return ret;
bd35b9bf828433 David Wu        2017-05-26  970  		}
bd35b9bf828433 David Wu        2017-05-26  971  	}
bd35b9bf828433 David Wu        2017-05-26  972  =

03716e1dd01b0e Heiko St=C3=BCbner   2014-06-16  973  	data =3D (mask << (bi=
t + 16));
99e872d953fb44 Sonny Rao       2014-07-31  974  	rmask =3D data | (data >> =
16);
03716e1dd01b0e Heiko St=C3=BCbner   2014-06-16  975  	data |=3D (mux & mask=
) << bit;
99e872d953fb44 Sonny Rao       2014-07-31  976  	ret =3D regmap_update_bits=
(regmap, reg, rmask, data);
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  977  =

751a99aba47e9b Heiko St=C3=BCbner   2014-05-05  978  	return ret;
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  979  }
d3e5116119bd02 Heiko St=C3=BCbner   2013-06-10  980  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4426045769658852843==--

