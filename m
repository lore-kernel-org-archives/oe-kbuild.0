Content-Type: multipart/mixed; boundary="===============7741046326475350982=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10066/11953] drivers/power/supply/ip5xxx_power.c:341 ip5xxx_battery_get_property() error: uninitialized symbol 'raw'.
Date: Sun, 13 Mar 2022 04:15:00 +0800
Message-ID: <202203130446.7pSbN786-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7741046326475350982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Samuel Holland <samuel@sholland.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 75853406fa27961044e7dc03c7dc8544477e81f5 [10066/11953] power: suppl=
y: Add a driver for Injoinic power bank ICs
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-m031-20220312 (https://download.01.org/0day-ci/arc=
hive/20220313/202203130446.7pSbN786-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/power/supply/ip5xxx_power.c:341 ip5xxx_battery_get_property() error=
: uninitialized symbol 'raw'.

Old smatch warnings:
drivers/power/supply/ip5xxx_power.c:348 ip5xxx_battery_get_property() error=
: uninitialized symbol 'raw'.
drivers/power/supply/ip5xxx_power.c:355 ip5xxx_battery_get_property() error=
: uninitialized symbol 'raw'.

vim +/raw +341 drivers/power/supply/ip5xxx_power.c

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
75853406fa2796 Samuel Holland 2022-02-13  338  		ret =3D ip5xxx_battery_rea=
d_adc(ip5xxx, IP5XXX_BATVADC_DAT0,
75853406fa2796 Samuel Holland 2022-02-13  339  					      IP5XXX_BATVADC_DA=
T1, &raw);
75853406fa2796 Samuel Holland 2022-02-13  340  =

75853406fa2796 Samuel Holland 2022-02-13 @341  		val->intval =3D 2600000 + =
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


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7741046326475350982==--

