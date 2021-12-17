Content-Type: multipart/mixed; boundary="===============7832824075950790594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1772/8462] drivers/pinctrl/pinctrl-rockchip.c:912:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 18 Dec 2021 04:12:53 +0800
Message-ID: <202112180414.ROaELQwG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7832824075950790594==
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
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: e4dd7fd5ff0acb3f3ed290f52afe20fd840d22b0 [1772/8462] pinctrl/rockch=
ip: Use temporary variable for struct device
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211218/202112180414.ROaELQwG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/drm_syncobj.c:559:2: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
           drm_syncobj_put(syncobj);
           ^
   drivers/gpu/drm/drm_syncobj.c:772:2: note: Taking false branch
           if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
           ^
   drivers/gpu/drm/drm_syncobj.c:776:6: note: Assuming the condition is fal=
se
           if (args->flags & ~DRM_SYNCOBJ_CREATE_SIGNALED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:776:2: note: Taking false branch
           if (args->flags & ~DRM_SYNCOBJ_CREATE_SIGNALED)
           ^
   drivers/gpu/drm/drm_syncobj.c:779:9: note: Calling 'drm_syncobj_create_a=
s_handle'
           return drm_syncobj_create_as_handle(file_private,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:554:8: note: Calling 'drm_syncobj_create'
           ret =3D drm_syncobj_create(&syncobj, flags, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:489:6: note: Assuming 'syncobj' is non-null
           if (!syncobj)
               ^~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:489:2: note: Taking false branch
           if (!syncobj)
           ^
   drivers/gpu/drm/drm_syncobj.c:494:2: note: Loop condition is false.  Exi=
ting loop
           spin_lock_init(&syncobj->lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/gpu/drm/drm_syncobj.c:496:6: note: Assuming the condition is fal=
se
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:496:2: note: Taking false branch
           if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
           ^
   drivers/gpu/drm/drm_syncobj.c:504:6: note: 'fence' is null
           if (fence)
               ^~~~~
   drivers/gpu/drm/drm_syncobj.c:504:2: note: Taking false branch
           if (fence)
           ^
   drivers/gpu/drm/drm_syncobj.c:554:8: note: Returning from 'drm_syncobj_c=
reate'
           ret =3D drm_syncobj_create(&syncobj, flags, NULL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:555:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/drm_syncobj.c:555:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/drm_syncobj.c:558:8: note: Calling 'drm_syncobj_get_hand=
le'
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:538:6: note: Assuming 'ret' is < 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/drm_syncobj.c:538:2: note: Taking true branch
           if (ret < 0) {
           ^
   drivers/gpu/drm/drm_syncobj.c:539:3: note: Calling 'drm_syncobj_put'
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Calling 'kref_put'
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/kref.h:65:3: note: Calling 'drm_syncobj_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:466:2: note: Memory is released
           kfree(syncobj);
           ^~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   include/drm/drm_syncobj.h:88:2: note: Returning; memory was released
           kref_put(&obj->refcount, drm_syncobj_free);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:539:3: note: Returning; memory was release=
d via 1st parameter
                   drm_syncobj_put(syncobj);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:558:8: note: Returning; memory was release=
d via 2nd parameter
           ret =3D drm_syncobj_get_handle(file_private, syncobj, handle);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:559:2: note: Use of memory after it is fre=
ed
           drm_syncobj_put(syncobj);
           ^               ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
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
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpio/gpio-adnp.c:385:28: warning: The result of the left shift i=
s undefined due to shifting by '4294967292', which is greater or equal to t=
he width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           unsigned int num_regs =3D 1 << adnp->reg_shift, i;
                                     ^
   drivers/gpio/gpio-adnp.c:498:6: note: 'err' is >=3D 0
           if (err < 0)
               ^~~
   drivers/gpio/gpio-adnp.c:498:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/gpio/gpio-adnp.c:502:6: note: Assuming field 'irq' is not equal =
to 0
           if (!client->irq)
               ^~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:502:2: note: Taking false branch
           if (!client->irq)
           ^
   drivers/gpio/gpio-adnp.c:506:6: note: Assuming 'adnp' is non-null
           if (!adnp)
               ^~~~~
   drivers/gpio/gpio-adnp.c:506:2: note: Taking false branch
           if (!adnp)
           ^
   drivers/gpio/gpio-adnp.c:509:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&adnp->i2c_lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/gpio/gpio-adnp.c:512:8: note: Calling 'adnp_gpio_setup'
           err =3D adnp_gpio_setup(adnp, num_gpios,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:446:2: note: The value 4294967292 is assigned t=
o field 'reg_shift'
           adnp->reg_shift =3D get_count_order(num_gpios) - 3;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:454:2: note: Taking true branch
           if (IS_ENABLED(CONFIG_DEBUG_FS))
           ^
   drivers/gpio/gpio-adnp.c:464:6: note: 'is_irq_controller' is true
           if (is_irq_controller) {
               ^~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:464:2: note: Taking true branch
           if (is_irq_controller) {
           ^
   drivers/gpio/gpio-adnp.c:467:9: note: Calling 'adnp_irq_setup'
                   err =3D adnp_irq_setup(adnp);
                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-adnp.c:385:28: note: The result of the left shift is u=
ndefined due to shifting by '4294967292', which is greater or equal to the =
width of type 'int'
           unsigned int num_regs =3D 1 << adnp->reg_shift, i;

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
--===============7832824075950790594==--

