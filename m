Content-Type: multipart/mixed; boundary="===============2288720017250029774=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/pinctrl-rockchip.c:912:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 07 Jun 2022 11:24:12 +0800
Message-ID: <202206071106.oaNmFPW9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2288720017250029774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
inctrl/pinctrl-rockchip.c:912:17: warning: Value stored to 'dev' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e71e60cd74df9386c3f684c54888f2367050b831
commit: e4dd7fd5ff0acb3f3ed290f52afe20fd840d22b0 pinctrl/rockchip: Use temp=
orary variable for struct device
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-c004-20220604 (https://download.01.org/0day-ci/arch=
ive/20220607/202206071106.oaNmFPW9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De4dd7fd5ff0acb3f3ed290f52afe20fd840d22b0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e4dd7fd5ff0acb3f3ed290f52afe20fd840d22b0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:431:12: note: Field 'label' is null
           if (props.label) {
                     ^
   drivers/leds/led-core.c:431:2: note: Taking false branch
           if (props.label) {
           ^
   drivers/leds/led-core.c:445:19: note: Field 'function' is null
           } else if (props.function || props.color_present) {
                            ^
   drivers/leds/led-core.c:445:13: note: Left side of '||' is false
           } else if (props.function || props.color_present) {
                      ^
   drivers/leds/led-core.c:445:37: note: Field 'color_present' is false
           } else if (props.function || props.color_present) {
                                              ^
   drivers/leds/led-core.c:445:9: note: Taking false branch
           } else if (props.function || props.color_present) {
                  ^
   drivers/leds/led-core.c:464:13: note: Assuming field 'default_label' is =
null
           } else if (init_data->default_label) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:464:9: note: Taking false branch
           } else if (init_data->default_label) {
                  ^
   drivers/leds/led-core.c:471:13: note: Assuming the condition is true
           } else if (is_of_node(fwnode)) {
                      ^~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:471:9: note: Taking true branch
           } else if (is_of_node(fwnode)) {
                  ^
   drivers/leds/led-core.c:472:30: note: Assuming the condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/led-core.c:472:30: note: '?' condition is false
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/leds/led-core.c:472:30: note: Access to field 'name' results in =
a dereference of a null pointer
                   strscpy(led_classdev_name, to_of_node(fwnode)->name,
                                              ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/regulator/mt6360-regulator.c:243:74: warning: The result of the =
left shift is undefined because the right operand is negative [clang-analyz=
er-core.UndefinedBinaryOperatorResult]
           ret =3D regmap_update_bits(regmap, rdesc->mode_reg, rdesc->mode_=
mask, val << shift);
                                                                           =
        ^  ~~~~~
   drivers/regulator/mt6360-regulator.c:225:2: note: 'shift' initialized to=
 -1
           int shift =3D ffs(rdesc->mode_mask) - 1;
           ^~~~~~~~~
   drivers/regulator/mt6360-regulator.c:229:2: note: Control jumps to 'case=
 4:'  at line 236
           switch (mode) {
           ^
   drivers/regulator/mt6360-regulator.c:238:3: note:  Execution continues o=
n line 243
                   break;
                   ^
   drivers/regulator/mt6360-regulator.c:243:74: note: The result of the lef=
t shift is undefined because the right operand is negative
           ret =3D regmap_update_bits(regmap, rdesc->mode_reg, rdesc->mode_=
mask, val << shift);
                                                                           =
        ^  ~~~~~
   drivers/regulator/mt6360-regulator.c:265:6: warning: Assigned value is g=
arbage or undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D shift;
               ^   ~~~~~
   drivers/regulator/mt6360-regulator.c:256:2: note: 'shift' initialized to=
 -1
           int shift =3D ffs(rdesc->mode_mask) - 1;
           ^~~~~~~~~
   drivers/regulator/mt6360-regulator.c:261:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/regulator/mt6360-regulator.c:261:2: note: Taking false branch
           if (ret)
           ^
   drivers/regulator/mt6360-regulator.c:265:6: note: Assigned value is garb=
age or undefined
           val >>=3D shift;
               ^   ~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   fs/io_uring.c:1201:7: warning: Dereference of null pointer [clang-analyz=
er-core.NullDereference]
           if (!wq_list_empty(&ctx->submit_state.compl_reqs))
                ^
   fs/io-wq.h:38:30: note: expanded from macro 'wq_list_empty'
   #define wq_list_empty(list)     (READ_ONCE((list)->first) =3D=3D NULL)
                                    ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   fs/io_uring.c:2175:2: note: 'ctx' initialized to a null pointer value
           struct io_ring_ctx *ctx =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:2179:2: note: Loop condition is true.  Entering loop body
           while (1) {
           ^
   fs/io_uring.c:2182:7: note: Assuming field 'first' is non-null
                   if (!tctx->task_list.first && locked)
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:2182:30: note: Left side of '&&' is false
                   if (!tctx->task_list.first && locked)

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2288720017250029774==--

