Content-Type: multipart/mixed; boundary="===============4099226460572088712=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:126:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 02 Dec 2021 06:23:48 +0800
Message-ID: <202112020618.8Bxdky7v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4099226460572088712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Qing Zhang <zhangqing@loongson.cn>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: 30bba69d7db40e732d6c0aa6d4890c60d717e314 stmmac: pci: Add dwmac sup=
port for Loongson
date:   6 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-c001-20211130 (https://download.01.org/0day-ci/arch=
ive/20211202/202112020618.8Bxdky7v-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D30bba69d7db40e732d6c0aa6d4890c60d717e314
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 30bba69d7db40e732d6c0aa6d4890c60d717e314
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:873:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:873:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:949:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:949:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:967:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:967:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:986:21: warning: Value stored to 'c=
lient' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   drivers/media/dvb-frontends/af9033.c:986:21: note: Value stored to 'clie=
nt' during its initialization is never read
           struct i2c_client *client =3D dev->client;
                              ^~~~~~   ~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:76:6: warning: Bran=
ch condition evaluates to a garbage value [clang-analyzer-core.uninitialize=
d.Branch]
           if (mdio) {
               ^~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:52:14: note: 'mdio'=
 declared without an initial value
           int ret, i, mdio;
                       ^~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:55:7: note: Calling=
 'dev_of_node'
           np =3D dev_of_node(&pdev->dev);
                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:769:6: note: Left side of '||' is false
           if (!IS_ENABLED(CONFIG_OF) || !dev)
               ^
   include/linux/device.h:769:32: note: Assuming 'dev' is non-null, which p=
articipates in a condition later
           if (!IS_ENABLED(CONFIG_OF) || !dev)
                                         ^~~~
   include/linux/device.h:769:2: note: Taking false branch
           if (!IS_ENABLED(CONFIG_OF) || !dev)
           ^
   include/linux/device.h:771:2: note: Returning without writing to 'dev->o=
f_node', which participates in a condition later
           return dev->of_node;
           ^
   include/linux/device.h:771:2: note: Returning pointer, which participate=
s in a condition later
           return dev->of_node;
           ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:55:7: note: Returni=
ng from 'dev_of_node'
           np =3D dev_of_node(&pdev->dev);
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:57:6: note: Assumin=
g 'np' is non-null
           if (!np) {
               ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:57:2: note: Taking =
false branch
           if (!np) {
           ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:62:6: note: Assumin=
g the condition is false
           if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:62:2: note: Taking =
false branch
           if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
           ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:68:6: note: Assumin=
g 'plat' is non-null
           if (!plat)
               ^~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:68:2: note: Taking =
false branch
           if (!plat)
           ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:71:6: note: Assumin=
g field 'mdio_node' is null
           if (plat->mdio_node) {
               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:71:2: note: Taking =
false branch
           if (plat->mdio_node) {
           ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:76:6: note: Branch =
condition evaluates to a garbage value
           if (mdio) {
               ^~~~
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:126:3: warning: Val=
ue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:126:3: note: Value =
stored to 'ret' is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:138:3: warning: Val=
ue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:138:3: note: Value =
stored to 'ret' is never read
                   ret =3D -ENODEV;
                   ^     ~~~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/pmbus/zl6100.c:115:41: warning: The result of the left shi=
ft is undefined because the left operand is negative [clang-analyzer-core.U=
ndefinedBinaryOperatorResult]
           return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
                                                  ^
   drivers/hwmon/pmbus/zl6100.c:230:29: note: Left side of '&&' is false
           struct zl6100_data *data =3D to_zl6100_data(info);
                                      ^
   drivers/hwmon/pmbus/zl6100.c:30:28: note: expanded from macro 'to_zl6100=
_data'
   #define to_zl6100_data(x)  container_of(x, struct zl6100_data, info)
                              ^
   include/linux/kernel.h:716:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hwmon/pmbus/zl6100.c:230:29: note: Taking false branch
           struct zl6100_data *data =3D to_zl6100_data(info);
                                      ^
   drivers/hwmon/pmbus/zl6100.c:30:28: note: expanded from macro 'to_zl6100=
_data'
   #define to_zl6100_data(x)  container_of(x, struct zl6100_data, info)
                              ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hwmon/pmbus/zl6100.c:230:29: note: Loop condition is false.  Exi=
ting loop
           struct zl6100_data *data =3D to_zl6100_data(info);
                                      ^
   drivers/hwmon/pmbus/zl6100.c:30:28: note: expanded from macro 'to_zl6100=
_data'
   #define to_zl6100_data(x)  container_of(x, struct zl6100_data, info)
                              ^
   include/linux/kernel.h:716:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/hwmon/pmbus/zl6100.c:233:6: note: Assuming 'page' is <=3D 0
           if (page > 0)
               ^~~~~~~~
   drivers/hwmon/pmbus/zl6100.c:233:2: note: Taking false branch
           if (page > 0)
           ^
   drivers/hwmon/pmbus/zl6100.c:236:2: note: Control jumps to 'case PMBUS_V=
IRT_VMON_UV_WARN_LIMIT:'  at line 246
           switch (reg) {
           ^
   drivers/hwmon/pmbus/zl6100.c:247:21: note: Left side of '||' is false
                   word =3D zl6100_d2l(DIV_ROUND_CLOSEST(zl6100_l2d(word) *=
 10, 11));
                                     ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/pmbus/zl6100.c:247:21: note: Left side of '||' is false
                   word =3D zl6100_d2l(DIV_ROUND_CLOSEST(zl6100_l2d(word) *=
 10, 11));
                                     ^
   include/linux/math.h:89:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/hwmon/pmbus/zl6100.c:247:21: note: Assuming '__x' is <=3D 0
                   word =3D zl6100_d2l(DIV_ROUND_CLOSEST(zl6100_l2d(word) *=
 10, 11));
                                     ^
   include/linux/math.h:91:5: note: expanded from macro 'DIV_ROUND_CLOSEST'
            (((__x) > 0) =3D=3D ((__d) > 0))) ?                \

vim +/ret +126 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

30bba69d7db40e7 Qing Zhang 2021-06-18   47  =

30bba69d7db40e7 Qing Zhang 2021-06-18   48  static int loongson_dwmac_probe=
(struct pci_dev *pdev, const struct pci_device_id *id)
30bba69d7db40e7 Qing Zhang 2021-06-18   49  {
30bba69d7db40e7 Qing Zhang 2021-06-18   50  	struct plat_stmmacenet_data *p=
lat;
30bba69d7db40e7 Qing Zhang 2021-06-18   51  	struct stmmac_resources res;
30bba69d7db40e7 Qing Zhang 2021-06-18   52  	int ret, i, mdio;
30bba69d7db40e7 Qing Zhang 2021-06-18   53  	struct device_node *np;
30bba69d7db40e7 Qing Zhang 2021-06-18   54  =

30bba69d7db40e7 Qing Zhang 2021-06-18   55  	np =3D dev_of_node(&pdev->dev);
30bba69d7db40e7 Qing Zhang 2021-06-18   56  =

30bba69d7db40e7 Qing Zhang 2021-06-18   57  	if (!np) {
30bba69d7db40e7 Qing Zhang 2021-06-18   58  		pr_info("dwmac_loongson_pci: =
No OF node\n");
30bba69d7db40e7 Qing Zhang 2021-06-18   59  		return -ENODEV;
30bba69d7db40e7 Qing Zhang 2021-06-18   60  	}
30bba69d7db40e7 Qing Zhang 2021-06-18   61  =

30bba69d7db40e7 Qing Zhang 2021-06-18   62  	if (!of_device_is_compatible(n=
p, "loongson, pci-gmac")) {
30bba69d7db40e7 Qing Zhang 2021-06-18   63  		pr_info("dwmac_loongson_pci: =
Incompatible OF node\n");
30bba69d7db40e7 Qing Zhang 2021-06-18   64  		return -ENODEV;
30bba69d7db40e7 Qing Zhang 2021-06-18   65  	}
30bba69d7db40e7 Qing Zhang 2021-06-18   66  =

30bba69d7db40e7 Qing Zhang 2021-06-18   67  	plat =3D devm_kzalloc(&pdev->d=
ev, sizeof(*plat), GFP_KERNEL);
30bba69d7db40e7 Qing Zhang 2021-06-18   68  	if (!plat)
30bba69d7db40e7 Qing Zhang 2021-06-18   69  		return -ENOMEM;
30bba69d7db40e7 Qing Zhang 2021-06-18   70  =

30bba69d7db40e7 Qing Zhang 2021-06-18   71  	if (plat->mdio_node) {
30bba69d7db40e7 Qing Zhang 2021-06-18   72  		dev_err(&pdev->dev, "Found MD=
IO subnode\n");
30bba69d7db40e7 Qing Zhang 2021-06-18   73  		mdio =3D true;
30bba69d7db40e7 Qing Zhang 2021-06-18   74  	}
30bba69d7db40e7 Qing Zhang 2021-06-18   75  =

30bba69d7db40e7 Qing Zhang 2021-06-18   76  	if (mdio) {
30bba69d7db40e7 Qing Zhang 2021-06-18   77  		plat->mdio_bus_data =3D devm_=
kzalloc(&pdev->dev,
30bba69d7db40e7 Qing Zhang 2021-06-18   78  						   sizeof(*plat->mdio_bus=
_data),
30bba69d7db40e7 Qing Zhang 2021-06-18   79  						   GFP_KERNEL);
30bba69d7db40e7 Qing Zhang 2021-06-18   80  		if (!plat->mdio_bus_data)
30bba69d7db40e7 Qing Zhang 2021-06-18   81  			return -ENOMEM;
30bba69d7db40e7 Qing Zhang 2021-06-18   82  		plat->mdio_bus_data->needs_re=
set =3D true;
30bba69d7db40e7 Qing Zhang 2021-06-18   83  	}
30bba69d7db40e7 Qing Zhang 2021-06-18   84  =

30bba69d7db40e7 Qing Zhang 2021-06-18   85  	plat->dma_cfg =3D devm_kzalloc=
(&pdev->dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
30bba69d7db40e7 Qing Zhang 2021-06-18   86  	if (!plat->dma_cfg)
30bba69d7db40e7 Qing Zhang 2021-06-18   87  		return -ENOMEM;
30bba69d7db40e7 Qing Zhang 2021-06-18   88  =

30bba69d7db40e7 Qing Zhang 2021-06-18   89  	/* Enable pci device */
30bba69d7db40e7 Qing Zhang 2021-06-18   90  	ret =3D pci_enable_device(pdev=
);
30bba69d7db40e7 Qing Zhang 2021-06-18   91  	if (ret) {
30bba69d7db40e7 Qing Zhang 2021-06-18   92  		dev_err(&pdev->dev, "%s: ERRO=
R: failed to enable device\n", __func__);
30bba69d7db40e7 Qing Zhang 2021-06-18   93  		return ret;
30bba69d7db40e7 Qing Zhang 2021-06-18   94  	}
30bba69d7db40e7 Qing Zhang 2021-06-18   95  =

30bba69d7db40e7 Qing Zhang 2021-06-18   96  	/* Get the base address of dev=
ice */
30bba69d7db40e7 Qing Zhang 2021-06-18   97  	for (i =3D 0; i < PCI_STD_NUM_=
BARS; i++) {
30bba69d7db40e7 Qing Zhang 2021-06-18   98  		if (pci_resource_len(pdev, i)=
 =3D=3D 0)
30bba69d7db40e7 Qing Zhang 2021-06-18   99  			continue;
30bba69d7db40e7 Qing Zhang 2021-06-18  100  		ret =3D pcim_iomap_regions(pd=
ev, BIT(0), pci_name(pdev));
30bba69d7db40e7 Qing Zhang 2021-06-18  101  		if (ret)
30bba69d7db40e7 Qing Zhang 2021-06-18  102  			return ret;
30bba69d7db40e7 Qing Zhang 2021-06-18  103  		break;
30bba69d7db40e7 Qing Zhang 2021-06-18  104  	}
30bba69d7db40e7 Qing Zhang 2021-06-18  105  =

30bba69d7db40e7 Qing Zhang 2021-06-18  106  	plat->bus_id =3D of_alias_get_=
id(np, "ethernet");
30bba69d7db40e7 Qing Zhang 2021-06-18  107  	if (plat->bus_id < 0)
30bba69d7db40e7 Qing Zhang 2021-06-18  108  		plat->bus_id =3D pci_dev_id(p=
dev);
30bba69d7db40e7 Qing Zhang 2021-06-18  109  =

30bba69d7db40e7 Qing Zhang 2021-06-18  110  	plat->phy_interface =3D device=
_get_phy_mode(&pdev->dev);
30bba69d7db40e7 Qing Zhang 2021-06-18  111  	if (plat->phy_interface < 0)
30bba69d7db40e7 Qing Zhang 2021-06-18  112  		dev_err(&pdev->dev, "phy_mode=
 not found\n");
30bba69d7db40e7 Qing Zhang 2021-06-18  113  =

30bba69d7db40e7 Qing Zhang 2021-06-18  114  	plat->interface =3D PHY_INTERF=
ACE_MODE_GMII;
30bba69d7db40e7 Qing Zhang 2021-06-18  115  =

30bba69d7db40e7 Qing Zhang 2021-06-18  116  	pci_set_master(pdev);
30bba69d7db40e7 Qing Zhang 2021-06-18  117  =

30bba69d7db40e7 Qing Zhang 2021-06-18  118  	loongson_default_data(plat);
30bba69d7db40e7 Qing Zhang 2021-06-18  119  	pci_enable_msi(pdev);
30bba69d7db40e7 Qing Zhang 2021-06-18  120  	memset(&res, 0, sizeof(res));
30bba69d7db40e7 Qing Zhang 2021-06-18  121  	res.addr =3D pcim_iomap_table(=
pdev)[0];
30bba69d7db40e7 Qing Zhang 2021-06-18  122  =

30bba69d7db40e7 Qing Zhang 2021-06-18  123  	res.irq =3D of_irq_get_byname(=
np, "macirq");
30bba69d7db40e7 Qing Zhang 2021-06-18  124  	if (res.irq < 0) {
30bba69d7db40e7 Qing Zhang 2021-06-18  125  		dev_err(&pdev->dev, "IRQ maci=
rq not found\n");
30bba69d7db40e7 Qing Zhang 2021-06-18 @126  		ret =3D -ENODEV;
30bba69d7db40e7 Qing Zhang 2021-06-18  127  	}
30bba69d7db40e7 Qing Zhang 2021-06-18  128  =

30bba69d7db40e7 Qing Zhang 2021-06-18  129  	res.wol_irq =3D of_irq_get_byn=
ame(np, "eth_wake_irq");
30bba69d7db40e7 Qing Zhang 2021-06-18  130  	if (res.wol_irq < 0) {
30bba69d7db40e7 Qing Zhang 2021-06-18  131  		dev_info(&pdev->dev, "IRQ eth=
_wake_irq not found, using macirq\n");
30bba69d7db40e7 Qing Zhang 2021-06-18  132  		res.wol_irq =3D res.irq;
30bba69d7db40e7 Qing Zhang 2021-06-18  133  	}
30bba69d7db40e7 Qing Zhang 2021-06-18  134  =

30bba69d7db40e7 Qing Zhang 2021-06-18  135  	res.lpi_irq =3D of_irq_get_byn=
ame(np, "eth_lpi");
30bba69d7db40e7 Qing Zhang 2021-06-18  136  	if (res.lpi_irq < 0) {
30bba69d7db40e7 Qing Zhang 2021-06-18  137  		dev_err(&pdev->dev, "IRQ eth_=
lpi not found\n");
30bba69d7db40e7 Qing Zhang 2021-06-18  138  		ret =3D -ENODEV;
30bba69d7db40e7 Qing Zhang 2021-06-18  139  	}
30bba69d7db40e7 Qing Zhang 2021-06-18  140  =

30bba69d7db40e7 Qing Zhang 2021-06-18  141  	return stmmac_dvr_probe(&pdev-=
>dev, plat, &res);
30bba69d7db40e7 Qing Zhang 2021-06-18  142  }
30bba69d7db40e7 Qing Zhang 2021-06-18  143  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4099226460572088712==--

