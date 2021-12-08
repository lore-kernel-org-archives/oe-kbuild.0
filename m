Content-Type: multipart/mixed; boundary="===============3113168369410889754=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:126:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 09 Dec 2021 00:45:10 +0800
Message-ID: <202112090024.VQMLfzUB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3113168369410889754==
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
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 30bba69d7db40e732d6c0aa6d4890c60d717e314 stmmac: pci: Add dwmac sup=
port for Loongson
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-c001-20211130 (https://download.01.org/0day-ci/arch=
ive/20211209/202112090024.VQMLfzUB-lkp(a)intel.com/config)
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/misc/altera-stapl/altera.c:463:24: warning: Array access (from v=
ariable 'proc_attributes') results in a null pointer dereference [clang-ana=
lyzer-core.NullDereference]
                                   proc_attributes[i] =3D
                                   ~~~~~~~~~~~~~~~    ^
   drivers/misc/altera-stapl/altera.c:229:2: note: 'proc_attributes' initia=
lized to a null pointer value
           u8 *proc_attributes =3D NULL;
           ^~~~~~~~~~~~~~~~~~~
   drivers/misc/altera-stapl/altera.c:263:2: note: Assuming 'debug' is 0
           dprintk("%s\n", __func__);
           ^
   drivers/misc/altera-stapl/altera.c:31:6: note: expanded from macro 'dpri=
ntk'
           if (debug) { \
               ^~~~~
   drivers/misc/altera-stapl/altera.c:263:2: note: Taking false branch
           dprintk("%s\n", __func__);
           ^
   drivers/misc/altera-stapl/altera.c:31:2: note: expanded from macro 'dpri=
ntk'
           if (debug) { \
           ^
   drivers/misc/altera-stapl/altera.c:266:6: note: Assuming 'program_size' =
is > 52
           if (program_size > 52L) {
               ^~~~~~~~~~~~~~~~~~
   drivers/misc/altera-stapl/altera.c:266:2: note: Taking true branch
           if (program_size > 52L) {
           ^
   drivers/misc/altera-stapl/altera.c:284:7: note: Assuming 'first_word' is=
 not equal to 1245793536
           if ((first_word !=3D 0x4A414D00L) && (first_word !=3D 0x4A414D01=
L)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/altera-stapl/altera.c:284:6: note: Left side of '&&' is true
           if ((first_word !=3D 0x4A414D00L) && (first_word !=3D 0x4A414D01=
L)) {
               ^
   drivers/misc/altera-stapl/altera.c:284:38: note: Assuming 'first_word' i=
s equal to 1245793537
           if ((first_word !=3D 0x4A414D00L) && (first_word !=3D 0x4A414D01=
L)) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/altera-stapl/altera.c:284:2: note: Taking false branch
           if ((first_word !=3D 0x4A414D00L) && (first_word !=3D 0x4A414D01=
L)) {
           ^
   drivers/misc/altera-stapl/altera.c:290:6: note: Assuming 'sym_count' is =
<=3D 0
           if (sym_count <=3D 0)
               ^~~~~~~~~~~~~~
   drivers/misc/altera-stapl/altera.c:290:2: note: Taking true branch
           if (sym_count <=3D 0)
           ^
   drivers/misc/altera-stapl/altera.c:291:3: note: Control jumps to line 419
                   goto exit_done;
                   ^
   drivers/misc/altera-stapl/altera.c:419:6: note: 'status' is equal to 0
           if (status !=3D 0)
               ^~~~~~
   drivers/misc/altera-stapl/altera.c:419:2: note: Taking false branch
           if (status !=3D 0)
           ^
   drivers/misc/altera-stapl/altera.c:431:6: note: 'version' is > 0
           if (version > 0) {
               ^~~~~~~
   drivers/misc/altera-stapl/altera.c:431:2: note: Taking true branch
           if (version > 0) {
           ^
   drivers/misc/altera-stapl/altera.c:432:7: note: Assuming field 'action' =
is not equal to NULL
                   if (aconf->action =3D=3D NULL) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/altera-stapl/altera.c:432:3: note: Taking false branch
                   if (aconf->action =3D=3D NULL) {
                   ^
   drivers/misc/altera-stapl/altera.c:437:17: note: Assuming 'i' is < 'acti=
on_count'
                           for (i =3D 0; (i < action_count) && !action_foun=
d; ++i) {
                                        ^~~~~~~~~~~~~~~~
   drivers/misc/altera-stapl/altera.c:437:16: note: Left side of '&&' is tr=
ue
                           for (i =3D 0; (i < action_count) && !action_foun=
d; ++i) {
                                       ^
   drivers/misc/altera-stapl/altera.c:437:4: note: Loop condition is true. =
 Entering loop body
                           for (i =3D 0; (i < action_count) && !action_foun=
d; ++i) {
                           ^
   drivers/misc/altera-stapl/altera.c:443:5: note: Taking true branch
                                   if (strncasecmp(aconf->action, name, str=
len(name)) =3D=3D 0) {
                                   ^
   drivers/misc/altera-stapl/altera.c:437:17: note: Assuming 'i' is >=3D 'a=
ction_count'
                           for (i =3D 0; (i < action_count) && !action_foun=
d; ++i) {

vim +/ret +126 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

30bba69d7db40e Qing Zhang 2021-06-18   47  =

30bba69d7db40e Qing Zhang 2021-06-18   48  static int loongson_dwmac_probe(=
struct pci_dev *pdev, const struct pci_device_id *id)
30bba69d7db40e Qing Zhang 2021-06-18   49  {
30bba69d7db40e Qing Zhang 2021-06-18   50  	struct plat_stmmacenet_data *pl=
at;
30bba69d7db40e Qing Zhang 2021-06-18   51  	struct stmmac_resources res;
30bba69d7db40e Qing Zhang 2021-06-18   52  	int ret, i, mdio;
30bba69d7db40e Qing Zhang 2021-06-18   53  	struct device_node *np;
30bba69d7db40e Qing Zhang 2021-06-18   54  =

30bba69d7db40e Qing Zhang 2021-06-18   55  	np =3D dev_of_node(&pdev->dev);
30bba69d7db40e Qing Zhang 2021-06-18   56  =

30bba69d7db40e Qing Zhang 2021-06-18   57  	if (!np) {
30bba69d7db40e Qing Zhang 2021-06-18   58  		pr_info("dwmac_loongson_pci: N=
o OF node\n");
30bba69d7db40e Qing Zhang 2021-06-18   59  		return -ENODEV;
30bba69d7db40e Qing Zhang 2021-06-18   60  	}
30bba69d7db40e Qing Zhang 2021-06-18   61  =

30bba69d7db40e Qing Zhang 2021-06-18   62  	if (!of_device_is_compatible(np=
, "loongson, pci-gmac")) {
30bba69d7db40e Qing Zhang 2021-06-18   63  		pr_info("dwmac_loongson_pci: I=
ncompatible OF node\n");
30bba69d7db40e Qing Zhang 2021-06-18   64  		return -ENODEV;
30bba69d7db40e Qing Zhang 2021-06-18   65  	}
30bba69d7db40e Qing Zhang 2021-06-18   66  =

30bba69d7db40e Qing Zhang 2021-06-18   67  	plat =3D devm_kzalloc(&pdev->de=
v, sizeof(*plat), GFP_KERNEL);
30bba69d7db40e Qing Zhang 2021-06-18   68  	if (!plat)
30bba69d7db40e Qing Zhang 2021-06-18   69  		return -ENOMEM;
30bba69d7db40e Qing Zhang 2021-06-18   70  =

30bba69d7db40e Qing Zhang 2021-06-18   71  	if (plat->mdio_node) {
30bba69d7db40e Qing Zhang 2021-06-18   72  		dev_err(&pdev->dev, "Found MDI=
O subnode\n");
30bba69d7db40e Qing Zhang 2021-06-18   73  		mdio =3D true;
30bba69d7db40e Qing Zhang 2021-06-18   74  	}
30bba69d7db40e Qing Zhang 2021-06-18   75  =

30bba69d7db40e Qing Zhang 2021-06-18   76  	if (mdio) {
30bba69d7db40e Qing Zhang 2021-06-18   77  		plat->mdio_bus_data =3D devm_k=
zalloc(&pdev->dev,
30bba69d7db40e Qing Zhang 2021-06-18   78  						   sizeof(*plat->mdio_bus_=
data),
30bba69d7db40e Qing Zhang 2021-06-18   79  						   GFP_KERNEL);
30bba69d7db40e Qing Zhang 2021-06-18   80  		if (!plat->mdio_bus_data)
30bba69d7db40e Qing Zhang 2021-06-18   81  			return -ENOMEM;
30bba69d7db40e Qing Zhang 2021-06-18   82  		plat->mdio_bus_data->needs_res=
et =3D true;
30bba69d7db40e Qing Zhang 2021-06-18   83  	}
30bba69d7db40e Qing Zhang 2021-06-18   84  =

30bba69d7db40e Qing Zhang 2021-06-18   85  	plat->dma_cfg =3D devm_kzalloc(=
&pdev->dev, sizeof(*plat->dma_cfg), GFP_KERNEL);
30bba69d7db40e Qing Zhang 2021-06-18   86  	if (!plat->dma_cfg)
30bba69d7db40e Qing Zhang 2021-06-18   87  		return -ENOMEM;
30bba69d7db40e Qing Zhang 2021-06-18   88  =

30bba69d7db40e Qing Zhang 2021-06-18   89  	/* Enable pci device */
30bba69d7db40e Qing Zhang 2021-06-18   90  	ret =3D pci_enable_device(pdev);
30bba69d7db40e Qing Zhang 2021-06-18   91  	if (ret) {
30bba69d7db40e Qing Zhang 2021-06-18   92  		dev_err(&pdev->dev, "%s: ERROR=
: failed to enable device\n", __func__);
30bba69d7db40e Qing Zhang 2021-06-18   93  		return ret;
30bba69d7db40e Qing Zhang 2021-06-18   94  	}
30bba69d7db40e Qing Zhang 2021-06-18   95  =

30bba69d7db40e Qing Zhang 2021-06-18   96  	/* Get the base address of devi=
ce */
30bba69d7db40e Qing Zhang 2021-06-18   97  	for (i =3D 0; i < PCI_STD_NUM_B=
ARS; i++) {
30bba69d7db40e Qing Zhang 2021-06-18   98  		if (pci_resource_len(pdev, i) =
=3D=3D 0)
30bba69d7db40e Qing Zhang 2021-06-18   99  			continue;
30bba69d7db40e Qing Zhang 2021-06-18  100  		ret =3D pcim_iomap_regions(pde=
v, BIT(0), pci_name(pdev));
30bba69d7db40e Qing Zhang 2021-06-18  101  		if (ret)
30bba69d7db40e Qing Zhang 2021-06-18  102  			return ret;
30bba69d7db40e Qing Zhang 2021-06-18  103  		break;
30bba69d7db40e Qing Zhang 2021-06-18  104  	}
30bba69d7db40e Qing Zhang 2021-06-18  105  =

30bba69d7db40e Qing Zhang 2021-06-18  106  	plat->bus_id =3D of_alias_get_i=
d(np, "ethernet");
30bba69d7db40e Qing Zhang 2021-06-18  107  	if (plat->bus_id < 0)
30bba69d7db40e Qing Zhang 2021-06-18  108  		plat->bus_id =3D pci_dev_id(pd=
ev);
30bba69d7db40e Qing Zhang 2021-06-18  109  =

30bba69d7db40e Qing Zhang 2021-06-18  110  	plat->phy_interface =3D device_=
get_phy_mode(&pdev->dev);
30bba69d7db40e Qing Zhang 2021-06-18  111  	if (plat->phy_interface < 0)
30bba69d7db40e Qing Zhang 2021-06-18  112  		dev_err(&pdev->dev, "phy_mode =
not found\n");
30bba69d7db40e Qing Zhang 2021-06-18  113  =

30bba69d7db40e Qing Zhang 2021-06-18  114  	plat->interface =3D PHY_INTERFA=
CE_MODE_GMII;
30bba69d7db40e Qing Zhang 2021-06-18  115  =

30bba69d7db40e Qing Zhang 2021-06-18  116  	pci_set_master(pdev);
30bba69d7db40e Qing Zhang 2021-06-18  117  =

30bba69d7db40e Qing Zhang 2021-06-18  118  	loongson_default_data(plat);
30bba69d7db40e Qing Zhang 2021-06-18  119  	pci_enable_msi(pdev);
30bba69d7db40e Qing Zhang 2021-06-18  120  	memset(&res, 0, sizeof(res));
30bba69d7db40e Qing Zhang 2021-06-18  121  	res.addr =3D pcim_iomap_table(p=
dev)[0];
30bba69d7db40e Qing Zhang 2021-06-18  122  =

30bba69d7db40e Qing Zhang 2021-06-18  123  	res.irq =3D of_irq_get_byname(n=
p, "macirq");
30bba69d7db40e Qing Zhang 2021-06-18  124  	if (res.irq < 0) {
30bba69d7db40e Qing Zhang 2021-06-18  125  		dev_err(&pdev->dev, "IRQ macir=
q not found\n");
30bba69d7db40e Qing Zhang 2021-06-18 @126  		ret =3D -ENODEV;
30bba69d7db40e Qing Zhang 2021-06-18  127  	}
30bba69d7db40e Qing Zhang 2021-06-18  128  =

30bba69d7db40e Qing Zhang 2021-06-18  129  	res.wol_irq =3D of_irq_get_byna=
me(np, "eth_wake_irq");
30bba69d7db40e Qing Zhang 2021-06-18  130  	if (res.wol_irq < 0) {
30bba69d7db40e Qing Zhang 2021-06-18  131  		dev_info(&pdev->dev, "IRQ eth_=
wake_irq not found, using macirq\n");
30bba69d7db40e Qing Zhang 2021-06-18  132  		res.wol_irq =3D res.irq;
30bba69d7db40e Qing Zhang 2021-06-18  133  	}
30bba69d7db40e Qing Zhang 2021-06-18  134  =

30bba69d7db40e Qing Zhang 2021-06-18  135  	res.lpi_irq =3D of_irq_get_byna=
me(np, "eth_lpi");
30bba69d7db40e Qing Zhang 2021-06-18  136  	if (res.lpi_irq < 0) {
30bba69d7db40e Qing Zhang 2021-06-18  137  		dev_err(&pdev->dev, "IRQ eth_l=
pi not found\n");
30bba69d7db40e Qing Zhang 2021-06-18  138  		ret =3D -ENODEV;
30bba69d7db40e Qing Zhang 2021-06-18  139  	}
30bba69d7db40e Qing Zhang 2021-06-18  140  =

30bba69d7db40e Qing Zhang 2021-06-18  141  	return stmmac_dvr_probe(&pdev->=
dev, plat, &res);
30bba69d7db40e Qing Zhang 2021-06-18  142  }
30bba69d7db40e Qing Zhang 2021-06-18  143  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3113168369410889754==--

