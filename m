Content-Type: multipart/mixed; boundary="===============5934597566495976453=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9] thermal: mediatek: add another get_temp ops for thermal sensors
Date: Mon, 23 Aug 2021 07:36:25 +0800
Message-ID: <202108230721.SPpKbq7U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5934597566495976453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210820095206.30981-1-ben.tseng@mediatek.com>
References: <20210820095206.30981-1-ben.tseng@mediatek.com>
TO: Ben Tseng <ben.tseng@mediatek.com>
TO: Fan Chen <fan.chen@mediatek.com>
TO: Zhang Rui <rui.zhang@intel.com>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: linux-pm(a)vger.kernel.org
TO: srv_heupstream(a)mediatek.com
CC: Eduardo Valentin <edubezval@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: hsinyi(a)chromium.org

Hi Ben,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.14-rc6 next-20210820]
[cannot apply to thermal/next soc-thermal/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ben-Tseng/thermal-mediatek=
-add-another-get_temp-ops-for-thermal-sensors/20210820-175338
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
d992fe5318d8d7af9510b879439a3c7f283da442
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-c006-20210820 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d9c561=
3e856cf2addfbf892fc4c1ce9ef9feceaa)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/7a604b2102d4871211823259d=
e5cc4fe29530c66
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ben-Tseng/thermal-mediatek-add-ano=
ther-get_temp-ops-for-thermal-sensors/20210820-175338
        git checkout 7a604b2102d4871211823259de5cc4fe29530c66
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/w1/w1.c:589:3: warning: Value stored to 'event_owner' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   event_owner =3D "master";
                   ^             ~~~~~~~~
   drivers/w1/w1.c:589:3: note: Value stored to 'event_owner' is never read
                   event_owner =3D "master";
                   ^             ~~~~~~~~
   drivers/w1/w1.c:590:3: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   name =3D md->name;
                   ^      ~~~~~~~~
   drivers/w1/w1.c:590:3: note: Value stored to 'name' is never read
                   name =3D md->name;
                   ^      ~~~~~~~~
   drivers/w1/w1.c:593:3: warning: Value stored to 'event_owner' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   event_owner =3D "slave";
                   ^             ~~~~~~~
   drivers/w1/w1.c:593:3: note: Value stored to 'event_owner' is never read
                   event_owner =3D "slave";
                   ^             ~~~~~~~
   drivers/w1/w1.c:594:3: warning: Value stored to 'name' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   name =3D sl->name;
                   ^      ~~~~~~~~
   drivers/w1/w1.c:594:3: note: Value stored to 'name' is never read
                   name =3D sl->name;
                   ^      ~~~~~~~~
   drivers/w1/w1.c:997:2: warning: Value stored to 'search_bit' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           search_bit =3D 0;
           ^            ~
   drivers/w1/w1.c:997:2: note: Value stored to 'search_bit' is never read
           search_bit =3D 0;
           ^            ~
   drivers/w1/w1.c:999:2: warning: Value stored to 'last_rn' is never read =
[clang-analyzer-deadcode.DeadStores]
           last_rn =3D 0;
           ^         ~
   drivers/w1/w1.c:999:2: note: Value stored to 'last_rn' is never read
           last_rn =3D 0;
           ^         ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/thermal/devfreq_cooling.c:87:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D df->dev.parent;
                          ^~~   ~~~~~~~~~~~~~~
   drivers/thermal/devfreq_cooling.c:87:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D df->dev.parent;
                          ^~~   ~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   3 warnings generated.
>> drivers/thermal/mtk_thermal.c:1137:8: warning: 1st function call argumen=
t is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ret =3D devm_thermal_add_hwmon_sysfs(tzdev);
                 ^                            ~~~~~
   drivers/thermal/mtk_thermal.c:1024:2: note: 'tzdev' declared without an =
initial value
           struct thermal_zone_device *tzdev;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/mtk_thermal.c:1029:6: note: Assuming 'mt' is non-null
           if (!mt)
               ^~~
   drivers/thermal/mtk_thermal.c:1029:2: note: Taking false branch
           if (!mt)
           ^
   drivers/thermal/mtk_thermal.c:1035:6: note: Calling 'IS_ERR'
           if (IS_ERR(mt->clk_peri_therm))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/thermal/mtk_thermal.c:1035:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mt->clk_peri_therm))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/mtk_thermal.c:1035:2: note: Taking false branch
           if (IS_ERR(mt->clk_peri_therm))
           ^
   drivers/thermal/mtk_thermal.c:1039:6: note: Calling 'IS_ERR'
           if (IS_ERR(mt->clk_auxadc))
               ^~~~~~~~~~~~~~~~~~~~~~
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
   drivers/thermal/mtk_thermal.c:1039:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mt->clk_auxadc))
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/mtk_thermal.c:1039:2: note: Taking false branch
           if (IS_ERR(mt->clk_auxadc))
           ^
   drivers/thermal/mtk_thermal.c:1044:6: note: Calling 'IS_ERR'
           if (IS_ERR(mt->thermal_base))
               ^~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/thermal/mtk_thermal.c:1044:6: note: Returning from 'IS_ERR'
           if (IS_ERR(mt->thermal_base))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/mtk_thermal.c:1044:2: note: Taking false branch
           if (IS_ERR(mt->thermal_base))
           ^
   drivers/thermal/mtk_thermal.c:1048:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/thermal/mtk_thermal.c:1048:2: note: Taking false branch
           if (ret)
           ^
   drivers/thermal/mtk_thermal.c:1051:2: note: Loop condition is false.  Ex=
iting loop
           mutex_init(&mt->lock);
           ^
   include/linux/mutex.h:113:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/thermal/mtk_thermal.c:1056:6: note: Assuming 'auxadc' is non-null
           if (!auxadc) {
               ^~~~~~~
   drivers/thermal/mtk_thermal.c:1056:2: note: Taking false branch
           if (!auxadc) {
           ^
   drivers/thermal/mtk_thermal.c:1066:6: note: Assuming the condition is fa=
lse
           if (auxadc_phys_base =3D=3D OF_BAD_ADDR) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/mtk_thermal.c:1066:2: note: Taking false branch
           if (auxadc_phys_base =3D=3D OF_BAD_ADDR) {
           ^
   drivers/thermal/mtk_thermal.c:1072:6: note: Assuming 'apmixedsys' is non=
-null
           if (!apmixedsys) {

vim +1137 drivers/thermal/mtk_thermal.c

89945047b1666c Henry Yen                2020-04-30  1016  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1017  static int mtk_th=
ermal_probe(struct platform_device *pdev)
a92db1c8089e82 Sascha Hauer             2015-11-30  1018  {
bd9403943d7d19 Michael Kao              2019-02-01  1019  	int ret, i, ctrl=
_id;
a92db1c8089e82 Sascha Hauer             2015-11-30  1020  	struct device_no=
de *auxadc, *apmixedsys, *np =3D pdev->dev.of_node;
a92db1c8089e82 Sascha Hauer             2015-11-30  1021  	struct mtk_therm=
al *mt;
a92db1c8089e82 Sascha Hauer             2015-11-30  1022  	struct resource =
*res;
a92db1c8089e82 Sascha Hauer             2015-11-30  1023  	u64 auxadc_phys_=
base, apmixed_phys_base;
1f6b0889d0ea03 Axel Lin                 2016-09-07  1024  	struct thermal_z=
one_device *tzdev;
89945047b1666c Henry Yen                2020-04-30  1025  	void __iomem *ap=
mixed_base, *auxadc_base;
7a604b2102d487 Michael Kao              2021-08-20  1026  	struct mtk_therm=
al_bank *tz;
a92db1c8089e82 Sascha Hauer             2015-11-30  1027  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1028  	mt =3D devm_kzal=
loc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
a92db1c8089e82 Sascha Hauer             2015-11-30  1029  	if (!mt)
a92db1c8089e82 Sascha Hauer             2015-11-30  1030  		return -ENOMEM;
a92db1c8089e82 Sascha Hauer             2015-11-30  1031  =

9efc58dfa14a20 Ryder Lee                2018-04-16  1032  	mt->conf =3D of_=
device_get_match_data(&pdev->dev);
b7cf0053738c54 dawei.chien(a)mediatek.com 2016-08-18  1033  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1034  	mt->clk_peri_the=
rm =3D devm_clk_get(&pdev->dev, "therm");
a92db1c8089e82 Sascha Hauer             2015-11-30  1035  	if (IS_ERR(mt->c=
lk_peri_therm))
a92db1c8089e82 Sascha Hauer             2015-11-30  1036  		return PTR_ERR(=
mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer             2015-11-30  1037  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1038  	mt->clk_auxadc =
=3D devm_clk_get(&pdev->dev, "auxadc");
a92db1c8089e82 Sascha Hauer             2015-11-30  1039  	if (IS_ERR(mt->c=
lk_auxadc))
a92db1c8089e82 Sascha Hauer             2015-11-30  1040  		return PTR_ERR(=
mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1041  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1042  	res =3D platform=
_get_resource(pdev, IORESOURCE_MEM, 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1043  	mt->thermal_base=
 =3D devm_ioremap_resource(&pdev->dev, res);
a92db1c8089e82 Sascha Hauer             2015-11-30  1044  	if (IS_ERR(mt->t=
hermal_base))
a92db1c8089e82 Sascha Hauer             2015-11-30  1045  		return PTR_ERR(=
mt->thermal_base);
a92db1c8089e82 Sascha Hauer             2015-11-30  1046  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1047  	ret =3D mtk_ther=
mal_get_calibration_data(&pdev->dev, mt);
a92db1c8089e82 Sascha Hauer             2015-11-30  1048  	if (ret)
a92db1c8089e82 Sascha Hauer             2015-11-30  1049  		return ret;
a92db1c8089e82 Sascha Hauer             2015-11-30  1050  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1051  	mutex_init(&mt->=
lock);
a92db1c8089e82 Sascha Hauer             2015-11-30  1052  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1053  	mt->dev =3D &pde=
v->dev;
a92db1c8089e82 Sascha Hauer             2015-11-30  1054  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1055  	auxadc =3D of_pa=
rse_phandle(np, "mediatek,auxadc", 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1056  	if (!auxadc) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1057  		dev_err(&pdev->=
dev, "missing auxadc node\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1058  		return -ENODEV;
a92db1c8089e82 Sascha Hauer             2015-11-30  1059  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1060  =

89945047b1666c Henry Yen                2020-04-30  1061  	auxadc_base =3D =
of_iomap(auxadc, 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1062  	auxadc_phys_base=
 =3D of_get_phys_base(auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1063  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1064  	of_node_put(auxa=
dc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1065  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1066  	if (auxadc_phys_=
base =3D=3D OF_BAD_ADDR) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1067  		dev_err(&pdev->=
dev, "Can't get auxadc phys address\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1068  		return -EINVAL;
a92db1c8089e82 Sascha Hauer             2015-11-30  1069  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1070  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1071  	apmixedsys =3D o=
f_parse_phandle(np, "mediatek,apmixedsys", 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1072  	if (!apmixedsys)=
 {
a92db1c8089e82 Sascha Hauer             2015-11-30  1073  		dev_err(&pdev->=
dev, "missing apmixedsys node\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1074  		return -ENODEV;
a92db1c8089e82 Sascha Hauer             2015-11-30  1075  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1076  =

89945047b1666c Henry Yen                2020-04-30  1077  	apmixed_base =3D=
 of_iomap(apmixedsys, 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1078  	apmixed_phys_bas=
e =3D of_get_phys_base(apmixedsys);
a92db1c8089e82 Sascha Hauer             2015-11-30  1079  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1080  	of_node_put(apmi=
xedsys);
a92db1c8089e82 Sascha Hauer             2015-11-30  1081  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1082  	if (apmixed_phys=
_base =3D=3D OF_BAD_ADDR) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1083  		dev_err(&pdev->=
dev, "Can't get auxadc phys address\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1084  		return -EINVAL;
a92db1c8089e82 Sascha Hauer             2015-11-30  1085  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1086  =

703456ba76e944 Fabien Parent            2020-10-21  1087  	ret =3D device_r=
eset_optional(&pdev->dev);
6760f3f74e72d6 Louis Yu                 2017-08-01  1088  	if (ret)
6760f3f74e72d6 Louis Yu                 2017-08-01  1089  		return ret;
6760f3f74e72d6 Louis Yu                 2017-08-01  1090  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1091  	ret =3D clk_prep=
are_enable(mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1092  	if (ret) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1093  		dev_err(&pdev->=
dev, "Can't enable auxadc clk: %d\n", ret);
a92db1c8089e82 Sascha Hauer             2015-11-30  1094  		return ret;
a92db1c8089e82 Sascha Hauer             2015-11-30  1095  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1096  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1097  	ret =3D clk_prep=
are_enable(mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer             2015-11-30  1098  	if (ret) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1099  		dev_err(&pdev->=
dev, "Can't enable peri clk: %d\n", ret);
a92db1c8089e82 Sascha Hauer             2015-11-30  1100  		goto err_disabl=
e_clk_auxadc;
a92db1c8089e82 Sascha Hauer             2015-11-30  1101  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1102  =

89945047b1666c Henry Yen                2020-04-30  1103  	if (mt->conf->ve=
rsion =3D=3D MTK_THERMAL_V2) {
89945047b1666c Henry Yen                2020-04-30  1104  		mtk_thermal_tur=
n_on_buffer(apmixed_base);
89945047b1666c Henry Yen                2020-04-30  1105  		mtk_thermal_rel=
ease_periodic_ts(mt, auxadc_base);
89945047b1666c Henry Yen                2020-04-30  1106  	}
89945047b1666c Henry Yen                2020-04-30  1107  =

bd9403943d7d19 Michael Kao              2019-02-01  1108  	for (ctrl_id =3D=
 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
b7cf0053738c54 dawei.chien(a)mediatek.com 2016-08-18  1109  		for (i =3D 0;=
 i < mt->conf->num_banks; i++)
eb4fc33eb26807 Eduardo Valentin         2016-02-18  1110  			mtk_thermal_in=
it_bank(mt, i, apmixed_phys_base,
bd9403943d7d19 Michael Kao              2019-02-01  1111  					      auxadc=
_phys_base, ctrl_id);
a92db1c8089e82 Sascha Hauer             2015-11-30  1112  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1113  	platform_set_drv=
data(pdev, mt);
a92db1c8089e82 Sascha Hauer             2015-11-30  1114  =

7a604b2102d487 Michael Kao              2021-08-20  1115  	for (i =3D 0; i =
< mt->conf->num_sensors + 1; i++) {
7a604b2102d487 Michael Kao              2021-08-20  1116  		tz =3D devm_kma=
lloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
7a604b2102d487 Michael Kao              2021-08-20  1117  		if (!tz)
7a604b2102d487 Michael Kao              2021-08-20  1118  			return -ENOMEM;
7a604b2102d487 Michael Kao              2021-08-20  1119  =

7a604b2102d487 Michael Kao              2021-08-20  1120  		tz->mt =3D mt;
7a604b2102d487 Michael Kao              2021-08-20  1121  		tz->id =3D i;
7a604b2102d487 Michael Kao              2021-08-20  1122  =

7a604b2102d487 Michael Kao              2021-08-20  1123  		tzdev =3D devm_=
thermal_zone_of_sensor_register(
7a604b2102d487 Michael Kao              2021-08-20  1124  						&pdev->dev,=
 i, tz, (i =3D=3D 0) ?
7a604b2102d487 Michael Kao              2021-08-20  1125  						&mtk_therma=
l_ops :
7a604b2102d487 Michael Kao              2021-08-20  1126  						&mtk_therma=
l_sensor_ops);
7a604b2102d487 Michael Kao              2021-08-20  1127  =

1f6b0889d0ea03 Axel Lin                 2016-09-07  1128  		if (IS_ERR(tzde=
v)) {
1f6b0889d0ea03 Axel Lin                 2016-09-07  1129  			ret =3D PTR_ER=
R(tzdev);
7a604b2102d487 Michael Kao              2021-08-20  1130  			dev_err(&pdev-=
>dev,
7a604b2102d487 Michael Kao              2021-08-20  1131  				"Error: Faile=
d to register thermal zone %d, ret =3D %d\n",
7a604b2102d487 Michael Kao              2021-08-20  1132  				i, ret);
1f6b0889d0ea03 Axel Lin                 2016-09-07  1133  			goto err_disab=
le_clk_peri_therm;
1f6b0889d0ea03 Axel Lin                 2016-09-07  1134  		}
7a604b2102d487 Michael Kao              2021-08-20  1135  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1136  =

24e21d9f40ec3f Frank Wunderlich         2021-06-08 @1137  	ret =3D devm_the=
rmal_add_hwmon_sysfs(tzdev);
24e21d9f40ec3f Frank Wunderlich         2021-06-08  1138  	if (ret)
24e21d9f40ec3f Frank Wunderlich         2021-06-08  1139  		dev_warn(&pdev-=
>dev, "error in thermal_add_hwmon_sysfs");
24e21d9f40ec3f Frank Wunderlich         2021-06-08  1140  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1141  	return 0;
a92db1c8089e82 Sascha Hauer             2015-11-30  1142  =

1f6b0889d0ea03 Axel Lin                 2016-09-07  1143  err_disable_clk_p=
eri_therm:
1f6b0889d0ea03 Axel Lin                 2016-09-07  1144  	clk_disable_unpr=
epare(mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer             2015-11-30  1145  err_disable_clk_a=
uxadc:
a92db1c8089e82 Sascha Hauer             2015-11-30  1146  	clk_disable_unpr=
epare(mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1147  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1148  	return ret;
a92db1c8089e82 Sascha Hauer             2015-11-30  1149  }
a92db1c8089e82 Sascha Hauer             2015-11-30  1150  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5934597566495976453==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5934597566495976453==--

