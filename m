Content-Type: multipart/mixed; boundary="===============8139387292201134670=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/power/supply/ip5xxx_power.c:338:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 29 Mar 2022 13:10:08 +0800
Message-ID: <202203291311.aqHTu3RU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8139387292201134670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Samuel Holland <samuel@sholland.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1930a6e739c4b4a654a69164dbe39e554d228915
commit: 75853406fa27961044e7dc03c7dc8544477e81f5 power: supply: Add a drive=
r for Injoinic power bank ICs
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001-20220328 (https://download.01.org/0day-ci/arch=
ive/20220329/202203291311.aqHTu3RU-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D75853406fa27961044e7dc03c7dc8544477e81f5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 75853406fa27961044e7dc03c7dc8544477e81f5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   drivers/gpu/drm/drm_debugfs.c:245:14: note: Assuming 'i' is < 'count'
           for (i =3D 0; i < count; i++) {
                       ^~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:245:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < count; i++) {
           ^
   drivers/gpu/drm/drm_debugfs.c:246:22: note: Use of memory after it is fr=
eed
                   list_for_each_safe(pos, q, &minor->debugfs_list) {
                                      ^
   include/linux/list.h:607:31: note: expanded from macro 'list_for_each_sa=
fe'
           for (pos =3D (head)->next, n =3D pos->next; \
                                        ^~~~~~~~~
   include/linux/list.h:137:2: warning: Use of memory after it is freed [cl=
ang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
           ^
   drivers/gpu/drm/drm_debugfs.c:245:14: note: Assuming 'i' is < 'count'
           for (i =3D 0; i < count; i++) {
                       ^~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:245:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < count; i++) {
           ^
   drivers/gpu/drm/drm_debugfs.c:246:3: note: Loop condition is true.  Ente=
ring loop body
                   list_for_each_safe(pos, q, &minor->debugfs_list) {
                   ^
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   drivers/gpu/drm/drm_debugfs.c:248:8: note: Assuming the condition is fal=
se
                           if (tmp->info_ent =3D=3D &files[i]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:248:4: note: Taking false branch
                           if (tmp->info_ent =3D=3D &files[i]) {
                           ^
   drivers/gpu/drm/drm_debugfs.c:246:3: note: Loop condition is true.  Ente=
ring loop body
                   list_for_each_safe(pos, q, &minor->debugfs_list) {
                   ^
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   drivers/gpu/drm/drm_debugfs.c:248:8: note: Assuming the condition is true
                           if (tmp->info_ent =3D=3D &files[i]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:248:4: note: Taking true branch
                           if (tmp->info_ent =3D=3D &files[i]) {
                           ^
   drivers/gpu/drm/drm_debugfs.c:251:5: note: Memory is released
                                   kfree(tmp);
                                   ^~~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:246:3: note: Loop condition is false. Exec=
ution continues on line 245
                   list_for_each_safe(pos, q, &minor->debugfs_list) {
                   ^
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   drivers/gpu/drm/drm_debugfs.c:245:14: note: Assuming 'i' is < 'count'
           for (i =3D 0; i < count; i++) {
                       ^~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:245:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < count; i++) {
           ^
   drivers/gpu/drm/drm_debugfs.c:246:3: note: Loop condition is true.  Ente=
ring loop body
                   list_for_each_safe(pos, q, &minor->debugfs_list) {
                   ^
   include/linux/list.h:607:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; \
           ^
   drivers/gpu/drm/drm_debugfs.c:248:8: note: Assuming the condition is true
                           if (tmp->info_ent =3D=3D &files[i]) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_debugfs.c:248:4: note: Taking true branch
                           if (tmp->info_ent =3D=3D &files[i]) {
                           ^
   drivers/gpu/drm/drm_debugfs.c:250:5: note: Calling 'list_del'
                                   list_del(pos);
                                   ^~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:2: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
           ^                       ~~~~~~~~~~~
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
   6 warnings generated.
>> drivers/power/supply/ip5xxx_power.c:338:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5XXX_BATVADC_D=
AT0,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/power/supply/ip5xxx_power.c:338:3: note: Value stored to 'ret' i=
s never read
                   ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5XXX_BATVADC_D=
AT0,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/power/supply/ip5xxx_power.c:341:49: warning: The left operand of=
 '*' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   val->intval =3D 2600000 + DIV_ROUND_CLOSEST(raw * 26855,=
 100);
                                                                 ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   drivers/power/supply/ip5xxx_power.c:317:6: note: 'raw' declared without =
an initial value
           int raw, ret, vmax;
               ^~~
   drivers/power/supply/ip5xxx_power.c:320:8: note: Calling 'ip5xxx_initial=
ize'
           ret =3D ip5xxx_initialize(psy);
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:119:6: note: Assuming field 'initial=
ized' is true
           if (ip5xxx->initialized)
               ^~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:119:2: note: Taking true branch
           if (ip5xxx->initialized)
           ^
   drivers/power/supply/ip5xxx_power.c:120:3: note: Returning zero, which p=
articipates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/power/supply/ip5xxx_power.c:320:8: note: Returning from 'ip5xxx_=
initialize'
           ret =3D ip5xxx_initialize(psy);
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:321:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/power/supply/ip5xxx_power.c:321:2: note: Taking false branch
           if (ret)
           ^
   drivers/power/supply/ip5xxx_power.c:324:2: note: Control jumps to 'case =
POWER_SUPPLY_PROP_VOLTAGE_NOW:'  at line 337
           switch (psp) {
           ^
   drivers/power/supply/ip5xxx_power.c:338:9: note: Calling 'ip5xxx_battery=
_read_adc'
                   ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5XXX_BATVADC_D=
AT0,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/power/supply/ip5xxx_power.c:300:6: note: 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/power/supply/ip5xxx_power.c:300:2: note: Taking true branch
           if (ret)
           ^
   drivers/power/supply/ip5xxx_power.c:301:3: note: Returning without writi=
ng to '*val'
                   return ret;
                   ^
   drivers/power/supply/ip5xxx_power.c:338:9: note: Returning from 'ip5xxx_=
battery_read_adc'
                   ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5XXX_BATVADC_D=
AT0,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/power/supply/ip5xxx_power.c:341:49: note: The left operand of '*=
' is a garbage value
                   val->intval =3D 2600000 + DIV_ROUND_CLOSEST(raw * 26855,=
 100);
                                                                 ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   drivers/power/supply/ip5xxx_power.c:345:3: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5XXX_BATOCV_DA=
T0,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:345:3: note: Value stored to 'ret' i=
s never read
                   ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5XXX_BATOCV_DA=
T0,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:348:49: warning: The left operand of=
 '*' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   val->intval =3D 2600000 + DIV_ROUND_CLOSEST(raw * 26855,=
 100);
                                                                 ^
   include/linux/math.h:87:18: note: expanded from macro 'DIV_ROUND_CLOSEST'
           typeof(x) __x =3D x;                              \
                           ^
   drivers/power/supply/ip5xxx_power.c:317:6: note: 'raw' declared without =
an initial value
           int raw, ret, vmax;
               ^~~
   drivers/power/supply/ip5xxx_power.c:320:8: note: Calling 'ip5xxx_initial=
ize'
           ret =3D ip5xxx_initialize(psy);
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:119:6: note: Assuming field 'initial=
ized' is true
           if (ip5xxx->initialized)
               ^~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:119:2: note: Taking true branch
           if (ip5xxx->initialized)
           ^
   drivers/power/supply/ip5xxx_power.c:120:3: note: Returning zero, which p=
articipates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/power/supply/ip5xxx_power.c:320:8: note: Returning from 'ip5xxx_=
initialize'
           ret =3D ip5xxx_initialize(psy);
                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/ip5xxx_power.c:321:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/power/supply/ip5xxx_power.c:321:2: note: Taking false branch
           if (ret)
           ^
   drivers/power/supply/ip5xxx_power.c:324:2: note: Control jumps to 'case =
POWER_SUPPLY_PROP_VOLTAGE_OCV:'  at line 344
           switch (psp) {
           ^
   drivers/power/supply/ip5xxx_power.c:345:9: note: Calling 'ip5xxx_battery=
_read_adc'
                   ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5XXX_BATOCV_DA=
T0,

vim +/ret +338 drivers/power/supply/ip5xxx_power.c

75853406fa2796 Samuel Holland 2022-02-13  311  =

75853406fa2796 Samuel Holland 2022-02-13  312  static int ip5xxx_battery_ge=
t_property(struct power_supply *psy,
75853406fa2796 Samuel Holland 2022-02-13  313  				       enum power_supply=
_property psp,
75853406fa2796 Samuel Holland 2022-02-13  314  				       union power_suppl=
y_propval *val)
75853406fa2796 Samuel Holland 2022-02-13  315  {
75853406fa2796 Samuel Holland 2022-02-13  316  	struct ip5xxx *ip5xxx =3D p=
ower_supply_get_drvdata(psy);
75853406fa2796 Samuel Holland 2022-02-13  317  	int raw, ret, vmax;
75853406fa2796 Samuel Holland 2022-02-13  318  	unsigned int rval;
75853406fa2796 Samuel Holland 2022-02-13  319  =

75853406fa2796 Samuel Holland 2022-02-13  320  	ret =3D ip5xxx_initialize(p=
sy);
75853406fa2796 Samuel Holland 2022-02-13  321  	if (ret)
75853406fa2796 Samuel Holland 2022-02-13  322  		return ret;
75853406fa2796 Samuel Holland 2022-02-13  323  =

75853406fa2796 Samuel Holland 2022-02-13  324  	switch (psp) {
75853406fa2796 Samuel Holland 2022-02-13  325  	case POWER_SUPPLY_PROP_STAT=
US:
75853406fa2796 Samuel Holland 2022-02-13  326  		return ip5xxx_battery_get_=
status(ip5xxx, &val->intval);
75853406fa2796 Samuel Holland 2022-02-13  327  =

75853406fa2796 Samuel Holland 2022-02-13  328  	case POWER_SUPPLY_PROP_CHAR=
GE_TYPE:
75853406fa2796 Samuel Holland 2022-02-13  329  		return ip5xxx_battery_get_=
charge_type(ip5xxx, &val->intval);
75853406fa2796 Samuel Holland 2022-02-13  330  =

75853406fa2796 Samuel Holland 2022-02-13  331  	case POWER_SUPPLY_PROP_HEAL=
TH:
75853406fa2796 Samuel Holland 2022-02-13  332  		return ip5xxx_battery_get_=
health(ip5xxx, &val->intval);
75853406fa2796 Samuel Holland 2022-02-13  333  =

75853406fa2796 Samuel Holland 2022-02-13  334  	case POWER_SUPPLY_PROP_VOLT=
AGE_MAX_DESIGN:
75853406fa2796 Samuel Holland 2022-02-13  335  		return ip5xxx_battery_get_=
voltage_max(ip5xxx, &val->intval);
75853406fa2796 Samuel Holland 2022-02-13  336  =

75853406fa2796 Samuel Holland 2022-02-13  337  	case POWER_SUPPLY_PROP_VOLT=
AGE_NOW:
75853406fa2796 Samuel Holland 2022-02-13 @338  		ret =3D ip5xxx_battery_rea=
d_adc(ip5xxx, IP5XXX_BATVADC_DAT0,
75853406fa2796 Samuel Holland 2022-02-13  339  					      IP5XXX_BATVADC_DA=
T1, &raw);
75853406fa2796 Samuel Holland 2022-02-13  340  =

75853406fa2796 Samuel Holland 2022-02-13  341  		val->intval =3D 2600000 + =
DIV_ROUND_CLOSEST(raw * 26855, 100);
75853406fa2796 Samuel Holland 2022-02-13  342  		return 0;
75853406fa2796 Samuel Holland 2022-02-13  343  =

75853406fa2796 Samuel Holland 2022-02-13  344  	case POWER_SUPPLY_PROP_VOLT=
AGE_OCV:
75853406fa2796 Samuel Holland 2022-02-13  345  		ret =3D ip5xxx_battery_rea=
d_adc(ip5xxx, IP5XXX_BATOCV_DAT0,
75853406fa2796 Samuel Holland 2022-02-13  346  					      IP5XXX_BATOCV_DAT=
1, &raw);
75853406fa2796 Samuel Holland 2022-02-13  347  =

75853406fa2796 Samuel Holland 2022-02-13  348  		val->intval =3D 2600000 + =
DIV_ROUND_CLOSEST(raw * 26855, 100);
75853406fa2796 Samuel Holland 2022-02-13  349  		return 0;
75853406fa2796 Samuel Holland 2022-02-13  350  =

75853406fa2796 Samuel Holland 2022-02-13  351  	case POWER_SUPPLY_PROP_CURR=
ENT_NOW:
75853406fa2796 Samuel Holland 2022-02-13  352  		ret =3D ip5xxx_battery_rea=
d_adc(ip5xxx, IP5XXX_BATIADC_DAT0,
75853406fa2796 Samuel Holland 2022-02-13  353  					      IP5XXX_BATIADC_DA=
T1, &raw);
75853406fa2796 Samuel Holland 2022-02-13  354  =

75853406fa2796 Samuel Holland 2022-02-13  355  		val->intval =3D DIV_ROUND_=
CLOSEST(raw * 745985, 1000);
75853406fa2796 Samuel Holland 2022-02-13  356  		return 0;
75853406fa2796 Samuel Holland 2022-02-13  357  =

75853406fa2796 Samuel Holland 2022-02-13  358  	case POWER_SUPPLY_PROP_CONS=
TANT_CHARGE_CURRENT:
75853406fa2796 Samuel Holland 2022-02-13  359  		ret =3D ip5xxx_read(ip5xxx=
, IP5XXX_CHG_CTL4A, &rval);
75853406fa2796 Samuel Holland 2022-02-13  360  		if (ret)
75853406fa2796 Samuel Holland 2022-02-13  361  			return ret;
75853406fa2796 Samuel Holland 2022-02-13  362  =

75853406fa2796 Samuel Holland 2022-02-13  363  		rval &=3D IP5XXX_CHG_CTL4A=
_CONST_CUR_SEL;
75853406fa2796 Samuel Holland 2022-02-13  364  		val->intval =3D 100000 * r=
val;
75853406fa2796 Samuel Holland 2022-02-13  365  		return 0;
75853406fa2796 Samuel Holland 2022-02-13  366  =

75853406fa2796 Samuel Holland 2022-02-13  367  	case POWER_SUPPLY_PROP_CONS=
TANT_CHARGE_CURRENT_MAX:
75853406fa2796 Samuel Holland 2022-02-13  368  		val->intval =3D 100000 * 0=
x1f;
75853406fa2796 Samuel Holland 2022-02-13  369  		return 0;
75853406fa2796 Samuel Holland 2022-02-13  370  =

75853406fa2796 Samuel Holland 2022-02-13  371  	case POWER_SUPPLY_PROP_CONS=
TANT_CHARGE_VOLTAGE:
75853406fa2796 Samuel Holland 2022-02-13  372  		ret =3D ip5xxx_battery_get=
_voltage_max(ip5xxx, &vmax);
75853406fa2796 Samuel Holland 2022-02-13  373  		if (ret)
75853406fa2796 Samuel Holland 2022-02-13  374  			return ret;
75853406fa2796 Samuel Holland 2022-02-13  375  =

75853406fa2796 Samuel Holland 2022-02-13  376  		ret =3D ip5xxx_read(ip5xxx=
, IP5XXX_CHG_CTL2, &rval);
75853406fa2796 Samuel Holland 2022-02-13  377  		if (ret)
75853406fa2796 Samuel Holland 2022-02-13  378  			return ret;
75853406fa2796 Samuel Holland 2022-02-13  379  =

75853406fa2796 Samuel Holland 2022-02-13  380  		rval &=3D IP5XXX_CHG_CTL2_=
CONST_VOLT_SEL;
75853406fa2796 Samuel Holland 2022-02-13  381  		val->intval =3D vmax + 140=
00 * (rval >> 1);
75853406fa2796 Samuel Holland 2022-02-13  382  		return 0;
75853406fa2796 Samuel Holland 2022-02-13  383  =

75853406fa2796 Samuel Holland 2022-02-13  384  	case POWER_SUPPLY_PROP_CONS=
TANT_CHARGE_VOLTAGE_MAX:
75853406fa2796 Samuel Holland 2022-02-13  385  		ret =3D ip5xxx_battery_get=
_voltage_max(ip5xxx, &vmax);
75853406fa2796 Samuel Holland 2022-02-13  386  		if (ret)
75853406fa2796 Samuel Holland 2022-02-13  387  			return ret;
75853406fa2796 Samuel Holland 2022-02-13  388  =

75853406fa2796 Samuel Holland 2022-02-13  389  		val->intval =3D vmax + 140=
00 * 3;
75853406fa2796 Samuel Holland 2022-02-13  390  		return 0;
75853406fa2796 Samuel Holland 2022-02-13  391  =

75853406fa2796 Samuel Holland 2022-02-13  392  	default:
75853406fa2796 Samuel Holland 2022-02-13  393  		return -EINVAL;
75853406fa2796 Samuel Holland 2022-02-13  394  	}
75853406fa2796 Samuel Holland 2022-02-13  395  }
75853406fa2796 Samuel Holland 2022-02-13  396  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8139387292201134670==--

