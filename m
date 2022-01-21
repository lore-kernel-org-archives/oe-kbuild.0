Content-Type: multipart/mixed; boundary="===============3067056116947427822=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/qcom/pinctrl-sc8180x.c:1664:16: warning: Access to field 'start' results in a dereference of an undefined pointer value (loaded from variable 'mres') [clang-analyzer-core.NullDereference]
Date: Fri, 21 Jan 2022 13:25:02 +0800
Message-ID: <202201211317.RYE7ffKa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3067056116947427822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shawn Guo <shawn.guo@linaro.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2c271fe77d52a0555161926c232cd5bc07178b39
commit: 6d8d67988b1a2db04d9d6083a729e8abfeb725d7 pinctrl: qcom: sc8180x: ad=
d ACPI probe support
date:   10 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220117 (https://download.01.org/0day-ci/archi=
ve/20220121/202201211317.RYE7ffKa-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb=
243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6d8d67988b1a2db04d9d6083a729e8abfeb725d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6d8d67988b1a2db04d9d6083a729e8abfeb725d7
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/setup-bus.c:459:2: note: Loop condition is false.  Exiting l=
oop
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/setup-bus.c:459:2: note: Loop condition is true.  Entering l=
oop body
           list_for_each_entry(dev_res, head, list)
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/pci/setup-bus.c:460:7: note: Use of memory after it is freed
                   if (dev_res->res->parent)
                       ^~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: warning: Value stored=
 to 'npcm' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1562:26: note: Value stored to=
 'npcm' during its initialization is never read
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1590:26: warning: Value stored=
 to 'npcm' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c:1590:26: note: Value stored to=
 'npcm' during its initialization is never read
           struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev=
);
                                   ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/pinctrl/qcom/pinctrl-sc8180x.c:1664:16: warning: Access to field=
 'start' results in a dereference of an undefined pointer value (loaded fro=
m variable 'mres') [clang-analyzer-core.NullDereference]
                   res->start =3D mres->start + info->offset;
                                ^
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1692:6: note: Assuming 'soc_data'=
 is non-null
           if (!soc_data)
               ^~~~~~~~~
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1692:2: note: Taking false branch
           if (!soc_data)
           ^
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1695:8: note: Calling 'sc8180x_pi=
nctrl_add_tile_resources'
           ret =3D sc8180x_pinctrl_add_tile_resources(pdev);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1633:19: note: 'mres' declared wi=
thout an initial value
           struct resource *mres, *nres, *res;
                            ^~~~
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1640:6: note: Assuming field 'of_=
node' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1640:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1645:6: note: Assuming 'nres' is =
non-null
           if (!nres)
               ^~~~~
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1645:2: note: Taking false branch
           if (!nres)
           ^
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1650:14: note: Assuming 'i' is >=
=3D field 'num_resources'
           for (i =3D 0; i < pdev->num_resources; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1650:2: note: Loop condition is f=
alse. Execution continues on line 1661
           for (i =3D 0; i < pdev->num_resources; i++) {
           ^
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1661:2: note: Loop condition is t=
rue.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(sc8180x_tiles); i++, res++) {
           ^
   drivers/pinctrl/qcom/pinctrl-sc8180x.c:1664:16: note: Access to field 's=
tart' results in a dereference of an undefined pointer value (loaded from v=
ariable 'mres')
                   res->start =3D mres->start + info->offset;
                                ^~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/md/bcache/btree.c:1921:2: warning: Value stored to 'cur_idx' is =
never read [clang-analyzer-deadcode.DeadStores]
           cur_idx =3D prev_idx =3D 0;
           ^         ~~~~~~~~~~~~
   drivers/md/bcache/btree.c:1921:2: note: Value stored to 'cur_idx' is nev=
er read
           cur_idx =3D prev_idx =3D 0;
           ^         ~~~~~~~~~~~~
   drivers/md/bcache/btree.c:2278:28: warning: The result of the left shift=
 is undefined because the left operand is negative [clang-analyzer-core.Und=
efinedBinaryOperatorResult]
                   bkey_copy_key(&n3->key, &MAX_KEY);
                                            ^
   include/uapi/linux/bcache.h:81:24: note: expanded from macro 'MAX_KEY'
   #define MAX_KEY                         KEY(MAX_KEY_INODE, MAX_KEY_OFFSE=
T, 0)
                                               ^~~~~~~~~~~~~
   include/uapi/linux/bcache.h:79:31: note: expanded from macro 'MAX_KEY_IN=
ODE'
   #define MAX_KEY_INODE                   (~(~0 << 20))
                                              ~~ ^
   include/uapi/linux/bcache.h:73:51: note: expanded from macro 'KEY'
           .high =3D (1ULL << 63) | ((__u64) (size) << 20) | (inode),      =
  \
                                                            ^~~~~
   drivers/md/bcache/btree.c:2204:6: note: Calling 'btree_check_reserve'
           if (btree_check_reserve(b, op)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/btree.c:1178:6: note: Assuming the condition is false
           if (fifo_used(&ca->free[RESERVE_BTREE]) < reserve) {
               ^
   drivers/md/bcache/util.h:162:26: note: expanded from macro 'fifo_used'
   #define fifo_used(fifo)         (((fifo)->back - (fifo)->front) & (fifo)=
->mask)
                                   ^
   drivers/md/bcache/btree.c:1178:2: note: Taking false branch
           if (fifo_used(&ca->free[RESERVE_BTREE]) < reserve) {
           ^
   drivers/md/bcache/btree.c:1188:9: note: Calling 'mca_cannibalize_lock'
           return mca_cannibalize_lock(b->c, op);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/btree.c:846:13: note: Assuming field 'btree_cache_allo=
c_lock' is not equal to null
           if (likely(c->btree_cache_alloc_lock =3D=3D NULL)) {
                      ^
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   drivers/md/bcache/btree.c:846:2: note: Taking false branch
           if (likely(c->btree_cache_alloc_lock =3D=3D NULL)) {
           ^
   drivers/md/bcache/btree.c:848:13: note: Assuming field 'btree_cache_allo=
c_lock' is equal to field 'task'
           } else if (c->btree_cache_alloc_lock !=3D current) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/btree.c:848:9: note: Taking false branch
           } else if (c->btree_cache_alloc_lock !=3D current) {

vim +1664 drivers/pinctrl/qcom/pinctrl-sc8180x.c

6d8d67988b1a2db Shawn Guo 2021-03-11  1623  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1624  /*
6d8d67988b1a2db Shawn Guo 2021-03-11  1625   * ACPI DSDT has one single mem=
ory resource for TLMM, which voilates the
6d8d67988b1a2db Shawn Guo 2021-03-11  1626   * hardware layout of 3 sepeart=
e tiles.  Let's split the memory resource into
6d8d67988b1a2db Shawn Guo 2021-03-11  1627   * 3 named ones, so that msm_pi=
nctrl_probe() can map memory for ACPI in the
6d8d67988b1a2db Shawn Guo 2021-03-11  1628   * same way as for DT probe.
6d8d67988b1a2db Shawn Guo 2021-03-11  1629   */
6d8d67988b1a2db Shawn Guo 2021-03-11  1630  static int sc8180x_pinctrl_add_=
tile_resources(struct platform_device *pdev)
6d8d67988b1a2db Shawn Guo 2021-03-11  1631  {
6d8d67988b1a2db Shawn Guo 2021-03-11  1632  	int nres_num =3D pdev->num_res=
ources + ARRAY_SIZE(sc8180x_tiles) - 1;
6d8d67988b1a2db Shawn Guo 2021-03-11  1633  	struct resource *mres, *nres, =
*res;
6d8d67988b1a2db Shawn Guo 2021-03-11  1634  	int i, ret;
6d8d67988b1a2db Shawn Guo 2021-03-11  1635  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1636  	/*
6d8d67988b1a2db Shawn Guo 2021-03-11  1637  	 * DT already has tiles define=
d properly, so nothing needs to be done
6d8d67988b1a2db Shawn Guo 2021-03-11  1638  	 * for DT probe.
6d8d67988b1a2db Shawn Guo 2021-03-11  1639  	 */
6d8d67988b1a2db Shawn Guo 2021-03-11  1640  	if (pdev->dev.of_node)
6d8d67988b1a2db Shawn Guo 2021-03-11  1641  		return 0;
6d8d67988b1a2db Shawn Guo 2021-03-11  1642  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1643  	/* Allocate for new resources =
*/
6d8d67988b1a2db Shawn Guo 2021-03-11  1644  	nres =3D devm_kzalloc(&pdev->d=
ev, sizeof(*nres) * nres_num, GFP_KERNEL);
6d8d67988b1a2db Shawn Guo 2021-03-11  1645  	if (!nres)
6d8d67988b1a2db Shawn Guo 2021-03-11  1646  		return -ENOMEM;
6d8d67988b1a2db Shawn Guo 2021-03-11  1647  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1648  	res =3D nres;
6d8d67988b1a2db Shawn Guo 2021-03-11  1649  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1650  	for (i =3D 0; i < pdev->num_re=
sources; i++) {
6d8d67988b1a2db Shawn Guo 2021-03-11  1651  		struct resource *r =3D &pdev-=
>resource[i];
6d8d67988b1a2db Shawn Guo 2021-03-11  1652  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1653  		/* Save memory resource and c=
opy others */
6d8d67988b1a2db Shawn Guo 2021-03-11  1654  		if (resource_type(r) =3D=3D I=
ORESOURCE_MEM)
6d8d67988b1a2db Shawn Guo 2021-03-11  1655  			mres =3D r;
6d8d67988b1a2db Shawn Guo 2021-03-11  1656  		else
6d8d67988b1a2db Shawn Guo 2021-03-11  1657  			*res++ =3D *r;
6d8d67988b1a2db Shawn Guo 2021-03-11  1658  	}
6d8d67988b1a2db Shawn Guo 2021-03-11  1659  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1660  	/* Append tile memory resource=
s */
6d8d67988b1a2db Shawn Guo 2021-03-11  1661  	for (i =3D 0; i < ARRAY_SIZE(s=
c8180x_tiles); i++, res++) {
6d8d67988b1a2db Shawn Guo 2021-03-11  1662  		const struct tile_info *info =
=3D &sc8180x_tile_info[i];
6d8d67988b1a2db Shawn Guo 2021-03-11  1663  =

6d8d67988b1a2db Shawn Guo 2021-03-11 @1664  		res->start =3D mres->start + =
info->offset;
6d8d67988b1a2db Shawn Guo 2021-03-11  1665  		res->end =3D mres->start + in=
fo->offset + info->size - 1;
6d8d67988b1a2db Shawn Guo 2021-03-11  1666  		res->flags =3D mres->flags;
6d8d67988b1a2db Shawn Guo 2021-03-11  1667  		res->name =3D sc8180x_tiles[i=
];
6d8d67988b1a2db Shawn Guo 2021-03-11  1668  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1669  		/* Add new MEM to resource tr=
ee */
6d8d67988b1a2db Shawn Guo 2021-03-11  1670  		insert_resource(mres->parent,=
 res);
6d8d67988b1a2db Shawn Guo 2021-03-11  1671  	}
6d8d67988b1a2db Shawn Guo 2021-03-11  1672  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1673  	/* Remove old MEM from resourc=
e tree */
6d8d67988b1a2db Shawn Guo 2021-03-11  1674  	remove_resource(mres);
6d8d67988b1a2db Shawn Guo 2021-03-11  1675  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1676  	/* Free old resources and inst=
all new ones */
6d8d67988b1a2db Shawn Guo 2021-03-11  1677  	ret =3D platform_device_add_re=
sources(pdev, nres, nres_num);
6d8d67988b1a2db Shawn Guo 2021-03-11  1678  	if (ret) {
6d8d67988b1a2db Shawn Guo 2021-03-11  1679  		dev_err(&pdev->dev, "failed t=
o add new resources: %d\n", ret);
6d8d67988b1a2db Shawn Guo 2021-03-11  1680  		return ret;
6d8d67988b1a2db Shawn Guo 2021-03-11  1681  	}
6d8d67988b1a2db Shawn Guo 2021-03-11  1682  =

6d8d67988b1a2db Shawn Guo 2021-03-11  1683  	return 0;
6d8d67988b1a2db Shawn Guo 2021-03-11  1684  }
6d8d67988b1a2db Shawn Guo 2021-03-11  1685  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3067056116947427822==--

