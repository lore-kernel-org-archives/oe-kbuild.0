Content-Type: multipart/mixed; boundary="===============4223716855314324017=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/2] power: supply: bq24735: add watchdog timer delay support
Date: Wed, 18 Aug 2021 06:45:52 +0800
Message-ID: <202108180620.kd59eys4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4223716855314324017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210816165245.40416-2-bruno.meneguele@smartgreen.net>
References: <20210816165245.40416-2-bruno.meneguele@smartgreen.net>
TO: Bruno Meneguele <bruno.meneguele@smartgreen.net>
TO: sre(a)kernel.org
TO: robh+dt(a)kernel.org
CC: linux-pm(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: Bruno Meneguele <bruno.meneguele@smartgreen.net>

Hi Bruno,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on power-supply/for-next]
[also build test WARNING on next-20210817]
[cannot apply to robh/for-next linux/master linus/master v5.14-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bruno-Meneguele/add-Watchd=
og-Timer-delay-support-for-BQ24735/20210817-005512
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-sup=
ply.git for-next
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: riscv-randconfig-c006-20210816 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2c6448=
cdc2f68f8c28fd0bd9404182b81306e6e6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/d6de3f6beb69494e793761990=
5e8eacceed4a203
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bruno-Meneguele/add-Watchdog-Timer=
-delay-support-for-BQ24735/20210817-005512
        git checkout d6de3f6beb69494e7937619905e8eacceed4a203
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/f2fs/segment.c:5116:26: note: Calling 'SM_I'
           for (segno =3D 0; segno < MAIN_SEGS(sbi); segno +=3D sbi->segs_p=
er_sec) {
                                   ^
   fs/f2fs/segment.h:73:25: note: expanded from macro 'MAIN_SEGS'
   #define MAIN_SEGS(sbi)  (SM_I(sbi)->main_segments)
                            ^~~~~~~~~
   fs/f2fs/f2fs.h:1929:2: note: Returning without writing to 'sbi->segs_per=
_sec'
           return (struct f2fs_sm_info *)(sbi->sm_info);
           ^
   fs/f2fs/segment.c:5116:26: note: Returning from 'SM_I'
           for (segno =3D 0; segno < MAIN_SEGS(sbi); segno +=3D sbi->segs_p=
er_sec) {
                                   ^
   fs/f2fs/segment.h:73:25: note: expanded from macro 'MAIN_SEGS'
   #define MAIN_SEGS(sbi)  (SM_I(sbi)->main_segments)
                            ^~~~~~~~~
   fs/f2fs/segment.c:5116:18: note: Assuming 'segno' is < field 'main_segme=
nts'
           for (segno =3D 0; segno < MAIN_SEGS(sbi); segno +=3D sbi->segs_p=
er_sec) {
                           ^~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5116:2: note: Loop condition is true.  Entering loop b=
ody
           for (segno =3D 0; segno < MAIN_SEGS(sbi); segno +=3D sbi->segs_p=
er_sec) {
           ^
   fs/f2fs/segment.c:5120:15: note: Assuming 'i' is >=3D field 'segs_per_se=
c'
                   for (i =3D 0; i < sbi->segs_per_sec; i++)
                               ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5120:3: note: Loop condition is false. Execution conti=
nues on line 5123
                   for (i =3D 0; i < sbi->segs_per_sec; i++)
                   ^
   fs/f2fs/segment.c:5123:26: note: Passing the value 0 via 2nd parameter '=
divisor'
                   mtime =3D div_u64(mtime, sbi->segs_per_sec);
                                          ^~~~~~~~~~~~~~~~~
   fs/f2fs/segment.c:5123:11: note: Calling 'div_u64'
                   mtime =3D div_u64(mtime, sbi->segs_per_sec);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:128:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:128:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:92:15: note: '__base' initialized to 0
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:226:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                       \
           ^~~~~~~~~~~~~~~
   include/linux/math64.h:92:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:229:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   include/linux/math64.h:92:15: note: 4 is >=3D 4
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:68:32: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   include/linux/math64.h:92:15: note: Left side of '&&' is true
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:233:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   include/asm-generic/div64.h:68:31: note: expanded from macro '__div64_co=
nst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   include/linux/math64.h:92:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:234:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   include/linux/math64.h:92:15: note: Taking true branch
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:241:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   include/linux/math64.h:92:15: note: Division by zero
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:242:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/power/supply/bq24735-charger.c:527:31: warning: The right operan=
d of '>' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
                           if (charger->poll_interval > wdt_ms) {
                                                      ^ ~~~~~~
   drivers/power/supply/bq24735-charger.c:397:12: note: Calling 'devm_kzall=
oc'
           charger =3D devm_kzalloc(&client->dev, sizeof(*charger), GFP_KER=
NEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/device.h:208:9: note: Value assigned to field 'platform_da=
ta', which participates in a condition later
           return devm_kmalloc(dev, size, gfp | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:208:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, size, gfp | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq24735-charger.c:397:12: note: Returning from 'dev=
m_kzalloc'
           charger =3D devm_kzalloc(&client->dev, sizeof(*charger), GFP_KER=
NEL);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/power/supply/bq24735-charger.c:398:6: note: Assuming 'charger' i=
s non-null
           if (!charger)
               ^~~~~~~~
   drivers/power/supply/bq24735-charger.c:398:2: note: Taking false branch
           if (!charger)
           ^
   drivers/power/supply/bq24735-charger.c:401:2: note: Loop condition is fa=
lse.  Exiting loop
           mutex_init(&charger->lock);
           ^
   include/linux/mutex.h:113:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/power/supply/bq24735-charger.c:405:6: note: Left side of '&&' is=
 true
           if (IS_ENABLED(CONFIG_OF) && !charger->pdata && client->dev.of_n=
ode)
               ^
   include/linux/kconfig.h:73:28: note: expanded from macro 'IS_ENABLED'
   #define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))
                              ^
   include/linux/kconfig.h:24:22: note: expanded from macro '__or'
   #define __or(x, y)                      ___or(x, y)
                                           ^
   include/linux/kconfig.h:25:23: note: expanded from macro '___or'
   #define ___or(x, y)                     ____or(__ARG_PLACEHOLDER_##x, y)
                                           ^
   include/linux/kconfig.h:26:65: note: expanded from macro '____or'
   #define ____or(arg1_or_junk, y)         __take_second_arg(arg1_or_junk 1=
, y)
                                                                          ^
   drivers/power/supply/bq24735-charger.c:405:31: note: Assuming field 'pda=
ta' is non-null
           if (IS_ENABLED(CONFIG_OF) && !charger->pdata && client->dev.of_n=
ode)
                                        ^~~~~~~~~~~~~~~
   drivers/power/supply/bq24735-charger.c:405:47: note: Left side of '&&' i=
s false
           if (IS_ENABLED(CONFIG_OF) && !charger->pdata && client->dev.of_n=
ode)
                                                        ^
   drivers/power/supply/bq24735-charger.c:408:16: note: Field 'pdata' is no=
n-null
           if (!charger->pdata) {
                         ^
   drivers/power/supply/bq24735-charger.c:408:2: note: Taking false branch
           if (!charger->pdata) {
           ^
   drivers/power/supply/bq24735-charger.c:414:6: note: Assuming 'name' is n=
on-null
           if (!name) {
               ^~~~~
   drivers/power/supply/bq24735-charger.c:414:2: note: Taking false branch
           if (!name) {
           ^
   drivers/power/supply/bq24735-charger.c:442:2: note: Calling 'i2c_set_cli=
entdata'
           i2c_set_clientdata(client, charger);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:365:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&client->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:686:1: note: Returning without writing to 'data->=
status_gpio', which participates in a condition later
   }
   ^
   include/linux/device.h:686:1: note: Returning without writing to 'data->=
poll_interval', which participates in a condition later
   include/linux/i2c.h:365:2: note: Returning from 'dev_set_drvdata'
           dev_set_drvdata(&client->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:366:1: note: Returning without writing to 'data->sta=
tus_gpio', which participates in a condition later
   }
   ^
   include/linux/i2c.h:366:1: note: Returning without writing to 'client->i=
rq', which participates in a condition later
   include/linux/i2c.h:366:1: note: Returning without writing to 'data->pol=
l_interval', which participates in a condition later
   drivers/power/supply/bq24735-charger.c:442:2: note: Returning from 'i2c_=
set_clientdata'
           i2c_set_clientdata(client, charger);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq24735-charger.c:447:6: note: Calling 'IS_ERR'
           if (IS_ERR(charger->status_gpio)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/power/supply/bq24735-charger.c:447:6: note: Returning from 'IS_E=
RR'
           if (IS_ERR(charger->status_gpio)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq24735-charger.c:447:2: note: Taking false branch
           if (IS_ERR(charger->status_gpio)) {

vim +527 drivers/power/supply/bq24735-charger.c

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  387  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  388  static int bq24735_charger_probe(struct i2c_client *client,
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  389  				 const struct i2c_device_id *id)
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  390  {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  391  	int ret;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  392  	struct bq24735 *charger;
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  393  	struct power_supply_desc *supply_desc;
2dc9215d7c94f7 drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  394  	struct power_supply_config psy_cfg =3D {};
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  395  	char *name;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  396  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  397  	charger =3D devm_kzalloc(&client->dev, sizeof(*charger), G=
FP_KERNEL);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  398  	if (!charger)
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  399  		return -ENOMEM;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  400  =

5b7a0187391fe9 drivers/power/bq24735-charger.c        Peter Rosin         2=
016-01-12  401  	mutex_init(&charger->lock);
5b7a0187391fe9 drivers/power/bq24735-charger.c        Peter Rosin         2=
016-01-12  402  	charger->charging =3D true;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  403  	charger->pdata =3D client->dev.platform_data;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  404  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  405  	if (IS_ENABLED(CONFIG_OF) && !charger->pdata && client->de=
v.of_node)
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  406  		charger->pdata =3D bq24735_parse_dt_data(client);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  407  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  408  	if (!charger->pdata) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  409  		dev_err(&client->dev, "no platform data provided\n");
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  410  		return -EINVAL;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  411  	}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  412  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  413  	name =3D (char *)charger->pdata->name;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  414  	if (!name) {
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  415  		name =3D devm_kasprintf(&client->dev, GFP_KERNEL,
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  416  				      "bq24735@%s",
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  417  				      dev_name(&client->dev));
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  418  		if (!name) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  419  			dev_err(&client->dev, "Failed to alloc device name\n");
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  420  			return -ENOMEM;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  421  		}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  422  	}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  423  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  424  	charger->client =3D client;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  425  =

297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  426  	supply_desc =3D &charger->charger_desc;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  427  =

297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  428  	supply_desc->name =3D name;
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  429  	supply_desc->type =3D POWER_SUPPLY_TYPE_MAINS;
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  430  	supply_desc->properties =3D bq24735_charger_properties;
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  431  	supply_desc->num_properties =3D ARRAY_SIZE(bq24735_charger=
_properties);
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  432  	supply_desc->get_property =3D bq24735_charger_get_property;
5b7a0187391fe9 drivers/power/bq24735-charger.c        Peter Rosin         2=
016-01-12  433  	supply_desc->set_property =3D bq24735_charger_set_property;
5b7a0187391fe9 drivers/power/bq24735-charger.c        Peter Rosin         2=
016-01-12  434  	supply_desc->property_is_writeable =3D
5b7a0187391fe9 drivers/power/bq24735-charger.c        Peter Rosin         2=
016-01-12  435  				bq24735_charger_property_is_writeable;
2dc9215d7c94f7 drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  436  =

2dc9215d7c94f7 drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  437  	psy_cfg.supplied_to =3D charger->pdata->supplied_to;
2dc9215d7c94f7 drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  438  	psy_cfg.num_supplicants =3D charger->pdata->num_supplicant=
s;
2dc9215d7c94f7 drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  439  	psy_cfg.of_node =3D client->dev.of_node;
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  440  	psy_cfg.drv_data =3D charger;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  441  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  442  	i2c_set_clientdata(client, charger);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  443  =

c65a8b51123a14 drivers/power/supply/bq24735-charger.c Paul Kocialkowski   2=
016-09-03  444  	charger->status_gpio =3D devm_gpiod_get_optional(&client->=
dev,
c65a8b51123a14 drivers/power/supply/bq24735-charger.c Paul Kocialkowski   2=
016-09-03  445  						       "ti,ac-detect",
c65a8b51123a14 drivers/power/supply/bq24735-charger.c Paul Kocialkowski   2=
016-09-03  446  						       GPIOD_IN);
c65a8b51123a14 drivers/power/supply/bq24735-charger.c Paul Kocialkowski   2=
016-09-03  447  	if (IS_ERR(charger->status_gpio)) {
c65a8b51123a14 drivers/power/supply/bq24735-charger.c Paul Kocialkowski   2=
016-09-03  448  		ret =3D PTR_ERR(charger->status_gpio);
c65a8b51123a14 drivers/power/supply/bq24735-charger.c Paul Kocialkowski   2=
016-09-03  449  		dev_err(&client->dev, "Getting gpio failed: %d\n", ret);
c65a8b51123a14 drivers/power/supply/bq24735-charger.c Paul Kocialkowski   2=
016-09-03  450  		return ret;
1a3adce1c2c834 drivers/power/bq24735-charger.c        Jonathan Tinkham    2=
016-02-02  451  	}
1a3adce1c2c834 drivers/power/bq24735-charger.c        Jonathan Tinkham    2=
016-02-02  452  =

a7d143d42b3d88 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-20  453  	if (bq24735_charger_is_present(charger)) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  454  		ret =3D bq24735_read_word(client, BQ24735_MANUFACTURER_ID=
);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  455  		if (ret < 0) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  456  			dev_err(&client->dev, "Failed to read manufacturer id : =
%d\n",
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  457  				ret);
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  458  			return ret;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  459  		} else if (ret !=3D 0x0040) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  460  			dev_err(&client->dev,
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  461  				"manufacturer id mismatch. 0x0040 !=3D 0x%04x\n", ret);
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  462  			return -ENODEV;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  463  		}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  464  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  465  		ret =3D bq24735_read_word(client, BQ24735_DEVICE_ID);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  466  		if (ret < 0) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  467  			dev_err(&client->dev, "Failed to read device id : %d\n",=
 ret);
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  468  			return ret;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  469  		} else if (ret !=3D 0x000B) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  470  			dev_err(&client->dev,
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  471  				"device id mismatch. 0x000b !=3D 0x%04x\n", ret);
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  472  			return -ENODEV;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  473  		}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  474  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  475  		ret =3D bq24735_enable_charging(charger);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  476  		if (ret < 0) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  477  			dev_err(&client->dev, "Failed to enable charging\n");
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  478  			return ret;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  479  		}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  480  	}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  481  =

71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  482  	charger->charger =3D devm_power_supply_register(&client->d=
ev, supply_desc,
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  483  						      &psy_cfg);
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  484  	if (IS_ERR(charger->charger)) {
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  485  		ret =3D PTR_ERR(charger->charger);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  486  		dev_err(&client->dev, "Failed to register power supply: %=
d\n",
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  487  			ret);
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  488  		return ret;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  489  	}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  490  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  491  	if (client->irq) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  492  		ret =3D devm_request_threaded_irq(&client->dev, client->i=
rq,
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  493  						NULL, bq24735_charger_isr,
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  494  						IRQF_TRIGGER_RISING |
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  495  						IRQF_TRIGGER_FALLING |
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  496  						IRQF_ONESHOT,
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  497  						supply_desc->name,
297d716f6260cc drivers/power/bq24735-charger.c        Krzysztof Kozlowski 2=
015-03-12  498  						charger->charger);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  499  		if (ret) {
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  500  			dev_err(&client->dev,
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  501  				"Unable to register IRQ %d err %d\n",
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  502  				client->irq, ret);
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  503  			return ret;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  504  		}
dbff4c8eaa85dc drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-21  505  	} else {
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  506  		ret =3D device_property_read_u32(&client->dev, "poll-inte=
rval",
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  507  					       &charger->poll_interval);
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  508  		if (ret)
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  509  			return 0;
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  510  		if (!charger->poll_interval)
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  511  			return 0;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  512  		if (charger->pdata->wdt_timeout > 0) {
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  513  			int wdt_ms;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  514  =

d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  515  			switch (charger->pdata->wdt_timeout) {
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  516  			case 1:
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  517  				wdt_ms =3D 44000;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  518  				break;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  519  			case 2:
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  520  				wdt_ms =3D 88000;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  521  				break;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  522  			case 3:
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  523  				wdt_ms =3D 175000;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  524  				break;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  525  			}
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  526  =

d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16 @527  			if (charger->poll_interval > wdt_ms) {
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  528  				dev_err(&client->dev,
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  529  					"Poll interval greater than WDT timeout\n");
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  530  				return -EINVAL;
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  531  			}
d6de3f6beb6949 drivers/power/supply/bq24735-charger.c Bruno Meneguele     2=
021-08-16  532  		}
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  533  =

6d0c5de2fd84a0 drivers/power/supply/bq24735-charger.c Matti Vaittinen     2=
021-03-23  534  		ret =3D devm_delayed_work_autocancel(&client->dev, &charg=
er->poll,
6d0c5de2fd84a0 drivers/power/supply/bq24735-charger.c Matti Vaittinen     2=
021-03-23  535  						   bq24735_poll);
6d0c5de2fd84a0 drivers/power/supply/bq24735-charger.c Matti Vaittinen     2=
021-03-23  536  		if (ret)
6d0c5de2fd84a0 drivers/power/supply/bq24735-charger.c Matti Vaittinen     2=
021-03-23  537  			return ret;
6d0c5de2fd84a0 drivers/power/supply/bq24735-charger.c Matti Vaittinen     2=
021-03-23  538  =

bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  539  		schedule_delayed_work(&charger->poll,
bf383fea1fdde9 drivers/power/supply/bq24735-charger.c Peter Rosin         2=
016-12-15  540  				      msecs_to_jiffies(charger->poll_interval));
71a5a508436332 drivers/power/bq24735-charger.c        Vaishali Thakkar    2=
015-07-25  541  	}
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  542  =

ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  543  	return 0;
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  544  }
ce77399226313a drivers/power/bq24735-charger.c        Darbha Sriharsha    2=
013-10-11  545  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4223716855314324017==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4223716855314324017==--

