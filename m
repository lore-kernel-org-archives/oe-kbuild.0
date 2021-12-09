Content-Type: multipart/mixed; boundary="===============0511547077459084746=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_lag.c:65:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 10 Dec 2021 03:21:58 +0800
Message-ID: <202112100356.Y1YZRa4d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0511547077459084746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Ertman <david.m.ertman@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: df006dd4b1dca8c486f73ae76fb77c06afae83f2 ice: Add initial support f=
ramework for LAG
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20211126 (https://download.01.org/0day-ci/archi=
ve/20211210/202112100356.Y1YZRa4d-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddf006dd4b1dca8c486f73ae76fb77c06afae83f2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout df006dd4b1dca8c486f73ae76fb77c06afae83f2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/radeon/rv770_smc.c:379:3: warning: Value stored to 'smc_=
first_vector' is never read [clang-analyzer-deadcode.DeadStores]
                   smc_first_vector =3D FIRST_SMC_INT_VECT_REG;
                   ^
   drivers/gpu/drm/radeon/rv770_smc.c:379:3: note: Value stored to 'smc_fir=
st_vector' is never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/radeon/btc_dpm.c:2308:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D btc_disable_ulv(rdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/btc_dpm.c:2308:2: note: Value stored to 'ret' is =
never read
           ret =3D btc_disable_ulv(rdev);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/radeon/sumo_dpm.c:423:18: warning: The right operand of =
'*' is a garbage value due to array index out of bounds [clang-analyzer-cor=
e.UndefinedBinaryOperatorResult]
                   a_t =3D CG_R(m_a * r[ps->num_levels - 1] / 100) |
                                  ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1302:6: note: Assuming field 'enable_d=
pm' is true
           if (pi->enable_dpm)
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:1302:2: note: Taking true branch
           if (pi->enable_dpm)
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1304:6: note: Assuming field 'enable_b=
oost' is false
           if (pi->enable_boost) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:1304:2: note: Taking false branch
           if (pi->enable_boost) {
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1308:10: note: Field 'enable_dpm' is t=
rue
           if (pi->enable_dpm) {
                   ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1308:2: note: Taking true branch
           if (pi->enable_dpm) {
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1317:3: note: Calling 'sumo_program_at'
                   sumo_program_at(rdev, new_ps);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:408:14: note: Assuming 'i' is >=3D fie=
ld 'num_levels'
           for (i =3D 0; i < ps->num_levels; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:408:2: note: Loop condition is false. =
Execution continues on line 418
           for (i =3D 0; i < ps->num_levels; i++) {
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:418:6: note: Assuming the condition is=
 true
           if (ps->flags & SUMO_POWERSTATE_FLAGS_BOOST_STATE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:418:2: note: Taking true branch
           if (ps->flags & SUMO_POWERSTATE_FLAGS_BOOST_STATE) {
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:423:18: note: The right operand of '*'=
 is a garbage value due to array index out of bounds
                   a_t =3D CG_R(m_a * r[ps->num_levels - 1] / 100) |
                                  ^
   drivers/gpu/drm/radeon/sumod.h:278:59: note: expanded from macro 'CG_R'
   #       define CG_R(x)                                  ((x) << 0)
                                                             ^
   drivers/gpu/drm/radeon/sumo_dpm.c:743:18: warning: The result of the lef=
t shift is undefined due to shifting by '4294967295', which is greater or e=
qual to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperato=
rResult]
           dpm_ctrl4 |=3D (1 << (new_ps->num_levels - 1));
                           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1302:6: note: Assuming field 'enable_d=
pm' is true
           if (pi->enable_dpm)
               ^~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:1302:2: note: Taking true branch
           if (pi->enable_dpm)
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1304:6: note: Assuming field 'enable_b=
oost' is false
           if (pi->enable_boost) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:1304:2: note: Taking false branch
           if (pi->enable_boost) {
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1308:10: note: Field 'enable_dpm' is t=
rue
           if (pi->enable_dpm) {
                   ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1308:2: note: Taking true branch
           if (pi->enable_dpm) {
           ^
   drivers/gpu/drm/radeon/sumo_dpm.c:1315:3: note: Calling 'sumo_program_wl'
                   sumo_program_wl(rdev, new_ps);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/sumo_dpm.c:743:18: note: The result of the left s=
hift is undefined due to shifting by '4294967295', which is greater or equa=
l to the width of type 'int'
           dpm_ctrl4 |=3D (1 << (new_ps->num_levels - 1));
                           ^  ~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/net/ethernet/intel/ice/ice_fw_update.c:366:17: warning: Value st=
ored to 'dev' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_fw_update.c:366:17: note: Value store=
d to 'dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/net/ethernet/intel/ice/ice_lag.c:65:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D &lag->pf->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:65:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D &lag->pf->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:67:2: warning: Value stored to =
'name' is never read [clang-analyzer-deadcode.DeadStores]
           name =3D lag->netdev ? netdev_name(lag->netdev) : "unset";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:67:2: note: Value stored to 'na=
me' is never read
           name =3D lag->netdev ? netdev_name(lag->netdev) : "unset";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:68:2: warning: Value stored to =
'peer' is never read [clang-analyzer-deadcode.DeadStores]
           peer =3D lag->peer_netdev ? netdev_name(lag->peer_netdev) : "uns=
et";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:68:2: note: Value stored to 'pe=
er' is never read
           peer =3D lag->peer_netdev ? netdev_name(lag->peer_netdev) : "uns=
et";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:69:2: warning: Value stored to =
'upper' is never read [clang-analyzer-deadcode.DeadStores]
           upper =3D lag->upper_netdev ? netdev_name(lag->upper_netdev) : "=
unset";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:69:2: note: Value stored to 'up=
per' is never read
           upper =3D lag->upper_netdev ? netdev_name(lag->upper_netdev) : "=
unset";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:70:2: warning: Value stored to =
'master' is never read [clang-analyzer-deadcode.DeadStores]
           master =3D lag->master ? "TRUE" : "FALSE";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:70:2: note: Value stored to 'ma=
ster' is never read
           master =3D lag->master ? "TRUE" : "FALSE";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:71:2: warning: Value stored to =
'bonded' is never read [clang-analyzer-deadcode.DeadStores]
           bonded =3D lag->bonded ? "BONDED" : "UNBONDED";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:71:2: note: Value stored to 'bo=
nded' is never read
           bonded =3D lag->bonded ? "BONDED" : "UNBONDED";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:75:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "NONE";
                   ^      ~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:75:3: note: Value stored to 'ro=
le' is never read
                   role =3D "NONE";
                   ^      ~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:78:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "PRIMARY";
                   ^      ~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:78:3: note: Value stored to 'ro=
le' is never read
                   role =3D "PRIMARY";
                   ^      ~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:81:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "BACKUP";
                   ^      ~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:81:3: note: Value stored to 'ro=
le' is never read
                   role =3D "BACKUP";
                   ^      ~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:84:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "UNSET";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:84:3: note: Value stored to 'ro=
le' is never read
                   role =3D "UNSET";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:87:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "ERROR";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:87:3: note: Value stored to 'ro=
le' is never read
                   role =3D "ERROR";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:356:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D ice_pf_to_dev(lag->pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_lag.c:356:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(lag->pf);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/nand/raw/ams-delta.c:199:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &nand_to_mtd(this)->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/ams-delta.c:199:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &nand_to_mtd(this)->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/mtd/nand/raw/diskonchip.c:371:20: warning: The left operand of '=
<<' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           ret =3D ((u16)id[0] << 8) | id[1];
                             ^
   drivers/mtd/nand/raw/diskonchip.c:1548:6: note: Assuming 'doc_config_loc=
ation' is not equal to 0
           if (doc_config_location) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1548:2: note: Taking true branch
           if (doc_config_location) {
           ^
   drivers/mtd/nand/raw/diskonchip.c:1551:9: note: Calling 'doc_probe'
                   ret =3D doc_probe(doc_config_location);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1311:6: note: Assuming the condition i=
s false
           if (!request_mem_region(physadr, DOC_IOREMAP_LEN, "DiskOnChip"))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1311:2: note: Taking false branch
           if (!request_mem_region(physadr, DOC_IOREMAP_LEN, "DiskOnChip"))
           ^
   drivers/mtd/nand/raw/diskonchip.c:1314:6: note: Assuming 'virtadr' is no=
n-null
           if (!virtadr) {
               ^~~~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1314:2: note: Taking false branch
           if (!virtadr) {
           ^
   drivers/mtd/nand/raw/diskonchip.c:1341:2: note: Control jumps to 'case 3=
2:' @line 1342
           switch (ChipID) {
           ^
   drivers/mtd/nand/raw/diskonchip.c:1344:3: note:  Execution continues on =
line 1388
                   break;
                   ^
   drivers/mtd/nand/raw/diskonchip.c:1391:7: note: Assuming 'tmp' is not eq=
ual to 'tmpb'
           if ((tmp =3D=3D tmpb) || (tmp !=3D tmpc)) {
                ^~~~~~~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1391:6: note: Left side of '||' is fal=
se
           if ((tmp =3D=3D tmpb) || (tmp !=3D tmpc)) {
               ^
   drivers/mtd/nand/raw/diskonchip.c:1391:24: note: Assuming 'tmp' is equal=
 to 'tmpc'
           if ((tmp =3D=3D tmpb) || (tmp !=3D tmpc)) {
                                 ^~~~~~~~~~~
   drivers/mtd/nand/raw/diskonchip.c:1391:2: note: Taking false branch
           if ((tmp =3D=3D tmpb) || (tmp !=3D tmpc)) {

vim +/dev +65 drivers/net/ethernet/intel/ice/ice_lag.c

df006dd4b1dca8c Dave Ertman 2020-11-20  57  =

df006dd4b1dca8c Dave Ertman 2020-11-20  58  /**
df006dd4b1dca8c Dave Ertman 2020-11-20  59   * ice_display_lag_info - print=
 LAG info
df006dd4b1dca8c Dave Ertman 2020-11-20  60   * @lag: LAG info struct
df006dd4b1dca8c Dave Ertman 2020-11-20  61   */
df006dd4b1dca8c Dave Ertman 2020-11-20  62  static void ice_display_lag_inf=
o(struct ice_lag *lag)
df006dd4b1dca8c Dave Ertman 2020-11-20  63  {
df006dd4b1dca8c Dave Ertman 2020-11-20  64  	const char *name, *peer, *uppe=
r, *role, *bonded, *master;
df006dd4b1dca8c Dave Ertman 2020-11-20 @65  	struct device *dev =3D &lag->p=
f->pdev->dev;
df006dd4b1dca8c Dave Ertman 2020-11-20  66  =

df006dd4b1dca8c Dave Ertman 2020-11-20 @67  	name =3D lag->netdev ? netdev_=
name(lag->netdev) : "unset";
df006dd4b1dca8c Dave Ertman 2020-11-20 @68  	peer =3D lag->peer_netdev ? ne=
tdev_name(lag->peer_netdev) : "unset";
df006dd4b1dca8c Dave Ertman 2020-11-20 @69  	upper =3D lag->upper_netdev ? =
netdev_name(lag->upper_netdev) : "unset";
df006dd4b1dca8c Dave Ertman 2020-11-20 @70  	master =3D lag->master ? "TRUE=
" : "FALSE";
df006dd4b1dca8c Dave Ertman 2020-11-20 @71  	bonded =3D lag->bonded ? "BOND=
ED" : "UNBONDED";
df006dd4b1dca8c Dave Ertman 2020-11-20  72  =

df006dd4b1dca8c Dave Ertman 2020-11-20  73  	switch (lag->role) {
df006dd4b1dca8c Dave Ertman 2020-11-20  74  	case ICE_LAG_NONE:
df006dd4b1dca8c Dave Ertman 2020-11-20 @75  		role =3D "NONE";
df006dd4b1dca8c Dave Ertman 2020-11-20  76  		break;
df006dd4b1dca8c Dave Ertman 2020-11-20  77  	case ICE_LAG_PRIMARY:
df006dd4b1dca8c Dave Ertman 2020-11-20  78  		role =3D "PRIMARY";
df006dd4b1dca8c Dave Ertman 2020-11-20  79  		break;
df006dd4b1dca8c Dave Ertman 2020-11-20  80  	case ICE_LAG_BACKUP:
df006dd4b1dca8c Dave Ertman 2020-11-20  81  		role =3D "BACKUP";
df006dd4b1dca8c Dave Ertman 2020-11-20  82  		break;
df006dd4b1dca8c Dave Ertman 2020-11-20  83  	case ICE_LAG_UNSET:
df006dd4b1dca8c Dave Ertman 2020-11-20  84  		role =3D "UNSET";
df006dd4b1dca8c Dave Ertman 2020-11-20  85  		break;
df006dd4b1dca8c Dave Ertman 2020-11-20  86  	default:
df006dd4b1dca8c Dave Ertman 2020-11-20  87  		role =3D "ERROR";
df006dd4b1dca8c Dave Ertman 2020-11-20  88  	}
df006dd4b1dca8c Dave Ertman 2020-11-20  89  =

df006dd4b1dca8c Dave Ertman 2020-11-20  90  	dev_dbg(dev, "%s %s, peer:%s, =
upper:%s, role:%s, master:%s\n", name,
df006dd4b1dca8c Dave Ertman 2020-11-20  91  		bonded, peer, upper, role, ma=
ster);
df006dd4b1dca8c Dave Ertman 2020-11-20  92  }
df006dd4b1dca8c Dave Ertman 2020-11-20  93  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0511547077459084746==--

