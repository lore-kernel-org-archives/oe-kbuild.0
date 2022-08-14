Content-Type: multipart/mixed; boundary="===============1337017413417855317=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/power/supply/ip5xxx_power.c:341:63: warning: use of uninitialized value 'raw' [CWE-457]
Date: Mon, 15 Aug 2022 04:57:29 +0800
Message-ID: <202208150419.z1BmgcNe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1337017413417855317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/p=
ower/supply/ip5xxx_power.c:341:63: warning: use of uninitialized value 'raw=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Samuel Holland <samuel@sholland.org>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d6a0f4da9275f6c212de33777778673ba91241a
commit: 75853406fa27961044e7dc03c7dc8544477e81f5 power: supply: Add a drive=
r for Injoinic power bank ICs
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220814 (https://download.01.org/0day-ci/archi=
ve/20220815/202208150419.z1BmgcNe-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/current.h:5,
                    from arch/arm/include/asm/current.h:50,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/power/supply/ip5xxx_power.c:5:
   drivers/power/supply/ip5xxx_power.c: In function 'ip5xxx_battery_get_pro=
perty':
>> drivers/power/supply/ip5xxx_power.c:341:63: warning: use of uninitialize=
d value 'raw' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     341 |                 val->intval =3D 2600000 + DIV_ROUND_CLOSEST(raw =
* 26855, 100);
         |                                                           ~~~~^~=
~~~~~
   include/linux/math.h:87:25: note: in definition of macro 'DIV_ROUND_CLOS=
EST'
      87 |         typeof(x) __x =3D x;                              \
         |                         ^
     'ip5xxx_battery_get_property': events 1-7
       |
       |drivers/power/supply/ip5xxx_power.c:312:12:
       |  312 | static int ip5xxx_battery_get_property(struct power_supply =
*psy,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ip5xxx_battery_get_property'
       |......
       |  317 |         int raw, ret, vmax;
       |      |             ~~~
       |      |             |
       |      |             (2) region created on stack here
       |......
       |  321 |         if (ret)
       |      |            ~
       |      |            |
       |      |            (3) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       |  324 |         switch (psp) {
       |      |         ~~~~~~
       |      |         |
       |      |         (4) ...to here
       |      |         (5) following 'case 12:' branch...
       |......
       |  337 |         case POWER_SUPPLY_PROP_VOLTAGE_NOW:
       |      |         ~~~~
       |      |         |
       |      |         (6) ...to here
       |  338 |                 ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5=
XXX_BATVADC_DAT0,
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (7) calling 'ip5xxx_battery_read_adc'=
 from 'ip5xxx_battery_get_property'
       |  339 |                                               IP5XXX_BATVAD=
C_DAT1, &raw);
       |      |                                               ~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |
       +--> 'ip5xxx_battery_read_adc': events 8-11
              |
              |  293 | static int ip5xxx_battery_read_adc(struct ip5xxx *ip=
5xxx,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (8) entry to 'ip5xxx_battery_read_adc'
              |......
              |  300 |         if (ret)
              |      |            ~
              |      |            |
              |      |            (9) following 'false' branch (when 'ret =
=3D=3D 0')...
              |......
              |  303 |         ret =3D ip5xxx_read(ip5xxx, hi_reg, &hi);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (10) ...to here
              |      |               (11) calling 'ip5xxx_read' from 'ip5xx=
x_battery_read_adc'
              |
              +--> 'ip5xxx_read': events 12-14
                     |
                     |   90 | static int ip5xxx_read(struct ip5xxx *ip5xxx,=
 unsigned int reg,
                     |      |            ^~~~~~~~~~~
                     |      |            |
                     |      |            (12) entry to 'ip5xxx_read'
                     |......
                     |   96 |         if (ret)
                     |      |            ~
                     |      |            |
                     |      |            (13) following 'true' branch (when=
 'ret !=3D 0')...
                     |   97 |                 ip5xxx->initialized =3D false;
                     |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                                     |
                     |      |                                     (14) ...t=
o here
                     |
              <------+
              |
            'ip5xxx_battery_read_adc': events 15-16
              |
              |  303 |         ret =3D ip5xxx_read(ip5xxx, hi_reg, &hi);
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |               |
              |      |               (15) returning to 'ip5xxx_battery_read=
_adc' from 'ip5xxx_read'
              |  304 |         if (ret)
              |      |            ~   =

              |      |            |
              |      |            (16) following 'true' branch (when 'ret !=
=3D 0')...
              |
            'ip5xxx_battery_read_adc': event 17
              |
              |cc1:
              | (17): ...to here
              |
       <------+
       |
     'ip5xxx_battery_get_property': event 18
       |
       |  338 |                 ret =3D ip5xxx_battery_read_adc(ip5xxx, IP5=
XXX_BATVADC_DAT0,
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (18) returning to 'ip5xxx_battery_get=
_property' from 'ip5xxx_battery_read_adc'

vim +/raw +341 drivers/power/supply/ip5xxx_power.c

75853406fa27961 Samuel Holland 2022-02-13  311  =

75853406fa27961 Samuel Holland 2022-02-13  312  static int ip5xxx_battery_g=
et_property(struct power_supply *psy,
75853406fa27961 Samuel Holland 2022-02-13  313  				       enum power_suppl=
y_property psp,
75853406fa27961 Samuel Holland 2022-02-13  314  				       union power_supp=
ly_propval *val)
75853406fa27961 Samuel Holland 2022-02-13  315  {
75853406fa27961 Samuel Holland 2022-02-13  316  	struct ip5xxx *ip5xxx =3D =
power_supply_get_drvdata(psy);
75853406fa27961 Samuel Holland 2022-02-13  317  	int raw, ret, vmax;
75853406fa27961 Samuel Holland 2022-02-13  318  	unsigned int rval;
75853406fa27961 Samuel Holland 2022-02-13  319  =

75853406fa27961 Samuel Holland 2022-02-13  320  	ret =3D ip5xxx_initialize(=
psy);
75853406fa27961 Samuel Holland 2022-02-13  321  	if (ret)
75853406fa27961 Samuel Holland 2022-02-13  322  		return ret;
75853406fa27961 Samuel Holland 2022-02-13  323  =

75853406fa27961 Samuel Holland 2022-02-13  324  	switch (psp) {
75853406fa27961 Samuel Holland 2022-02-13  325  	case POWER_SUPPLY_PROP_STA=
TUS:
75853406fa27961 Samuel Holland 2022-02-13  326  		return ip5xxx_battery_get=
_status(ip5xxx, &val->intval);
75853406fa27961 Samuel Holland 2022-02-13  327  =

75853406fa27961 Samuel Holland 2022-02-13  328  	case POWER_SUPPLY_PROP_CHA=
RGE_TYPE:
75853406fa27961 Samuel Holland 2022-02-13  329  		return ip5xxx_battery_get=
_charge_type(ip5xxx, &val->intval);
75853406fa27961 Samuel Holland 2022-02-13  330  =

75853406fa27961 Samuel Holland 2022-02-13  331  	case POWER_SUPPLY_PROP_HEA=
LTH:
75853406fa27961 Samuel Holland 2022-02-13  332  		return ip5xxx_battery_get=
_health(ip5xxx, &val->intval);
75853406fa27961 Samuel Holland 2022-02-13  333  =

75853406fa27961 Samuel Holland 2022-02-13  334  	case POWER_SUPPLY_PROP_VOL=
TAGE_MAX_DESIGN:
75853406fa27961 Samuel Holland 2022-02-13  335  		return ip5xxx_battery_get=
_voltage_max(ip5xxx, &val->intval);
75853406fa27961 Samuel Holland 2022-02-13  336  =

75853406fa27961 Samuel Holland 2022-02-13  337  	case POWER_SUPPLY_PROP_VOL=
TAGE_NOW:
75853406fa27961 Samuel Holland 2022-02-13  338  		ret =3D ip5xxx_battery_re=
ad_adc(ip5xxx, IP5XXX_BATVADC_DAT0,
75853406fa27961 Samuel Holland 2022-02-13  339  					      IP5XXX_BATVADC_D=
AT1, &raw);
75853406fa27961 Samuel Holland 2022-02-13  340  =

75853406fa27961 Samuel Holland 2022-02-13 @341  		val->intval =3D 2600000 +=
 DIV_ROUND_CLOSEST(raw * 26855, 100);
75853406fa27961 Samuel Holland 2022-02-13  342  		return 0;
75853406fa27961 Samuel Holland 2022-02-13  343  =

75853406fa27961 Samuel Holland 2022-02-13  344  	case POWER_SUPPLY_PROP_VOL=
TAGE_OCV:
75853406fa27961 Samuel Holland 2022-02-13  345  		ret =3D ip5xxx_battery_re=
ad_adc(ip5xxx, IP5XXX_BATOCV_DAT0,
75853406fa27961 Samuel Holland 2022-02-13  346  					      IP5XXX_BATOCV_DA=
T1, &raw);
75853406fa27961 Samuel Holland 2022-02-13  347  =

75853406fa27961 Samuel Holland 2022-02-13  348  		val->intval =3D 2600000 +=
 DIV_ROUND_CLOSEST(raw * 26855, 100);
75853406fa27961 Samuel Holland 2022-02-13  349  		return 0;
75853406fa27961 Samuel Holland 2022-02-13  350  =

75853406fa27961 Samuel Holland 2022-02-13  351  	case POWER_SUPPLY_PROP_CUR=
RENT_NOW:
75853406fa27961 Samuel Holland 2022-02-13  352  		ret =3D ip5xxx_battery_re=
ad_adc(ip5xxx, IP5XXX_BATIADC_DAT0,
75853406fa27961 Samuel Holland 2022-02-13  353  					      IP5XXX_BATIADC_D=
AT1, &raw);
75853406fa27961 Samuel Holland 2022-02-13  354  =

75853406fa27961 Samuel Holland 2022-02-13  355  		val->intval =3D DIV_ROUND=
_CLOSEST(raw * 745985, 1000);
75853406fa27961 Samuel Holland 2022-02-13  356  		return 0;
75853406fa27961 Samuel Holland 2022-02-13  357  =

75853406fa27961 Samuel Holland 2022-02-13  358  	case POWER_SUPPLY_PROP_CON=
STANT_CHARGE_CURRENT:
75853406fa27961 Samuel Holland 2022-02-13  359  		ret =3D ip5xxx_read(ip5xx=
x, IP5XXX_CHG_CTL4A, &rval);
75853406fa27961 Samuel Holland 2022-02-13  360  		if (ret)
75853406fa27961 Samuel Holland 2022-02-13  361  			return ret;
75853406fa27961 Samuel Holland 2022-02-13  362  =

75853406fa27961 Samuel Holland 2022-02-13  363  		rval &=3D IP5XXX_CHG_CTL4=
A_CONST_CUR_SEL;
75853406fa27961 Samuel Holland 2022-02-13  364  		val->intval =3D 100000 * =
rval;
75853406fa27961 Samuel Holland 2022-02-13  365  		return 0;
75853406fa27961 Samuel Holland 2022-02-13  366  =

75853406fa27961 Samuel Holland 2022-02-13  367  	case POWER_SUPPLY_PROP_CON=
STANT_CHARGE_CURRENT_MAX:
75853406fa27961 Samuel Holland 2022-02-13  368  		val->intval =3D 100000 * =
0x1f;
75853406fa27961 Samuel Holland 2022-02-13  369  		return 0;
75853406fa27961 Samuel Holland 2022-02-13  370  =

75853406fa27961 Samuel Holland 2022-02-13  371  	case POWER_SUPPLY_PROP_CON=
STANT_CHARGE_VOLTAGE:
75853406fa27961 Samuel Holland 2022-02-13  372  		ret =3D ip5xxx_battery_ge=
t_voltage_max(ip5xxx, &vmax);
75853406fa27961 Samuel Holland 2022-02-13  373  		if (ret)
75853406fa27961 Samuel Holland 2022-02-13  374  			return ret;
75853406fa27961 Samuel Holland 2022-02-13  375  =

75853406fa27961 Samuel Holland 2022-02-13  376  		ret =3D ip5xxx_read(ip5xx=
x, IP5XXX_CHG_CTL2, &rval);
75853406fa27961 Samuel Holland 2022-02-13  377  		if (ret)
75853406fa27961 Samuel Holland 2022-02-13  378  			return ret;
75853406fa27961 Samuel Holland 2022-02-13  379  =

75853406fa27961 Samuel Holland 2022-02-13  380  		rval &=3D IP5XXX_CHG_CTL2=
_CONST_VOLT_SEL;
75853406fa27961 Samuel Holland 2022-02-13  381  		val->intval =3D vmax + 14=
000 * (rval >> 1);
75853406fa27961 Samuel Holland 2022-02-13  382  		return 0;
75853406fa27961 Samuel Holland 2022-02-13  383  =

75853406fa27961 Samuel Holland 2022-02-13  384  	case POWER_SUPPLY_PROP_CON=
STANT_CHARGE_VOLTAGE_MAX:
75853406fa27961 Samuel Holland 2022-02-13  385  		ret =3D ip5xxx_battery_ge=
t_voltage_max(ip5xxx, &vmax);
75853406fa27961 Samuel Holland 2022-02-13  386  		if (ret)
75853406fa27961 Samuel Holland 2022-02-13  387  			return ret;
75853406fa27961 Samuel Holland 2022-02-13  388  =

75853406fa27961 Samuel Holland 2022-02-13  389  		val->intval =3D vmax + 14=
000 * 3;
75853406fa27961 Samuel Holland 2022-02-13  390  		return 0;
75853406fa27961 Samuel Holland 2022-02-13  391  =

75853406fa27961 Samuel Holland 2022-02-13  392  	default:
75853406fa27961 Samuel Holland 2022-02-13  393  		return -EINVAL;
75853406fa27961 Samuel Holland 2022-02-13  394  	}
75853406fa27961 Samuel Holland 2022-02-13  395  }
75853406fa27961 Samuel Holland 2022-02-13  396  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1337017413417855317==--

