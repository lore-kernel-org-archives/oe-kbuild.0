Content-Type: multipart/mixed; boundary="===============1390925208600892249=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-omap2/id.c:158:2: warning: Value stored to 'rev' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 04 Jan 2022 10:46:02 +0800
Message-ID: <202201041044.vbmB2v4W-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1390925208600892249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Russell King <rmk+kernel@armlinux.org.uk>

Hi Randy,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: fd749fe4bcb00ad80d9eece709f804bb4ac6bf1e ARM: 9065/1: OABI compat: =
fix build when EPOLL is not enabled
date:   11 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220103 (https://download.01.org/0day-ci/archi=
ve/20220104/202201041044.vbmB2v4W-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b50fea=
47b6c454581fce89af359f3afe5154986c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfd749fe4bcb00ad80d9eece709f804bb4ac6bf1e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fd749fe4bcb00ad80d9eece709f804bb4ac6bf1e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   fs/jfs/jfs_dmap.c:4008:4: note:  Execution continues on line 4011
                           break;
                           ^
   fs/jfs/jfs_dmap.c:4012:6: note: 'sz' is < 'nblocks'
           if (sz < nblocks)
               ^~
   fs/jfs/jfs_dmap.c:4012:2: note: Taking true branch
           if (sz < nblocks)
           ^
   fs/jfs/jfs_dmap.c:4016:2: note: Returning the value 57
           return (l2sz - L2MAXAG);
           ^~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:3407:13: note: Returning from 'dbGetL2AGSize'
           l2agsize =3D dbGetL2AGSize(newsize);
                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:3407:2: note: The value 57 is assigned to 'l2agsize'
           l2agsize =3D dbGetL2AGSize(newsize);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:3411:21: note: The result of the left shift is undefin=
ed due to shifting by '57', which is greater or equal to the width of type =
'int'
           bmp->db_agsize =3D 1 << l2agsize;
                              ^  ~~~~~~~~
   fs/jfs/jfs_dmap.c:4011:15: warning: The result of the left shift is unde=
fined due to shifting by '64', which is greater or equal to the width of ty=
pe 's64' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           sz =3D (s64) 1 << l2sz;
                        ^
   fs/jfs/jfs_dmap.c:3392:2: note: Assuming 'jfsloglevel' is < 4
           jfs_info("dbExtendFS: blkno:%Ld nblocks:%Ld newsize:%Ld",
           ^
   fs/jfs/jfs_debug.h:56:6: note: expanded from macro 'jfs_info'
           if (jfsloglevel >=3D JFS_LOGLEVEL_INFO)           \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:3392:2: note: Taking false branch
           jfs_info("dbExtendFS: blkno:%Ld nblocks:%Ld newsize:%Ld",
           ^
   fs/jfs/jfs_debug.h:56:2: note: expanded from macro 'jfs_info'
           if (jfsloglevel >=3D JFS_LOGLEVEL_INFO)           \
           ^
   fs/jfs/jfs_dmap.c:3392:2: note: Loop condition is false.  Exiting loop
           jfs_info("dbExtendFS: blkno:%Ld nblocks:%Ld newsize:%Ld",
           ^
   fs/jfs/jfs_debug.h:55:31: note: expanded from macro 'jfs_info'
   #define jfs_info(fmt, arg...) do {                      \
                                 ^
   fs/jfs/jfs_dmap.c:3404:21: note: Assuming the condition is true
           bmp->db_maxlevel =3D BMAPSZTOLEV(bmp->db_mapsize);
                              ^
   fs/jfs/jfs_dmap.h:117:4: note: expanded from macro 'BMAPSZTOLEV'
           (((size) <=3D MAXL0SIZE) ? 0 : ((size) <=3D MAXL1SIZE) ? 1 : 2)
             ^~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:3404:21: note: '?' condition is true
           bmp->db_maxlevel =3D BMAPSZTOLEV(bmp->db_mapsize);
                              ^
   fs/jfs/jfs_dmap.h:117:3: note: expanded from macro 'BMAPSZTOLEV'
           (((size) <=3D MAXL0SIZE) ? 0 : ((size) <=3D MAXL1SIZE) ? 1 : 2)
            ^
   fs/jfs/jfs_dmap.c:3407:13: note: Calling 'dbGetL2AGSize'
           l2agsize =3D dbGetL2AGSize(newsize);
                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:4001:6: note: Assuming the condition is false
           if (nblocks < BPERDMAP * MAXAG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:4001:2: note: Taking false branch
           if (nblocks < BPERDMAP * MAXAG)
           ^
   fs/jfs/jfs_dmap.c:4006:7: note: The value 64 is assigned to 'l2sz'
           for (l2sz =3D 64; l2sz >=3D 0; l2sz--, m >>=3D 1) {
                ^~~~~~~~~
   fs/jfs/jfs_dmap.c:4006:2: note: Loop condition is true.  Entering loop b=
ody
           for (l2sz =3D 64; l2sz >=3D 0; l2sz--, m >>=3D 1) {
           ^
   fs/jfs/jfs_dmap.c:4007:7: note: Assuming the condition is true
                   if (m & nblocks)
                       ^~~~~~~~~~~
   fs/jfs/jfs_dmap.c:4007:3: note: Taking true branch
                   if (m & nblocks)
                   ^
   fs/jfs/jfs_dmap.c:4008:4: note:  Execution continues on line 4011
                           break;
                           ^
   fs/jfs/jfs_dmap.c:4011:15: note: The result of the left shift is undefin=
ed due to shifting by '64', which is greater or equal to the width of type =
's64'
           sz =3D (s64) 1 << l2sz;
                        ^  ~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> arch/arm/mach-omap2/id.c:158:2: warning: Value stored to 'rev' is never =
read [clang-analyzer-deadcode.DeadStores]
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:158:2: note: Value stored to 'rev' is never read
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:191:3: warning: Value stored to 'j' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:191:3: note: Value stored to 'j' is never read
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:266:2: warning: Value stored to 'n' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:266:2: note: Value stored to 'n' is never read
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:363:3: warning: Value stored to 'cpu_rev' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:363:3: note: Value stored to 'cpu_rev' is never=
 read
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:773:9: warning: 3rd function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Calling 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:52:2: note: 'val' initialized to 1792
           static u32 val =3D OMAP2_DEVICETYPE_MASK;
           ^~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:54:2: note: Taking false branch
           if (val < OMAP2_DEVICETYPE_MASK)
           ^
   arch/arm/mach-omap2/id.c:57:2: note: Taking false branch
           if (soc_is_omap24xx()) {
           ^
   arch/arm/mach-omap2/id.c:59:9: note: Taking false branch
           } else if (soc_is_ti81xx()) {
                  ^
   arch/arm/mach-omap2/id.c:61:13: note: Left side of '||' is false
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:174:27: note: expanded from macro 'soc_is_am33=
xx'
   #define soc_is_am33xx()                 0
                                           ^
   arch/arm/mach-omap2/id.c:61:9: note: Taking false branch
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                  ^
   arch/arm/mach-omap2/id.c:63:9: note: Taking false branch
           } else if (soc_is_omap34xx()) {
                  ^
   arch/arm/mach-omap2/id.c:65:9: note: Taking false branch
           } else if (soc_is_omap44xx()) {
                  ^
   arch/arm/mach-omap2/id.c:67:13: note: Left side of '||' is false
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:309:29: note: expanded from macro 'soc_is_omap=
54xx'
   # define soc_is_omap54xx()              is_omap54xx()
                                           ^
   arch/arm/mach-omap2/id.c:67:9: note: Taking false branch
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                  ^
   arch/arm/mach-omap2/id.c:74:3: note: Control jumps to line 81
                   goto out;
                   ^
   arch/arm/mach-omap2/id.c:81:2: note: Returning the value 1792 (loaded fr=
om 'val')
           return val;
           ^~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Returning from 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:9: note: 3rd function call argument is an u=
ninitialized value
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.
   mm/oom_kill.c:257:17: warning: Value stored to 'highest_zoneidx' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:257:17: note: Value stored to 'highest_zoneidx' during its=
 initialization is never read
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   mm/page-writeback.c:1408:14: warning: The result of the left shift is un=
defined because the right operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^
   mm/page-writeback.c:1885:6: note: Assuming the condition is false
           if (!(bdi->capabilities & BDI_CAP_WRITEBACK))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1885:2: note: Taking false branch
--
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:6: note: Assuming 'id' is =
< field 'num_ctrl'
           if (id >=3D of_data->num_ctrl) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:2: note: Taking false bran=
ch
           if (id >=3D of_data->num_ctrl) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1002:2: note: Returning pointe=
r, which participates in a condition later
           return &(of_data->ctrl[id]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Returning from '=
samsung_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:6: note: Assuming 'ctrl' =
is non-null
           if (!ctrl)
               ^~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:2: note: Taking false bra=
nch
           if (!ctrl)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Calling 'devm_k=
calloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:232:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:227:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:232:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:232:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Returning from =
'devm_kcalloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:6: note: Assuming field '=
pin_banks' is non-null
           if (!d->pin_banks)
               ^~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:2: note: Taking false bra=
nch
           if (!d->pin_banks)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:6: note: Assuming the con=
dition is false
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:2: note: Taking false bra=
nch
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:14: note: Assuming the co=
ndition is false
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:2: note: Loop condition i=
s false. Execution continues on line 1048
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:14: note: Assuming 'i' is=
 >=3D field 'nr_banks'
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:2: note: Loop condition i=
s false. Execution continues on line 1073
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1073:15: note: Assigned value =
is garbage or undefined
           d->virt_base =3D virt_base[0];
                        ^ ~~~~~~~~~~~~
   1 warning generated.
   arch/arm/mach-omap2/omap-wakeupgen.c:99:14: warning: Although the value =
stored to 'irq' is used in the enclosing expression, the value is never act=
ually read from 'irq' [clang-analyzer-deadcode.DeadStores]
           *bit_posn =3D irq %=3D 32;
                       ^      ~~
   arch/arm/mach-omap2/omap-wakeupgen.c:99:14: note: Although the value sto=
red to 'irq' is used in the enclosing expression, the value is never actual=
ly read from 'irq'
           *bit_posn =3D irq %=3D 32;
                       ^      ~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   4 warnings generated.
>> drivers/bus/omap_l3_noc.c:96:3: warning: Value stored to 'err_descriptio=
n' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:96:3: note: Value stored to 'err_description' =
is never read
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: warning: Value stored to 'err_descripti=
on' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: note: Value stored to 'err_description'=
 is never read
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
>> drivers/bus/omap_l3_noc.c:127:4: warning: Value stored to 'master_name' =
is never read [clang-analyzer-deadcode.DeadStores]
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:127:4: note: Value stored to 'master_name' is =
never read
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
>> drivers/bus/omap_l3_noc.c:132:2: warning: Value stored to 'op_code' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           op_code =3D readl_relaxed(l3_targ_hdr) & 0x7;
           ^
   drivers/bus/omap_l3_noc.c:132:2: note: Value stored to 'op_code' is neve=
r read
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   crypto/sm3_generic.c:121:2: warning: Value stored to 'a' is never read [=
clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:2: note: Value stored to 'a' is never read
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:6: warning: Although the value stored to 'b' is=
 used in the enclosing expression, the value is never actually read from 'b=
' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:6: note: Although the value stored to 'b' is us=
ed in the enclosing expression, the value is never actually read from 'b'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:10: warning: Although the value stored to 'c' i=
s used in the enclosing expression, the value is never actually read from '=
c' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:10: note: Although the value stored to 'c' is u=
sed in the enclosing expression, the value is never actually read from 'c'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:14: warning: Although the value stored to 'd' i=
s used in the enclosing expression, the value is never actually read from '=
d' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:14: note: Although the value stored to 'd' is u=
sed in the enclosing expression, the value is never actually read from 'd'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:18: warning: Although the value stored to 'e' i=
s used in the enclosing expression, the value is never actually read from '=
e' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:18: note: Although the value stored to 'e' is u=
sed in the enclosing expression, the value is never actually read from 'e'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:22: warning: Although the value stored to 'f' i=
s used in the enclosing expression, the value is never actually read from '=
f' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:22: note: Although the value stored to 'f' is u=
sed in the enclosing expression, the value is never actually read from 'f'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:26: warning: Although the value stored to 'g' i=
s used in the enclosing expression, the value is never actually read from '=
g' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:26: note: Although the value stored to 'g' is u=
sed in the enclosing expression, the value is never actually read from 'g'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:30: warning: Although the value stored to 'h' i=
s used in the enclosing expression, the value is never actually read from '=
h' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:30: note: Although the value stored to 'h' is u=
sed in the enclosing expression, the value is never actually read from 'h'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:34: warning: Although the value stored to 'ss1'=
 is used in the enclosing expression, the value is never actually read from=
 'ss1' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                           ^     ~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:34: note: Although the value stored to 'ss1' is=
 used in the enclosing expression, the value is never actually read from 's=
s1'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                           ^     ~~~~~~~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:40: warning: Although the value stored to 'ss2'=
 is used in the enclosing expression, the value is never actually read from=
 'ss2' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                 ^     ~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:40: note: Although the value stored to 'ss2' is=
 used in the enclosing expression, the value is never actually read from 's=
s2'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                 ^     ~~~~~~~~~~~~~
   crypto/sm3_generic.c:121:46: warning: Although the value stored to 'tt1'=
 is used in the enclosing expression, the value is never actually read from=
 'tt1' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                       ^     ~~~~~~~
   crypto/sm3_generic.c:121:46: note: Although the value stored to 'tt1' is=
 used in the enclosing expression, the value is never actually read from 't=
t1'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                       ^     ~~~~~~~
   crypto/sm3_generic.c:121:52: warning: Although the value stored to 'tt2'=
 is used in the enclosing expression, the value is never actually read from=
 'tt2' [clang-analyzer-deadcode.DeadStores]
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                             ^     ~
   crypto/sm3_generic.c:121:52: note: Although the value stored to 'tt2' is=
 used in the enclosing expression, the value is never actually read from 't=
t2'
           a =3D b =3D c =3D d =3D e =3D f =3D g =3D h =3D ss1 =3D ss2 =3D =
tt1 =3D tt2 =3D 0;
                                                             ^     ~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pinctrl/pinctrl-st.c:582:4: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
                           ST_PINCONF_PACK_OE(*config);
                           ^
   drivers/pinctrl/pinctrl-st.c:138:34: note: expanded from macro 'ST_PINCO=
NF_PACK_OE'
   #define ST_PINCONF_PACK_OE(conf)        ST_PINCONF_PACK(conf, 1, OE)
                                           ^
   drivers/pinctrl/pinctrl-st.c:129:49: note: expanded from macro 'ST_PINCO=
NF_PACK'
   #define ST_PINCONF_PACK(conf, val, param)       (conf |=3D\
                                                         ^
   drivers/pinctrl/pinctrl-st.c:1013:6: note: 'function' is 0
           if (function)
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:1013:2: note: Taking false branch
           if (function)
           ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Left side of '&&' is false
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Taking false branch
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Loop condition is false.  Ex=
iting loop
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pinctrl/pinctrl-st.c:1018:7: note: Calling 'st_gpio_get_directio=
n'
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:739:2: note: 'config' declared without an i=
nitial value
           unsigned long config;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:746:13: note: Calling 'st_pctl_get_pin_func=
tion'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:440:6: note: Assuming 'alt' is non-null
           if (!alt)
               ^~~~
   drivers/pinctrl/pinctrl-st.c:440:2: note: Taking false branch
           if (!alt)
           ^
   drivers/pinctrl/pinctrl-st.c:445:2: note: Returning without writing to '=
pc->oe', which participates in a condition later
           return (val >> offset) & 0xf;
           ^
   drivers/pinctrl/pinctrl-st.c:746:13: note: Returning from 'st_pctl_get_p=
in_function'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:6: note: Assuming 'function' is not equ=
al to 0
           if (function) {
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:2: note: Taking true branch
           if (function) {
           ^
   drivers/pinctrl/pinctrl-st.c:748:3: note: Calling 'st_pinconf_get_direct=
ion'
                   st_pinconf_get_direction(&pc, offset, &config);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:579:6: note: Assuming field 'oe' is non-null
           if (pc->oe) {
               ^~~~~~
   drivers/pinctrl/pinctrl-st.c:579:2: note: Taking true branch
           if (pc->oe) {
--
                 ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   mm/page_alloc.c:8285:6: note: Assuming 'numentries' is >=3D 'low_limit'
           if (numentries < low_limit)
               ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8285:2: note: Taking false branch
           if (numentries < low_limit)
           ^
   mm/page_alloc.c:8287:6: note: Assuming 'numentries' is <=3D 'max'
           if (numentries > max)
               ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:8287:2: note: Taking false branch
           if (numentries > max)
           ^
   mm/page_alloc.c:8290:12: note: '?' condition is false
           log2qty =3D ilog2(numentries);
                     ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   mm/page_alloc.c:8290:12: note: '?' condition is true
           log2qty =3D ilog2(numentries);
                     ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   mm/page_alloc.c:8290:12: note: Calling '__ilog2_u32'
           log2qty =3D ilog2(numentries);
                     ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   include/linux/log2.h:24:2: note: Returning the value -1
           return fls(n) - 1;
           ^~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8290:12: note: Returning from '__ilog2_u32'
           log2qty =3D ilog2(numentries);
                     ^
   include/linux/log2.h:162:2: note: expanded from macro 'ilog2'
           __ilog2_u32(n) :                \
           ^~~~~~~~~~~~~~
   mm/page_alloc.c:8290:2: note: The value 4294967295 is assigned to 'log2q=
ty'
           log2qty =3D ilog2(numentries);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8292:15: note: Assuming the condition is false
           gfp_flags =3D (flags & HASH_ZERO) ? GFP_ATOMIC | __GFP_ZERO : GF=
P_ATOMIC;
                        ^~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8292:14: note: '?' condition is false
           gfp_flags =3D (flags & HASH_ZERO) ? GFP_ATOMIC | __GFP_ZERO : GF=
P_ATOMIC;
                       ^
   mm/page_alloc.c:8296:7: note: Assuming the condition is true
                   if (flags & HASH_EARLY) {
                       ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:8296:3: note: Taking true branch
                   if (flags & HASH_EARLY) {
                   ^
   mm/page_alloc.c:8297:4: note: Taking false branch
                           if (flags & HASH_ZERO)
                           ^
   mm/page_alloc.c:8314:11: note: Assuming 'table' is non-null
           } while (!table && size > PAGE_SIZE && --log2qty);
                    ^~~~~~
   mm/page_alloc.c:8314:18: note: Left side of '&&' is false
           } while (!table && size > PAGE_SIZE && --log2qty);
                           ^
   mm/page_alloc.c:8293:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   mm/page_alloc.c:8316:7: note: 'table' is non-null
           if (!table)
                ^~~~~
   mm/page_alloc.c:8316:2: note: Taking false branch
           if (!table)
           ^
   mm/page_alloc.c:8320:18: note: The result of the left shift is undefined=
 due to shifting by '4294967295', which is greater or equal to the width of=
 type 'unsigned long'
                   tablename, 1UL << log2qty, ilog2(size) - PAGE_SHIFT, siz=
e,
                                  ^
   include/linux/printk.h:373:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   Suppressed 16 warnings (14 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> arch/arm/mach-imx/tzic.c:160:2: warning: Value stored to 'i' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           i =3D imx_readl(tzic_base + TZIC_INTCNTL);
           ^
   arch/arm/mach-imx/tzic.c:160:2: note: Value stored to 'i' is never read
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 with check filters).
   1 warning generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   include/linux/math64.h:91:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:240:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:230:6: note: Assuming field 'fla=
gs' is not equal to 0
           if (c->flags =3D=3D 0) {
               ^~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:230:2: note: Taking false branch
           if (c->flags =3D=3D 0) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:236:6: note: Assuming 'parent_ra=
te' is equal to field 'parent_rate'
           if (parent_rate !=3D c->parent_rate) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:236:2: note: Taking false branch
           if (parent_rate !=3D c->parent_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:247:6: note: Assuming 'target_ra=
te' is not equal to 'parent_rate'
           if (target_rate =3D=3D parent_rate) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:247:2: note: Taking false branch
           if (target_rate =3D=3D parent_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:255:9: note: Calling '__wrpll_ca=
lc_divq'
           divq =3D __wrpll_calc_divq(target_rate, &target_vco_rate);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:149:7: note: 'vco_rate' is non-n=
ull
           if (!vco_rate) {
                ^~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:149:2: note: Taking false branch
           if (!vco_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:155:6: note: Assuming 's' is <=
=3D 1
           if (s <=3D 1) {
               ^~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:155:2: note: Taking true branch
           if (s <=3D 1) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:167:2: note: Returning the value=
 1 (loaded from 'divq'), which participates in a condition later
           return divq;
           ^~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:255:9: note: Returning from '__w=
rpll_calc_divq'
           divq =3D __wrpll_calc_divq(target_rate, &target_vco_rate);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:256:7: note: 'divq' is 1
           if (!divq)
                ^~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:256:2: note: Taking false branch
--
                           ^
   mm/memblock.c:1176:8: note: Assuming 'm_end' is <=3D 'r_start'
                           if (m_end > r_start) {
                               ^~~~~~~~~~~~~~~
   mm/memblock.c:1176:4: note: Taking false branch
                           if (m_end > r_start) {
                           ^
   mm/memblock.c:1159:10: note: Assuming 'idx_b' is >=3D 0
                   for (; idx_b >=3D 0; idx_b--) {
                          ^~~~~~~~~~
   mm/memblock.c:1159:3: note: Loop condition is true.  Entering loop body
                   for (; idx_b >=3D 0; idx_b--) {
                   ^
   mm/memblock.c:1165:14: note: Assuming 'idx_b' is 0
                           r_start =3D idx_b ? r[-1].base + r[-1].size : 0;
                                     ^~~~~
   mm/memblock.c:1165:14: note: '?' condition is false
   mm/memblock.c:1166:12: note: Assuming 'idx_b' is >=3D field 'cnt'
                           r_end =3D idx_b < type_b->cnt ?
                                   ^~~~~~~~~~~~~~~~~~~
   mm/memblock.c:1166:12: note: '?' condition is false
   mm/memblock.c:1173:8: note: 'r_end' is > 'm_start'
                           if (r_end <=3D m_start)
                               ^~~~~
   mm/memblock.c:1173:4: note: Taking false branch
                           if (r_end <=3D m_start)
                           ^
   mm/memblock.c:1176:8: note: Assuming 'm_end' is > 'r_start'
                           if (m_end > r_start) {
                               ^~~~~~~~~~~~~~~
   mm/memblock.c:1176:4: note: Taking true branch
                           if (m_end > r_start) {
                           ^
   mm/memblock.c:1177:9: note: Assuming 'out_start' is null
                                   if (out_start)
                                       ^~~~~~~~~
   mm/memblock.c:1177:5: note: Taking false branch
                                   if (out_start)
                                   ^
   mm/memblock.c:1179:9: note: Assuming 'out_end' is null
                                   if (out_end)
                                       ^~~~~~~
   mm/memblock.c:1179:5: note: Taking false branch
                                   if (out_end)
                                   ^
   mm/memblock.c:1181:9: note: Assuming 'out_nid' is null
                                   if (out_nid)
                                       ^~~~~~~
   mm/memblock.c:1181:5: note: Taking false branch
                                   if (out_nid)
                                   ^
   mm/memblock.c:1183:9: note: 'm_start' is >=3D 'r_start'
                                   if (m_start >=3D r_start)
                                       ^~~~~~~
   mm/memblock.c:1183:5: note: Taking true branch
                                   if (m_start >=3D r_start)
                                   ^
   mm/memblock.c:1187:36: note: The result of the '<<' expression is undefi=
ned
                                   *idx =3D (u32)idx_a | (u64)idx_b << 32;
                                                       ~~~~~~~~~~~^~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/gpio/gpio-tegra186.c:602:5: warning: Value stored to 'value' is =
never read [clang-analyzer-deadcode.DeadStores]
                                   value =3D readl(base + offset);
                                   ^
   drivers/gpio/gpio-tegra186.c:602:5: note: Value stored to 'value' is nev=
er read
   2 warnings generated.
   drivers/clk/tegra/clk-tegra-super-gen4.c:141:3: warning: Value stored to=
 'clk' is never read [clang-analyzer-deadcode.DeadStores]
                   clk =3D clk_register_divider(NULL, "hclk_div", "sclk", 0,
                   ^
   drivers/clk/tegra/clk-tegra-super-gen4.c:141:3: note: Value stored to 'c=
lk' is never read
   drivers/clk/tegra/clk-tegra-super-gen4.c:156:2: warning: Value stored to=
 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_divider(NULL, "pclk_div", "hclk", 0,
           ^
   drivers/clk/tegra/clk-tegra-super-gen4.c:156:2: note: Value stored to 'c=
lk' is never read
   4 warnings generated.
   drivers/clk/tegra/clk-tegra114.c:910:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:910:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: note: Value stored to 'clk' is n=
ever read
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:1049:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
           ^
   drivers/clk/tegra/clk-tegra114.c:1049:2: note: Value stored to 'clk' is =
never read
   2 warnings generated.
>> drivers/clk/tegra/clk-tegra124.c:1098:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1098:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   fs/configfs/symlink.c:72:3: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(s,"../");
                   ^~~~~~
   fs/configfs/symlink.c:72:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy(s,"../");
                   ^~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/reiserfs/bitmap.c:1198:14: warning: Value stored to 'start' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           b_blocknr_t start =3D hint->search_start;
                       ^~~~~   ~~~~~~~~~~~~~~~~~~
   fs/reiserfs/bitmap.c:1198:14: note: Value stored to 'start' during its i=
nitialization is never read
           b_blocknr_t start =3D hint->search_start;
                       ^~~~~   ~~~~~~~~~~~~~~~~~~
   fs/reiserfs/bitmap.c:1199:14: warning: Value stored to 'finish' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           b_blocknr_t finish =3D SB_BLOCK_COUNT(s) - 1;
                       ^~~~~~
   fs/reiserfs/bitmap.c:1199:14: note: Value stored to 'finish' during its =
initialization is never read
           b_blocknr_t finish =3D SB_BLOCK_COUNT(s) - 1;
                       ^~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/reiserfs/do_balan.c:1162:2: warning: Value stored to 'leaf_mi' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           leaf_mi =3D leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i],
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/do_balan.c:1162:2: note: Value stored to 'leaf_mi' is never =
read
           leaf_mi =3D leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i],
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/reiserfs/namei.c:1445:8: warning: Although the value stored to 'retva=
l' is used in the enclosing expression, the value is never actually read fr=
om 'retval' [clang-analyzer-deadcode.DeadStores]
                   if ((retval =3D
                        ^
   fs/reiserfs/namei.c:1445:8: note: Although the value stored to 'retval' =
is used in the enclosing expression, the value is never actually read from =
'retval'
                   if ((retval =3D
                        ^
   fs/reiserfs/namei.c:1484:9: warning: Although the value stored to 'retva=
l' is used in the enclosing expression, the value is never actually read fr=
om 'retval' [clang-analyzer-deadcode.DeadStores]
                           if ((retval =3D
                                ^
   fs/reiserfs/namei.c:1484:9: note: Although the value stored to 'retval' =
is used in the enclosing expression, the value is never actually read from =
'retval'
                           if ((retval =3D
                                ^
   fs/reiserfs/reiserfs.h:1586:2: warning: Undefined or garbage value retur=
ned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return key->on_disk_key.k_offset;
           ^
   fs/reiserfs/namei.c:1324:6: note: Assuming the condition is false
           if (flags & ~RENAME_NOREPLACE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1324:2: note: Taking false branch
           if (flags & ~RENAME_NOREPLACE)
           ^
   fs/reiserfs/namei.c:1342:6: note: 'retval' is 0
           if (retval)
               ^~~~~~
   fs/reiserfs/namei.c:1342:2: note: Taking false branch
           if (retval)
           ^
   fs/reiserfs/namei.c:1345:6: note: 'retval' is 0
           if (retval)
               ^~~~~~
   fs/reiserfs/namei.c:1345:2: note: Taking false branch
           if (retval)
           ^
   fs/reiserfs/namei.c:1362:2: note: Taking false branch
           if (retval =3D=3D IO_ERROR) {
           ^
   fs/reiserfs/namei.c:1367:6: note: 'retval' is equal to NAME_FOUND
           if (retval !=3D NAME_FOUND || old_de.de_objectid !=3D old_inode-=
>i_ino) {
               ^~~~~~
   fs/reiserfs/namei.c:1367:6: note: Left side of '||' is false
   fs/reiserfs/namei.c:1367:30: note: Assuming field 'de_objectid' is equal=
 to field 'i_ino'
           if (retval !=3D NAME_FOUND || old_de.de_objectid !=3D old_inode-=
>i_ino) {
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/reiserfs/namei.c:1367:2: note: Taking false branch
           if (retval !=3D NAME_FOUND || old_de.de_objectid !=3D old_inode-=
>i_ino) {
           ^
   fs/reiserfs/namei.c:1373:6: note: Assuming the condition is false
           if (S_ISDIR(old_inode_mode)) {
--
   include/linux/math.h:14:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   mm/shmem.c:1542:29: note: Taking true branch
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                            ^
   include/linux/huge_mm.h:106:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:325:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/shmem.c:1542:29: note: Loop condition is false.  Exiting loop
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:26: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                            ^
   include/linux/huge_mm.h:106:26: note: expanded from macro 'HPAGE_PMD_ORD=
ER'
   #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
                            ^
   include/linux/huge_mm.h:325:28: note: expanded from macro 'HPAGE_PMD_SHI=
FT'
   #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
                              ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/shmem.c:1542:29: note: The result of the left shift is undefined beca=
use the right operand is negative
           hindex =3D round_down(index, HPAGE_PMD_NR);
                                      ^
   include/linux/huge_mm.h:107:24: note: expanded from macro 'HPAGE_PMD_NR'
   #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
                          ^
   include/linux/math.h:34:50: note: expanded from macro 'round_down'
   #define round_down(x, y) ((x) & ~__round_mask(x, y))
                                    ~~~~~~~~~~~~~~~~^~
   include/linux/math.h:14:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/sysv/dir.c:339:2: warning: Value stored to 'err' is never read [clang=
-analyzer-deadcode.DeadStores]
           err =3D dir_commit_chunk(page, pos, SYSV_DIRSIZE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/sysv/dir.c:339:2: note: Value stored to 'err' is never read
           err =3D dir_commit_chunk(page, pos, SYSV_DIRSIZE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/imx/clk-imx6q.c:251:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-imx6q.c:251:2: note: Value stored to 'ret' is never =
read
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/clk/ingenic/cgu.c:484:10: warning: Division by zero [clang-analy=
zer-core.DivideZero]
                   rate =3D DIV_ROUND_UP(parent_rate, div);
                          ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ingenic/cgu.c:474:36: note: Left side of '&&' is false
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:206:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ingenic/cgu.c:474:36: note: Taking false branch
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:206:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/ingenic/cgu.c:474:36: note: Loop condition is false.  Exitin=
g loop
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:206:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/ingenic/cgu.c:482:6: note: Assuming the condition is true
           if (clk_info->type & CGU_CLK_DIV) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:482:2: note: Taking true branch
           if (clk_info->type & CGU_CLK_DIV) {
           ^
   drivers/clk/ingenic/cgu.c:483:9: note: Calling 'ingenic_clk_calc_div'
                   div =3D ingenic_clk_calc_div(clk_info, parent_rate, req_=
rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/clk/ingenic/cgu.c:421:6: note: Assuming field 'div_table' is non=
-null
           if (clk_info->div.div_table) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:421:2: note: Taking true branch
           if (clk_info->div.div_table) {
           ^
   drivers/clk/ingenic/cgu.c:422:12: note: Calling 'ingenic_clk_calc_hw_div'
                   hw_div =3D ingenic_clk_calc_hw_div(clk_info, div);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:395:18: note: 'best_i' initialized to 0
           unsigned int i, best_i =3D 0, best =3D (unsigned int)-1;
                           ^~~~~~
   drivers/clk/ingenic/cgu.c:397:14: note: Assuming the condition is true
           for (i =3D 0; i < (1 << clk_info->div.bits)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:397:14: note: Left side of '&&' is true
   drivers/clk/ingenic/cgu.c:397:2: note: Loop condition is false. Executio=
n continues on line 409
           for (i =3D 0; i < (1 << clk_info->div.bits)
           ^
   drivers/clk/ingenic/cgu.c:409:2: note: Returning zero (loaded from 'best=
_i')
           return best_i;
           ^~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:422:12: note: Returning from 'ingenic_clk_calc=
_hw_div'
--
   drivers/gpu/drm/ttm/ttm_bo_util.c:57:3: note: Returning zero, which part=
icipates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:83:8: note: Returning from 'ttm_mem_io=
_reserve'
           ret =3D ttm_mem_io_reserve(bdev, mem);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:6: note: 'ret' is 0
           if (ret || !mem->bus.is_iomem)
               ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:6: note: Left side of '||' is false
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:23: note: Field 'is_iomem' is false
           if (ret || !mem->bus.is_iomem)
                                ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:2: note: Taking true branch
           if (ret || !mem->bus.is_iomem)
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:85:3: note: Returning zero (loaded fro=
m 'ret'), which participates in a condition later
                   return ret;
                   ^~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:192:8: note: Returning from 'ttm_resou=
rce_ioremap'
           ret =3D ttm_resource_ioremap(bdev, new_mem, &new_iomap);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:193:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:193:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:199:6: note: 'old_iomap' is not equal =
to NULL
           if (old_iomap =3D=3D NULL && new_iomap =3D=3D NULL)
               ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:199:24: note: Left side of '&&' is fal=
se
           if (old_iomap =3D=3D NULL && new_iomap =3D=3D NULL)
                                 ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:205:6: note: 'old_iomap' is not equal =
to NULL
           if (old_iomap =3D=3D NULL &&
               ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:205:24: note: Left side of '&&' is fal=
se
           if (old_iomap =3D=3D NULL &&
                                 ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:215:6: note: Assuming 'ttm' is null
           if (ttm) {
               ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:215:2: note: Taking false branch
           if (ttm) {
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:221:14: note: Assuming 'i' is < field =
'num_pages'
           for (i =3D 0; i < new_mem->num_pages; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:221:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < new_mem->num_pages; ++i) {
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:222:7: note: 'old_iomap' is not equal =
to NULL
                   if (old_iomap =3D=3D NULL) {
                       ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:222:3: note: Taking false branch
                   if (old_iomap =3D=3D NULL) {
                   ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:226:14: note: 'new_iomap' is equal to =
NULL
                   } else if (new_iomap =3D=3D NULL) {
                              ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:226:10: note: Taking true branch
                   } else if (new_iomap =3D=3D NULL) {
                          ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:228:31: note: Passing null pointer val=
ue via 1st parameter 'ttm'
                           ret =3D ttm_copy_io_ttm_page(ttm, old_iomap, i,
                                                      ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:228:10: note: Calling 'ttm_copy_io_ttm=
_page'
                           ret =3D ttm_copy_io_ttm_page(ttm, old_iomap, i,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:131:19: note: Access to field 'pages' =
results in a dereference of a null pointer (loaded from variable 'ttm')
           struct page *d =3D ttm->pages[page];
                            ^~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-v3-semi.c:604:6: warning: Value stored to 'pc=
i_end' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-v3-semi.c:604:6: note: Value stored to 'pci_e=
nd' during its initialization is never read
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-versatile.c:37:10: warning: Although the valu=
e stored to 'retval' is used in the enclosing expression, the value is neve=
r actually read from 'retval' [clang-analyzer-deadcode.DeadStores]
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-versatile.c:37:10: note: Although the value s=
tored to 'retval' is used in the enclosing expression, the value is never a=
ctually read from 'retval'
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/pci/controller/pcie-iproc.c:861:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:861:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (14 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: warning: Value stored to =
'value' is never read [clang-analyzer-deadcode.DeadStores]
           value |=3D RXDET_IN_P3_32KHZ;
           ^
   drivers/phy/cadence/phy-cadence-salvo.c:227:2: note: Value stored to 'va=
lue' is never read
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/host1x/job.c:182:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:596:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:116:14: note: Assuming 'i' is < field 'num_relo=
cs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:116:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:118:14: note: 'phys_addr' declared without an i=
nitial value
                   dma_addr_t phys_addr, *phys;
                              ^~~~~~~~~
   drivers/gpu/host1x/job.c:122:7: note: Assuming field 'bo' is non-null
                   if (!reloc->target.bo) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:122:3: note: Taking false branch
                   if (!reloc->target.bo) {
                   ^
   drivers/gpu/host1x/job.c:139:7: note: Assuming 'domain' is non-null
                   if (!domain || client->group)
                       ^~~~~~~
   drivers/gpu/host1x/job.c:139:7: note: Left side of '||' is false
   drivers/gpu/host1x/job.c:139:18: note: Assuming field 'group' is null
                   if (!domain || client->group)
                                  ^~~~~~~~~~~~~
--
           if (subcap_id =3D=3D TPM_CAP_VERSION_1_1 ||
               ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:492:6: note: Left side of '||' is false
   drivers/char/tpm/tpm1-cmd.c:493:6: note: 'subcap_id' is not equal to TPM=
_CAP_VERSION_1_2
               subcap_id =3D=3D TPM_CAP_VERSION_1_2) {
               ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:492:2: note: Taking false branch
           if (subcap_id =3D=3D TPM_CAP_VERSION_1_1 ||
           ^
   drivers/char/tpm/tpm1-cmd.c:497:7: note: 'subcap_id' is not equal to TPM=
_CAP_FLAG_PERM
                   if (subcap_id =3D=3D TPM_CAP_FLAG_PERM ||
                       ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:497:7: note: Left side of '||' is false
   drivers/char/tpm/tpm1-cmd.c:498:7: note: 'subcap_id' is not equal to TPM=
_CAP_FLAG_VOL
                       subcap_id =3D=3D TPM_CAP_FLAG_VOL)
                       ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:497:3: note: Taking false branch
                   if (subcap_id =3D=3D TPM_CAP_FLAG_PERM ||
                   ^
   drivers/char/tpm/tpm1-cmd.c:506:7: note: Value assigned to field 'durati=
on_adjusted', which participates in a condition later
           rc =3D tpm_transmit_cmd(chip, &buf, min_cap_length, desc);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:507:6: note: Assuming 'rc' is 0, which parti=
cipates in a condition later
           if (!rc)
               ^~~
   drivers/char/tpm/tpm1-cmd.c:507:2: note: Taking true branch
           if (!rc)
           ^
   drivers/char/tpm/tpm1-cmd.c:510:2: note: Returning zero (loaded from 'rc=
'), which participates in a condition later
           return rc;
           ^~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:417:7: note: Returning from 'tpm1_getcap'
           rc =3D tpm1_getcap(chip, TPM_CAP_PROP_TIS_DURATION, &cap,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:420:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/char/tpm/tpm1-cmd.c:420:2: note: Taking false branch
           if (rc)
           ^
   drivers/char/tpm/tpm1-cmd.c:424:20: note: '?' condition is false
                   usecs_to_jiffies(be32_to_cpu(cap.duration.tpm_short));
                                    ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/char/tpm/tpm1-cmd.c:426:20: note: '?' condition is false
                   usecs_to_jiffies(be32_to_cpu(cap.duration.tpm_medium));
                                    ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/char/tpm/tpm1-cmd.c:428:20: note: '?' condition is false
                   usecs_to_jiffies(be32_to_cpu(cap.duration.tpm_long));
                                    ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/char/tpm/tpm1-cmd.c:435:6: note: Assuming field 'update_duration=
s' is null
           if (chip->ops->update_durations)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:435:2: note: Taking false branch
           if (chip->ops->update_durations)
           ^
   drivers/char/tpm/tpm1-cmd.c:438:6: note: Assuming field 'duration_adjust=
ed' is true
           if (chip->duration_adjusted) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:438:2: note: Taking true branch
           if (chip->duration_adjusted) {
           ^
   drivers/char/tpm/tpm1-cmd.c:440:29: note: Assigned value is garbage or u=
ndefined
                   chip->duration[TPM_SHORT] =3D durations[0];
                                             ^ ~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:747:3: warning: Value stored to 'rc' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   rc =3D tpm1_pcr_extend(chip, tpm_suspend_pcr, dummy_hash,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm1-cmd.c:747:3: note: Value stored to 'rc' is never r=
ead
                   rc =3D tpm1_pcr_extend(chip, tpm_suspend_pcr, dummy_hash,
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/ti/clockdomain.c:115:2: warning: Value stored to 'clk_name' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clockdomain.c:115:2: note: Value stored to 'clk_name' is =
never read
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/clk/ti/divider.c:240:9: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           return DIV_ROUND_UP(*prate, div);
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ti/divider.c:238:8: note: Calling 'ti_clk_divider_bestdiv'
           div =3D ti_clk_divider_bestdiv(hw, rate, prate);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:179:37: note: Left side of '&&' is false
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ti/divider.c:179:37: note: Taking false branch
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/ti/divider.c:179:37: note: Loop condition is false.  Exiting=
 loop
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/ti/divider.c:184:6: note: Assuming 'rate' is not equal to 0
           if (!rate)
               ^~~~~
   drivers/clk/ti/divider.c:184:2: note: Taking false branch
           if (!rate)
           ^
   drivers/clk/ti/divider.c:189:6: note: Assuming the condition is false
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:189:2: note: Taking false branch
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
           ^
   drivers/clk/ti/divider.c:201:11: note: Assuming '__UNIQUE_ID___x112' is =
>=3D '__UNIQUE_ID___y113'
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/clk/ti/divider.c:201:11: note: '?' condition is false
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
--
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:386:2: warning: 4th function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           rcar_du_plane_write(rgrp, index, PnDSA0R, dma[0]);
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:624:6: note: Assuming field 'vis=
ible' is true
           if (!plane->state->visible)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:624:2: note: Taking false branch
           if (!plane->state->visible)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:627:2: note: Calling 'rcar_du_pl=
ane_setup'
           rcar_du_plane_setup(rplane);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.h:83:9: note: Calling '__rcar_du_p=
lane_setup'
           return __rcar_du_plane_setup(plane->group, state);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:548:21: note: Field 'planes' is =
not equal to 2
           if (state->format->planes =3D=3D 2)
                              ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:548:2: note: Taking false branch
           if (state->format->planes =3D=3D 2)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:552:18: note: Field 'gen' is < 3
           if (rcdu->info->gen < 3)
                           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:552:2: note: Taking true branch
           if (rcdu->info->gen < 3)
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:553:3: note: Calling 'rcar_du_pl=
ane_setup_scanout'
                   rcar_du_plane_setup_scanout(rgrp, state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:341:13: note: Field 'source' is =
equal to RCAR_DU_PLANE_MEMORY
           if (state->source =3D=3D RCAR_DU_PLANE_MEMORY) {
                      ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:341:2: note: Taking true branch
           if (state->source =3D=3D RCAR_DU_PLANE_MEMORY) {
           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:346:22: note: Field 'planes' is =
not equal to 2
                   if (state->format->planes =3D=3D 2)
                                      ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:346:3: note: Taking false branch
                   if (state->format->planes =3D=3D 2)
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:351:15: note: Assuming 'i' is >=
=3D field 'planes'
                   for (i =3D 0; i < state->format->planes; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:351:3: note: Loop condition is f=
alse. Execution continues on line 365
                   for (i =3D 0; i < state->format->planes; ++i) {
                   ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:366:9: note: Assuming 'interlace=
d' is false
                               (interlaced && state->format->bpp =3D=3D 32)=
 ?
                                ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:366:20: note: Left side of '&&' =
is false
                               (interlaced && state->format->bpp =3D=3D 32)=
 ?
                                           ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:10: note: 'interlaced' is fa=
lse
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                 ^~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:9: note: Left side of '&&' i=
s true
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:24: note: Assuming field 'bp=
p' is not equal to 32
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:384:9: note: '?' condition is fa=
lse
                               (!interlaced && state->format->bpp =3D=3D 32=
 ? 2 : 1));
                                ^
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:386:2: note: 4th function call a=
rgument is an uninitialized value
           rcar_du_plane_write(rgrp, index, PnDSA0R, dma[0]);
           ^                                         ~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:569:21: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct drm_device *dev =3D plane->dev;
                              ^~~   ~~~~~~~~~~
   drivers/gpu/drm/rcar-du/rcar_du_plane.c:569:21: note: Value stored to 'd=
ev' during its initialization is never read
           struct drm_device *dev =3D plane->dev;
                              ^~~   ~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/clk/spear/spear1310_clock.c:872:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:872:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/video/fbdev/sis/init301.c:1248:4: warning: Value stored to 'temp=
' is never read [clang-analyzer-deadcode.DeadStores]
      temp =3D SiS_GetRegShort((acpibase + 0x3c));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1248:4: note: Value stored to 'temp' i=
s never read
      temp =3D SiS_GetRegShort((acpibase + 0x3c));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1253:4: warning: Value stored to 'temp=
' is never read [clang-analyzer-deadcode.DeadStores]
      temp =3D SiS_GetRegShort((acpibase + 0x3a));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1253:4: note: Value stored to 'temp' i=
s never read
      temp =3D SiS_GetRegShort((acpibase + 0x3a));
      ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1533:19: warning: Value stored to 'Out=
putSelect' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
      unsigned char  OutputSelect =3D *SiS_Pr->pSiS_OutputSelect;
                     ^~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:1533:19: note: Value stored to 'Output=
Select' during its initialization is never read
      unsigned char  OutputSelect =3D *SiS_Pr->pSiS_OutputSelect;
                     ^~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   fs/xfs/libxfs/xfs_da_btree.c:380:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_da_btree.c:380:21: note: Left side of '||' is true
           if (error || !*bpp || !tp)
                              ^
   fs/xfs/libxfs/xfs_da_btree.c:381:3: note: Returning zero (loaded from 'e=
rror'), which participates in a condition later
                   return error;
                   ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2024:11: note: Returning from 'xfs_da3_node=
_read'
                   error =3D xfs_da3_node_read(args->trans, dp, blkno, &bp,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2026:7: note: 'error' is 0
                   if (error)
                       ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2026:3: note: Taking false branch
                   if (error)
                   ^
   fs/xfs/libxfs/xfs_da_btree.c:2035:7: note: 'release' is 1
                   if (release)
                       ^~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2035:3: note: Taking true branch
                   if (release)
                   ^
   fs/xfs/libxfs/xfs_da_btree.c:2038:3: note: Null pointer value stored to =
field 'bp'
                   blk->bp =3D bp;
                   ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2040:10: note: Access to field 'b_addr' res=
ults in a dereference of a null pointer (loaded from field 'bp')
                   info =3D blk->bp->b_addr;
                          ^    ~~
   fs/xfs/libxfs/xfs_da_btree.c:2206:22: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           if (got !=3D count || mapp[0].br_startoff !=3D *bno ||
                               ^
   fs/xfs/libxfs/xfs_da_btree.c:497:17: note: Assuming 'i' is < 0
           for (i =3D max; (i >=3D 0) && addblk; state->path.active--, i--)=
 {
                          ^~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:497:25: note: Left side of '&&' is false
           for (i =3D max; (i >=3D 0) && addblk; state->path.active--, i--)=
 {
                                  ^
   fs/xfs/libxfs/xfs_da_btree.c:565:7: note: 'addblk' is non-null
           if (!addblk)
                ^~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:565:2: note: Taking false branch
           if (!addblk)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:581:10: note: Calling 'xfs_da3_root_split'
           error =3D xfs_da3_root_split(state, oldblk, addblk);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:659:10: note: Calling 'xfs_da_grow_inode'
           error =3D xfs_da_grow_inode(args, &blkno);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2237:10: note: Calling 'xfs_da_grow_inode_i=
nt'
           error =3D xfs_da_grow_inode_int(args, &bno, args->geo->fsbcount);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2156:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2156:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2166:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2166:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2170:6: note: Assuming 'nmap' is not equal =
to 1
           if (nmap =3D=3D 1) {
               ^~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2170:2: note: Taking false branch
           if (nmap =3D=3D 1) {
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2173:13: note: Assuming 'nmap' is not equal=
 to 0
           } else if (nmap =3D=3D 0 && count > 1) {
                      ^~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2173:23: note: Left side of '&&' is false
           } else if (nmap =3D=3D 0 && count > 1) {
                                ^
   fs/xfs/libxfs/xfs_da_btree.c:2198:3: note: Null pointer value stored to =
'mapp'
                   mapp =3D NULL;
                   ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2204:2: note: Loop condition is false. Exec=
ution continues on line 2206
           for (i =3D 0, got =3D 0; i < mapi; i++)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2206:6: note: Assuming 'got' is equal to 'c=
ount'
           if (got !=3D count || mapp[0].br_startoff !=3D *bno ||
               ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2206:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_da_btree.c:2206:22: note: Dereference of null pointer
           if (got !=3D count || mapp[0].br_startoff !=3D *bno ||
                               ^~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clk/ti/apll.c:100:2: warning: Value stored to 'state' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/apll.c:100:2: note: Value stored to 'state' is never read
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/clk/ti/clkt_dpll.c:305:2: warning: Value stored to 'clk_name' is=
 never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clkt_dpll.c:305:2: note: Value stored to 'clk_name' is ne=
ver read
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   include/drm/drm_atomic.h:991:9: warning: Access to field 'mode_changed' =
results in a dereference of a null pointer (loaded from variable 'state') [=
clang-analyzer-core.NullDereference]
           return state->mode_changed || state->active_changed ||
                  ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:956:27: note: Left side of '&&=
' is false
           struct dpu_plane *pdpu =3D to_dpu_plane(plane);
                                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:134:25: note: expanded from ma=
cro 'to_dpu_plane'
   #define to_dpu_plane(x) container_of(x, struct dpu_plane, base)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:956:27: note: Taking false bra=
nch
           struct dpu_plane *pdpu =3D to_dpu_plane(plane);
                                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:134:25: note: expanded from ma=
cro 'to_dpu_plane'
   #define to_dpu_plane(x) container_of(x, struct dpu_plane, base)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:956:27: note: Loop condition i=
s false.  Exiting loop
           struct dpu_plane *pdpu =3D to_dpu_plane(plane);
                                    ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:134:25: note: expanded from ma=
cro 'to_dpu_plane'
   #define to_dpu_plane(x) container_of(x, struct dpu_plane, base)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:957:35: note: Left side of '&&=
' is false
           struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
                                            ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h:61:2: note: expanded from macr=
o 'to_dpu_plane_state'
           container_of(x, struct dpu_plane_state, base)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:957:35: note: Taking false bra=
nch
           struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
                                            ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h:61:2: note: expanded from macr=
o 'to_dpu_plane_state'
           container_of(x, struct dpu_plane_state, base)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:957:35: note: Loop condition i=
s false.  Exiting loop
           struct dpu_plane_state *pstate =3D to_dpu_plane_state(state);
                                            ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h:61:2: note: expanded from macr=
o 'to_dpu_plane_state'
           container_of(x, struct dpu_plane_state, base)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
--
   13 warnings generated.
   drivers/video/fbdev/nvidia/nvidia.c:124:4: warning: Value stored to 'tmp=
' is never read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D 0;
                           ^     ~
   drivers/video/fbdev/nvidia/nvidia.c:124:4: note: Value stored to 'tmp' i=
s never read
                           tmp =3D 0;
                           ^     ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/video/fbdev/nvidia/nv_hw.c:261:2: warning: Value stored to 'clwm=
' is never read [clang-analyzer-deadcode.DeadStores]
           clwm =3D 0;
           ^      ~
   drivers/video/fbdev/nvidia/nv_hw.c:261:2: note: Value stored to 'clwm' i=
s never read
           clwm =3D 0;
           ^      ~
   drivers/video/fbdev/nvidia/nv_hw.c:284:2: warning: Value stored to 'pclk=
s' is never read [clang-analyzer-deadcode.DeadStores]
           pclks +=3D 0;
           ^        ~
   drivers/video/fbdev/nvidia/nv_hw.c:284:2: note: Value stored to 'pclks' =
is never read
           pclks +=3D 0;
           ^        ~
   drivers/video/fbdev/nvidia/nv_hw.c:439:2: warning: Value stored to 'clwm=
' is never read [clang-analyzer-deadcode.DeadStores]
           clwm =3D 0;
           ^      ~
   drivers/video/fbdev/nvidia/nv_hw.c:439:2: note: Value stored to 'clwm' i=
s never read
           clwm =3D 0;
           ^      ~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/regulator/mc13xxx-regulator-core.c:115:6: warning: Value stored =
to 'id' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           int id =3D rdev_get_id(rdev);
               ^~   ~~~~~~~~~~~~~~~~~
   drivers/regulator/mc13xxx-regulator-core.c:115:6: note: Value stored to =
'id' during its initialization is never read
           int id =3D rdev_get_id(rdev);
               ^~   ~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, ", ");
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, ", ");
                           ^~~~~~
   1 warning generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: note: Value stored to=
 'ret' is never read
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: warning: Value stored to =
'temp' is never read [clang-analyzer-deadcode.DeadStores]
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: note: Value stored to 'te=
mp' is never read
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/tty/serial/samsung_tty.c:2037:5: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   drivers/tty/serial/samsung_tty.c:2037:5: note: Value stored to 'ret' is =
never read
                                   ret =3D -EINVAL;
                                   ^     ~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/tty/serial/sh-sci.c:2218:2: warning: The result of the left shif=
t is undefined due to shifting by '4294967295', which is greater or equal t=
o the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOpe=
ratorResult]
           for_each_sr(sr, s) {
           ^
   drivers/tty/serial/sh-sci.c:100:37: note: expanded from macro 'for_each_=
sr'
                   if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
                                                     ^~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:87:20: note: expanded from macro 'SCI_SR'
   #define SCI_SR(x)               BIT((x) - 1)
                                   ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/tty/serial/sh-sci.c:2215:6: note: Assuming field 'type' is equal=
 to PORT_HSCIF
           if (s->port.type !=3D PORT_HSCIF)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:2215:2: note: Taking false branch
           if (s->port.type !=3D PORT_HSCIF)
           ^
   drivers/tty/serial/sh-sci.c:2218:2: note: Assuming the condition is true
           for_each_sr(sr, s) {
           ^
   drivers/tty/serial/sh-sci.c:99:30: note: expanded from macro 'for_each_s=
r'
           for ((_sr) =3D max_sr(_port); (_sr) >=3D min_sr(_port); (_sr)--)=
    \
                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:2218:2: note: Loop condition is true.  Enter=
ing loop body
           for_each_sr(sr, s) {
           ^
   drivers/tty/serial/sh-sci.c:99:2: note: expanded from macro 'for_each_sr'
           for ((_sr) =3D max_sr(_port); (_sr) >=3D min_sr(_port); (_sr)--)=
    \
           ^
   drivers/tty/serial/sh-sci.c:2218:2: note: The result of the left shift i=
s undefined due to shifting by '4294967295', which is greater or equal to t=
he width of type 'unsigned long'
           for_each_sr(sr, s) {
           ^
   drivers/tty/serial/sh-sci.c:100:37: note: expanded from macro 'for_each_=
sr'
                   if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
                                                     ^~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:87:20: note: expanded from macro 'SCI_SR'
   #define SCI_SR(x)               BIT((x) - 1)
                                   ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/tty/serial/sh-sci.c:2245:2: warning: The result of the left shif=
t is undefined due to shifting by '4294967295', which is greater or equal t=
o the width of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOpe=
ratorResult]
           for_each_sr(sr, s) {
           ^
   drivers/tty/serial/sh-sci.c:100:37: note: expanded from macro 'for_each_=
sr'
                   if ((_port)->sampling_rate_mask & SCI_SR((_sr)))
                                                     ^~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:87:20: note: expanded from macro 'SCI_SR'
   #define SCI_SR(x)               BIT((x) - 1)
                                   ^~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   drivers/tty/serial/sh-sci.c:2242:6: note: Assuming field 'type' is equal=
 to PORT_HSCIF
           if (s->port.type !=3D PORT_HSCIF)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:2242:2: note: Taking false branch
           if (s->port.type !=3D PORT_HSCIF)
           ^
   drivers/tty/serial/sh-sci.c:2245:2: note: Assuming the condition is true
           for_each_sr(sr, s) {
           ^
   drivers/tty/serial/sh-sci.c:99:30: note: expanded from macro 'for_each_s=
r'
           for ((_sr) =3D max_sr(_port); (_sr) >=3D min_sr(_port); (_sr)--)=
    \
                                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:2245:2: note: Loop condition is true.  Enter=
ing loop body
           for_each_sr(sr, s) {
           ^
   drivers/tty/serial/sh-sci.c:99:2: note: expanded from macro 'for_each_sr'
           for ((_sr) =3D max_sr(_port); (_sr) >=3D min_sr(_port); (_sr)--)=
    \
--
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/xfs/libxfs/xfs_defer.c:492:9: note: Taking false branch
                   dfp =3D list_first_entry(&dop_pending, struct xfs_defer_=
pending,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/xfs/libxfs/xfs_defer.c:492:9: note: Loop condition is false.  Exiting=
 loop
                   dfp =3D list_first_entry(&dop_pending, struct xfs_defer_=
pending,
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/xfs/libxfs/xfs_defer.c:494:11: note: Calling 'xfs_defer_finish_one'
                   error =3D xfs_defer_finish_one(*tp, dfp);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:413:2: note: 'error' declared without an initi=
al value
           int                             error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:418:2: note: Loop condition is false. Executio=
n continues on line 441
           list_for_each_safe(li, n, &dfp->dfp_work) {
           ^
   include/linux/list.h:598:2: note: expanded from macro 'list_for_each_saf=
e'
           for (pos =3D (head)->next, n =3D pos->next; pos !=3D (head); \
           ^
   fs/xfs/libxfs/xfs_defer.c:444:6: note: Assuming field 'finish_cleanup' i=
s null
           if (ops->finish_cleanup)
               ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_defer.c:444:2: note: Taking false branch
           if (ops->finish_cleanup)
           ^
   fs/xfs/libxfs/xfs_defer.c:446:2: note: Undefined or garbage value return=
ed to caller
           return error;
           ^      ~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/sti/sti_hqvdp.c:741:6: warning: Division by zero [clang-=
analyzer-core.DivideZero]
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
               ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Left side of '&&' is false
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Taking false branch
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Loop condition is false. =
 Exiting loop
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Left side of '&&' is false
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Taking false branch
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Loop condition is false. =
 Exiting loop
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
--
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1040:10: note: Assuming '__UNIQUE_ID___x=
283' is >=3D '__UNIQUE_ID___y284'
           dst_h =3D clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
                   ^
   include/linux/minmax.h:143:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:130:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1040:10: note: '?' condition is false
           dst_h =3D clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
                   ^
   include/linux/minmax.h:143:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:130:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^
   include/linux/minmax.h:110:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1040:2: note: The value 0 is assigned to=
 'dst_h'
           dst_h =3D clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1047:6: note: Assuming field 'clock' is =
not equal to 0
           if (mode->clock && !sti_hqvdp_check_hw_scaling(hqvdp, mode,
               ^~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1047:6: note: Left side of '&&' is true
   drivers/gpu/drm/sti/sti_hqvdp.c:1049:21: note: Passing the value 0 via 6=
th parameter 'dst_h'
                                                          dst_w, dst_h)) {
                                                                 ^~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:1047:22: note: Calling 'sti_hqvdp_check_=
hw_scaling'
           if (mode->clock && !sti_hqvdp_check_hw_scaling(hqvdp, mode,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:741:9: note: Assuming '__UNIQUE_ID___x27=
2' is > '__UNIQUE_ID___y273'
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/sti/sti_hqvdp.c:741:9: note: '?' condition is true
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
                  ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/sti/sti_hqvdp.c:743:11: note: Division by zero
           inv_zy =3D DIV_ROUND_UP(src_h, dst_h);
                    ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/omapdrm/omap_encoder.c:104:16: warning: Access to field =
'bridge' results in a dereference of a null pointer (loaded from variable '=
output') [clang-analyzer-core.NullDereference]
           for (bridge =3D output->bridge; bridge;
                         ^~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Left side of '&&' is=
 false
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Taking false branch
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Loop condition is fa=
lse.  Exiting loop
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:77:2: note: 'output' initialized =
here
           struct omap_dss_device *output =3D omap_encoder->output;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Left side of '&&' is =
false
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Taking false branch
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
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
--
                   glops->go_inval(gl, target =3D=3D LM_ST_DEFERRED ? 0 : D=
IO_METADATA);
                                       ^~~~~~
   fs/gfs2/glock.c:643:23: note: '?' condition is true
   fs/gfs2/glock.c:643:3: note: Called function pointer is null (null deref=
erence)
                   glops->go_inval(gl, target =3D=3D LM_ST_DEFERRED ? 0 : D=
IO_METADATA);
                   ^~~~~~~~~~~~~~~
   include/linux/jhash.h:127:5: warning: Assigned value is garbage or undef=
ined [clang-analyzer-core.uninitialized.Assign]
                   b +=3D k[1];
                     ^
   fs/gfs2/glock.c:1523:10: note: Calling 'gfs2_glock_get'
           error =3D gfs2_glock_get(sdp, number, glops, CREATE, &gl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:1002:7: note: Calling 'find_insert_glock'
           gl =3D find_insert_glock(&name, NULL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:946:26: note: Calling 'glock_waitqueue'
           wait_queue_head_t *wq =3D glock_waitqueue(name);
                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/glock.c:107:13: note: Calling 'jhash2'
           u32 hash =3D jhash2((u32 *)name, ht_parms.key_len / 4, 0);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:125:2: note: Loop condition is true.  Entering loo=
p body
           while (length > 3) {
           ^
   include/linux/jhash.h:127:5: note: Assigned value is garbage or undefined
                   b +=3D k[1];
                     ^  ~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c:366:3: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c:366:3: note: Value st=
ored to 'err' is never read
                   err =3D PTR_ERR(kingdisplay->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:54:17: warning: Value s=
tored to 'dev' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:54:17: note: Value stor=
ed to 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, src);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, src);
                   ^~~~~~
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/base.c:213:21: warning: Value stored to 'dss=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/base.c:213:21: note: Value stored to 'dss' d=
uring its initialization is never read
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is < 'num=
_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:920:3: note: Calling 'dispc_ovl_writ=
e_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(dispc, i, &coefs_yuv2rgb=
_bt601_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is >=3D '=
num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is false=
. Execution continues on line 922
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:6: note: Assuming field 'has_wri=
teback' is true
           if (dispc->feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:2: note: Taking true branch
           if (dispc->feat->has_writeback)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:923:3: note: Calling 'dispc_wb_write=
_color_conv_coef'
                   dispc_wb_write_color_conv_coef(dispc, &coefs_rgb2yuv_bt6=
01_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: warning: Value stored to 'ht=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: note: Value stored to 'ht' i=
s never read
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: warning: Value stored to 'vt=
' is never read [clang-analyzer-deadcode.DeadStores]
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: note: Value stored to 'vt' i=
s never read
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: warning: Value stored to 're=
v' is never read [clang-analyzer-deadcode.DeadStores]
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: note: Value stored to 'rev' =
is never read
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   block/blk-mq-cpumap.c:21:33: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           return qmap->queue_offset + (q % nr_queues);
                                          ^
   block/blk-mq-cpumap.c:38:2: note: 'nr_queues' initialized here
           unsigned int nr_queues =3D qmap->nr_queues;
           ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Loop condition is true.  Entering loop=
 body
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:817:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:208:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:41:2: note: Loop condition is false. Execution con=
tinues on line 48
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:817:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:208:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:48:2: note: Loop condition is true.  Entering loop=
 body
           for_each_present_cpu(cpu) {
           ^
   include/linux/cpumask.h:819:36: note: expanded from macro 'for_each_pres=
ent_cpu'
   #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
                                      ^
   include/linux/cpumask.h:208:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:49:7: note: Assuming 'q' is >=3D 'nr_queues'
                   if (q >=3D nr_queues)
                       ^~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:49:3: note: Taking true branch
                   if (q >=3D nr_queues)
                   ^
   block/blk-mq-cpumap.c:50:4: note:  Execution continues on line 54
                           break;
                           ^
   block/blk-mq-cpumap.c:54:2: note: Loop condition is true.  Entering loop=
 body
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:817:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:208:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   block/blk-mq-cpumap.c:55:3: note: Taking false branch
                   if (map[cpu] !=3D -1)
                   ^
   block/blk-mq-cpumap.c:63:7: note: 'q' is >=3D 'nr_queues'
                   if (q < nr_queues) {
                       ^
   block/blk-mq-cpumap.c:63:3: note: Taking false branch
                   if (q < nr_queues) {
                   ^
   block/blk-mq-cpumap.c:67:8: note: 'first_sibling' is equal to 'cpu'
                           if (first_sibling =3D=3D cpu)
                               ^~~~~~~~~~~~~
   block/blk-mq-cpumap.c:67:4: note: Taking true branch
                           if (first_sibling =3D=3D cpu)
                           ^
   block/blk-mq-cpumap.c:68:34: note: Passing the value 0 via 2nd parameter=
 'nr_queues'
                                   map[cpu] =3D queue_index(qmap, nr_queues=
, q++);
                                                                ^~~~~~~~~
   block/blk-mq-cpumap.c:68:16: note: Calling 'queue_index'
                                   map[cpu] =3D queue_index(qmap, nr_queues=
, q++);
                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   block/blk-mq-cpumap.c:21:33: note: Division by zero
           return qmap->queue_offset + (q % nr_queues);
                                        ~~^~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/xfs/libxfs/xfs_dir2_data.c:256:27: warning: Access to field 'count' r=
esults in a dereference of a null pointer (loaded from variable 'btp') [cla=
ng-analyzer-core.NullDereference]
                   for (i =3D stale =3D 0; i < be32_to_cpu(btp->count); i++=
) {
                                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
--
           uint16_t hi_sidd =3D smu_data->power_tune_table.BapmVddCBaseLeak=
ageHiSidd;
                    ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:590=
:11: warning: Value stored to 'lo_sidd' during its initialization is never =
read [clang-analyzer-deadcode.DeadStores]
           uint16_t lo_sidd =3D smu_data->power_tune_table.BapmVddCBaseLeak=
ageLoSidd;
                    ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:590=
:11: note: Value stored to 'lo_sidd' during its initialization is never read
           uint16_t lo_sidd =3D smu_data->power_tune_table.BapmVddCBaseLeak=
ageLoSidd;
                    ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:967=
:2: warning: Value stored to 'result' is never read [clang-analyzer-deadcod=
e.DeadStores]
           result =3D polaris10_calculate_sclk_params(hwmgr, clock, &curr_s=
clk_setting);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:967=
:2: note: Value stored to 'result' is never read
           result =3D polaris10_calculate_sclk_params(hwmgr, clock, &curr_s=
clk_setting);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:159=
2:3: warning: Value stored to 'result' is never read [clang-analyzer-deadco=
de.DeadStores]
                   result =3D 0;
                   ^        ~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:159=
2:3: note: Value stored to 'result' is never read
                   result =3D 0;
                   ^        ~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:160=
0:3: warning: Value stored to 'result' is never read [clang-analyzer-deadco=
de.DeadStores]
                   result =3D 0;
                   ^        ~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:160=
0:3: note: Value stored to 'result' is never read
                   result =3D 0;
                   ^        ~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:186=
8:3: warning: Value stored to 'result' is never read [clang-analyzer-deadco=
de.DeadStores]
                   result =3D smu7_read_smc_sram_dword(hwmgr,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/polaris10_smumgr.c:186=
8:3: note: Value stored to 'result' is never read
                   result =3D smu7_read_smc_sram_dword(hwmgr,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:374:1=
1: warning: Value stored to 'HiSidd' during its initialization is never rea=
d [clang-analyzer-deadcode.DeadStores]
           uint16_t HiSidd =3D smu_data->power_tune_table.BapmVddCBaseLeaka=
geHiSidd;
                    ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:374:1=
1: note: Value stored to 'HiSidd' during its initialization is never read
           uint16_t HiSidd =3D smu_data->power_tune_table.BapmVddCBaseLeaka=
geHiSidd;
                    ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:375:1=
1: warning: Value stored to 'LoSidd' during its initialization is never rea=
d [clang-analyzer-deadcode.DeadStores]
           uint16_t LoSidd =3D smu_data->power_tune_table.BapmVddCBaseLeaka=
geLoSidd;
                    ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:375:1=
1: note: Value stored to 'LoSidd' during its initialization is never read
           uint16_t LoSidd =3D smu_data->power_tune_table.BapmVddCBaseLeaka=
geLoSidd;
                    ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:827:2=
: warning: Value stored to 'spll_func_cntl' is never read [clang-analyzer-d=
eadcode.DeadStores]
           spll_func_cntl =3D PHM_SET_FIELD(spll_func_cntl,
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:827:2=
: note: Value stored to 'spll_func_cntl' is never read
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:898:2=
: warning: Value stored to 'result' is never read [clang-analyzer-deadcode.=
DeadStores]
           result =3D iceland_calculate_sclk_params(hwmgr, engine_clock, gr=
aphic_level);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:898:2=
: note: Value stored to 'result' is never read
           result =3D iceland_calculate_sclk_params(hwmgr, engine_clock, gr=
aphic_level);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:1664:=
3: warning: Value stored to 'result' is never read [clang-analyzer-deadcode=
.DeadStores]
                   result =3D 0;
                   ^        ~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:1664:=
3: note: Value stored to 'result' is never read
                   result =3D 0;
                   ^        ~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:2067:=
2: warning: Value stored to 'result' is never read [clang-analyzer-deadcode=
.DeadStores]
           result =3D smu7_copy_bytes_to_smc(hwmgr,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:2067:=
2: note: Value stored to 'result' is never read
           result =3D smu7_copy_bytes_to_smc(hwmgr,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:2190:=
3: warning: Value stored to 'result' is never read [clang-analyzer-deadcode=
.DeadStores]
                   result =3D smu7_copy_bytes_to_smc(
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/iceland_smumgr.c:2190:=
3: note: Value stored to 'result' is never read
                   result =3D smu7_copy_bytes_to_smc(
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/mfd/menelaus.c:453:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:453:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   16 warnings generated.
   drivers/mfd/twl-core.c:574:15: warning: The left operand of '&' is a gar=
bage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:569:2: note: 'ctrl' declared without an initial v=
alue
           u8 ctrl;
           ^~~~~~~
   drivers/mfd/twl-core.c:572:2: note: Calling 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:9: note: Calling 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:473:7: note: 'regmap' is null
           if (!regmap)
                ^~~~~~
   drivers/mfd/twl-core.c:473:2: note: Taking true branch
           if (!regmap)
           ^
   drivers/mfd/twl-core.c:474:3: note: Returning without writing to '*value'
                   return -EPERM;
                   ^
   include/linux/mfd/twl.h:180:9: note: Returning from 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:2: note: Returning without writing to '*val'
           return twl_i2c_read(mod_no, val, reg, 1);
           ^
   drivers/mfd/twl-core.c:572:2: note: Returning from 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:574:15: note: The left operand of '&' is a garbag=
e value
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:1205:8: warning: The left expression of the compo=
und assignment is an uninitialized value. The computed value will also be g=
arbage [clang-analyzer-core.uninitialized.Assign]
                   temp &=3D ~(SR_I2C_SDA_CTRL_PU | SR_I2C_SCL_CTRL_PU | \
                   ~~~~ ^
   drivers/mfd/twl-core.c:1078:6: note: Assuming 'node' is non-null
           if (!node && !pdata) {
               ^~~~~
   drivers/mfd/twl-core.c:1078:12: note: Left side of '&&' is false
           if (!node && !pdata) {
                     ^
   drivers/mfd/twl-core.c:1083:6: note: Assuming 'twl_priv' is null
           if (twl_priv) {
               ^~~~~~~~
   drivers/mfd/twl-core.c:1083:2: note: Taking false branch
           if (twl_priv) {
           ^
   drivers/mfd/twl-core.c:1090:6: note: Assuming 'pdev' is non-null
           if (!pdev) {
               ^~~~~
   drivers/mfd/twl-core.c:1090:2: note: Taking false branch
           if (!pdev) {
           ^
   drivers/mfd/twl-core.c:1096:6: note: Assuming 'status' is 0
           if (status) {
               ^~~~~~
   drivers/mfd/twl-core.c:1096:2: note: Taking false branch
           if (status) {
           ^
   drivers/mfd/twl-core.c:1101:2: note: Taking false branch
           if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C) =3D=
=3D 0) {
           ^
   drivers/mfd/twl-core.c:1109:6: note: Assuming 'twl_priv' is non-null
           if (!twl_priv) {
               ^~~~~~~~~
   drivers/mfd/twl-core.c:1109:2: note: Taking false branch
           if (!twl_priv) {
           ^
   drivers/mfd/twl-core.c:1114:6: note: Assuming the condition is true
           if ((id->driver_data) & TWL6030_CLASS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1114:2: note: Taking true branch
           if ((id->driver_data) & TWL6030_CLASS) {
           ^
   drivers/mfd/twl-core.c:1118:7: note: Assuming the condition is false
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1118:3: note: Taking false branch
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                   ^
   drivers/mfd/twl-core.c:1129:26: note: Calling 'devm_kcalloc'
--
                                               ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:48:2: note: Taking false branch
           BUG_ON(HFI_HEADER_SIZE(hdr) > dwords);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:48:2: note: Loop condition is fals=
e.  Exiting loop
           BUG_ON(HFI_HEADER_SIZE(hdr) > dwords);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:50:14: note: Assuming the conditio=
n is true
           for (i =3D 0; i < HFI_HEADER_SIZE(hdr); i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:50:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < HFI_HEADER_SIZE(hdr); i++) {
           ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:50:14: note: Assuming the conditio=
n is true
           for (i =3D 0; i < HFI_HEADER_SIZE(hdr); i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:50:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < HFI_HEADER_SIZE(hdr); i++) {
           ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:50:14: note: Assuming the conditio=
n is false
           for (i =3D 0; i < HFI_HEADER_SIZE(hdr); i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:50:2: note: Loop condition is fals=
e. Execution continues on line 55
           for (i =3D 0; i < HFI_HEADER_SIZE(hdr); i++) {
           ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:55:6: note: Assuming field 'legacy=
' is true
           if (!gmu->legacy)
               ^~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:55:2: note: Taking false branch
           if (!gmu->legacy)
           ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:59:2: note: Returning value, which=
 participates in a condition later
           return HFI_HEADER_SIZE(hdr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:122:9: note: Returning from 'a6xx_=
hfi_queue_read'
                   ret =3D a6xx_hfi_queue_read(gmu, queue, (u32 *) &resp,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:126:8: note: 'ret' is not equal to=
 0
                   if (!ret) {
                        ^~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:126:3: note: Taking false branch
                   if (!ret) {
                   ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:133:7: note: Assuming the conditio=
n is false
                   if (HFI_HEADER_ID(resp.header) =3D=3D HFI_F2H_MSG_ERROR)=
 {
                       ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.h:44:28: note: expanded from macro '=
HFI_HEADER_ID'
   #define HFI_HEADER_ID(msg) ((msg) & 0xff)
                              ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:133:3: note: Taking false branch
                   if (HFI_HEADER_ID(resp.header) =3D=3D HFI_F2H_MSG_ERROR)=
 {
                   ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:142:7: note: Assuming the conditio=
n is false
                   if (seqnum !=3D HFI_HEADER_SEQNUM(resp.ret_header)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:142:3: note: Taking false branch
                   if (seqnum !=3D HFI_HEADER_SEQNUM(resp.ret_header)) {
                   ^
   drivers/gpu/drm/msm/adreno/a6xx_hfi.c:149:7: note: Branch condition eval=
uates to a garbage value
                   if (resp.error) {
                       ^~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/hsi/controllers/omap_ssi_port.c:481:2: warning: Value stored to =
'val' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(ssr + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:481:2: note: Value stored to 'va=
l' is never read
   drivers/hsi/controllers/omap_ssi_port.c:764:2: warning: Value stored to =
'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D readl(omap_port->ssr_base + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:764:2: note: Value stored to 'mo=
de' is never read
   drivers/hsi/controllers/omap_ssi_port.c:1332:2: warning: Value stored to=
 'mode' is never read [clang-analyzer-deadcode.DeadStores]
           mode =3D readl(omap_port->ssr_base + SSI_SSR_MODE_REG);
           ^
   drivers/hsi/controllers/omap_ssi_port.c:1332:2: note: Value stored to 'm=
ode' is never read
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/hsi/clients/ssi_protocol.c:458:21: warning: Value stored to 'cl'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   drivers/hsi/clients/ssi_protocol.c:458:21: note: Value stored to 'cl' du=
ring its initialization is never read
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/watchdog/pcwd_pci.c:169:2: warning: 1st function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
           outb_p(*lsb, pcipcwd_private.io_addr + 4);
           ^
   include/asm-generic/io.h:577:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   drivers/watchdog/pcwd_pci.c:688:6: note: Assuming 'cards_found' is not e=
qual to 1
           if (cards_found =3D=3D 1)
               ^~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:688:2: note: Taking false branch
           if (cards_found =3D=3D 1)
           ^
   drivers/watchdog/pcwd_pci.c:691:6: note: Assuming 'cards_found' is <=3D 1
           if (cards_found > 1) {
               ^~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:691:2: note: Taking false branch
           if (cards_found > 1) {
           ^
   drivers/watchdog/pcwd_pci.c:696:6: note: Assuming the condition is false
           if (pci_enable_device(pdev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:696:2: note: Taking false branch
           if (pci_enable_device(pdev)) {
           ^
   drivers/watchdog/pcwd_pci.c:701:6: note: Assuming field 'start' is not e=
qual to 0
           if (pci_resource_start(pdev, 0) =3D=3D 0x0000) {
               ^
   include/linux/pci.h:1854:38: note: expanded from macro 'pci_resource_sta=
rt'
   #define pci_resource_start(dev, bar)    ((dev)->resource[(bar)].start)
                                           ^
   drivers/watchdog/pcwd_pci.c:701:2: note: Taking false branch
           if (pci_resource_start(pdev, 0) =3D=3D 0x0000) {
           ^
   drivers/watchdog/pcwd_pci.c:707:2: note: Loop condition is false.  Exiti=
ng loop
           spin_lock_init(&pcipcwd_private.io_lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/watchdog/pcwd_pci.c:711:6: note: Assuming the condition is false
           if (pci_request_regions(pdev, WATCHDOG_NAME)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:711:2: note: Taking false branch
           if (pci_request_regions(pdev, WATCHDOG_NAME)) {
           ^
   drivers/watchdog/pcwd_pci.c:731:2: note: Calling 'pcipcwd_show_card_info'
           pcipcwd_show_card_info();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:226:32: note: 'fw_rev_minor' declared withou=
t an initial value
           int got_fw_rev, fw_rev_major, fw_rev_minor;
                                         ^~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:230:15: note: Calling 'send_command'
           got_fw_rev =3D send_command(CMD_GET_FIRMWARE_VERSION, &fw_rev_ma=
jor,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/watchdog/pcwd_pci.c:158:6: note: Assuming 'debug' is < DEBUG
           if (debug >=3D DEBUG)
               ^~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:158:2: note: Taking false branch
           if (debug >=3D DEBUG)
           ^
   drivers/watchdog/pcwd_pci.c:169:2: note: 1st function call argument is a=
n uninitialized value
           outb_p(*lsb, pcipcwd_private.io_addr + 4);
           ^      ~~~~
   include/asm-generic/io.h:577:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/locks.c:2375:3: warning: Value stored to 'cmd' is never read [clang-a=
nalyzer-deadcode.DeadStores]
                   cmd =3D F_GETLK;
--
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/iio/proximity/sx9310.c:625:11: note: Loop condition is false.  E=
xiting loop
           regval =3D FIELD_GET(SX9310_REG_PROX_CTRL10_HYST_MASK, regval);
                    ^
   include/linux/bitfield.h:108:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:54:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   __BUILD_BUG_ON_NOT_POWER_OF_2((_mask) +                 \
                   ^
   include/linux/build_bug.h:21:2: note: expanded from macro '__BUILD_BUG_O=
N_NOT_POWER_OF_2'
           BUILD_BUG_ON(((n) & ((n) - 1)) !=3D 0)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/iio/proximity/sx9310.c:626:6: note: Assuming 'regval' is not equ=
al to 0
           if (!regval)
               ^~~~~~~
   drivers/iio/proximity/sx9310.c:626:2: note: Taking false branch
           if (!regval)
           ^
   drivers/iio/proximity/sx9310.c:630:17: note: The left operand of '>>' is=
 a garbage value
           *val =3D pthresh >> (5 - regval);
                  ~~~~~~~ ^
   drivers/iio/proximity/sx9310.c:743:26: warning: The left operand of '>>'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           else if (val =3D=3D pthresh >> 2)
                                   ^
   drivers/iio/proximity/sx9310.c:803:6: note: Assuming field 'type' is equ=
al to IIO_PROXIMITY
           if (chan->type !=3D IIO_PROXIMITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:803:2: note: Taking false branch
           if (chan->type !=3D IIO_PROXIMITY)
           ^
   drivers/iio/proximity/sx9310.c:806:2: note: Control jumps to 'case IIO_E=
V_INFO_HYSTERESIS:'  at line 818
           switch (info) {
           ^
   drivers/iio/proximity/sx9310.c:819:10: note: Calling 'sx9310_write_hyste=
resis'
                   return sx9310_write_hysteresis(data, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:735:11: note: 'pthresh' declared without =
an initial value
           int ret, pthresh;
                    ^~~~~~~
   drivers/iio/proximity/sx9310.c:737:8: note: Calling 'sx9310_read_thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:596:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/iio/proximity/sx9310.c:596:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:600:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/proximity/sx9310.c:600:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/proximity/sx9310.c:601:3: note: Returning without writing to=
 '*val'
                   return ret;
                   ^
   drivers/iio/proximity/sx9310.c:737:8: note: Returning from 'sx9310_read_=
thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:738:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/proximity/sx9310.c:738:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:741:6: note: Assuming 'val' is not equal =
to 0
           if (val =3D=3D 0)
               ^~~~~~~~
   drivers/iio/proximity/sx9310.c:741:2: note: Taking false branch
           if (val =3D=3D 0)
           ^
   drivers/iio/proximity/sx9310.c:743:26: note: The left operand of '>>' is=
 a garbage value
           else if (val =3D=3D pthresh >> 2)
                           ~~~~~~~ ^
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/mtd/devices/st_spi_fsm.c:275:8: warning: Excessive padding in 's=
truct seq_rw_config' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   flags, =

   write, =

   cmd, =

   addr_pads, =

   data_pads, =

   mode_data, =

   mode_cycles, =

   dummy_cycles, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:275:8: note: Excessive padding in 'stru=
ct seq_rw_config' (6 padding bytes, where 2 is optimal). Optimal fields ord=
er: flags, write, cmd, addr_pads, data_pads, mode_data, mode_cycles, dummy_=
cycles, consider reordering the fields or adding explicit padding members
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:287:8: warning: Excessive padding in 's=
truct flash_info' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   jedec_id, =

   sector_size, =

   flags, =

   max_freq, =

   config, =

   ext_id, =

   n_sectors, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:287:8: note: Excessive padding in 'stru=
ct flash_info' (4 padding bytes, where 0 is optimal). Optimal fields order:=
 name, jedec_id, sector_size, flags, max_freq, config, ext_id, n_sectors, c=
onsider reordering the fields or adding explicit padding members
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:1427:3: warning: Value stored to 'offs'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   offs =3D 0;
                   ^      ~
   drivers/mtd/devices/st_spi_fsm.c:1427:3: note: Value stored to 'offs' is=
 never read
                   offs =3D 0;
                   ^      ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   include/linux/mtd/mtd.h:470:19: warning: The left operand of '=3D=3D' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return ops->mode =3D=3D MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->=
oobsize;
                            ^
   drivers/mtd/nand/onenand/onenand_base.c:3187:28: note: Assuming the cond=
ition is false
           u_char *buf =3D FLEXONENAND(this) ? this->page_buf : this->oob_b=
uf;
                                     ^
   include/linux/mtd/onenand.h:161:3: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3187:16: note: '?' condition is =
false
           u_char *buf =3D FLEXONENAND(this) ? this->page_buf : this->oob_b=
uf;
                         ^
   include/linux/mtd/onenand.h:161:2: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3192:20: note: '?' condition is =
false
           memset(buf, 0xff, FLEXONENAND(this) ? this->writesize
                             ^
   include/linux/mtd/onenand.h:161:2: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3202:8: note: '?' condition is f=
alse
           len =3D FLEXONENAND(this) ? mtd->writesize : 16;
                 ^
   include/linux/mtd/onenand.h:161:2: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3210:2: note: Taking false branch
           if (FLEXONENAND(this))
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3214:6: note: Assuming 'otp' is =
equal to 1
           if (otp =3D=3D 1)
               ^~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3214:2: note: Taking true branch
           if (otp =3D=3D 1)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3223:8: note: Calling 'onenand_o=
tp_walk'
           ret =3D onenand_otp_walk(mtd, from, len, &retlen, buf, do_otp_lo=
ck, MTD_OTP_USER);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:6: note: Assuming 'density'=
 is >=3D ONENAND_DEVICE_DENSITY_512Mb
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:2: note: Taking false branch
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3043:6: note: 'mode' is not equa=
l to MTD_OTP_FACTORY
           if (mode =3D=3D MTD_OTP_FACTORY) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3043:2: note: Taking false branch
           if (mode =3D=3D MTD_OTP_FACTORY) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3049:6: note: 'mode' is equal to=
 MTD_OTP_USER
           if (mode =3D=3D MTD_OTP_USER) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3049:2: note: Taking true branch
           if (mode =3D=3D MTD_OTP_USER) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3050:7: note: Assuming the condi=
tion is false
                   if (mtd->writesize * otp_pages < from + len)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3050:3: note: Taking false branch
                   if (mtd->writesize * otp_pages < from + len)
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: 'len' is > 0
           while (len > 0 && otp_pages > 0) {
                  ^~~
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: Left side of '&&' =
is true
   drivers/mtd/nand/onenand/onenand_base.c:3058:2: note: Loop condition is =
true.  Entering loop body
           while (len > 0 && otp_pages > 0) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3059:8: note: 'action' is non-nu=
ll
                   if (!action) {  /* OTP Info functions */
                        ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3059:3: note: Taking false branch
                   if (!action) {  /* OTP Info functions */
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3079:10: note: Calling 'do_otp_l=
ock'
                           ret =3D action(mtd, from, len, &tmp_retlen, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2983:18: note: Assuming the cond=
ition is true
           if (FLEXONENAND(this)) {
                           ^
   include/linux/mtd/onenand.h:161:3: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2983:2: note: Taking true branch
           if (FLEXONENAND(this)) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:2996:9: note: Calling 'onenand_w=
rite_ops_nolock'
                   ret =3D onenand_write_ops_nolock(mtd, mtd->writesize * 4=
9, &ops);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1799:2: note: Taking false branch
--
           hlist_for_each_entry_safe(__nr_neigh, node2, list, neigh_node)
                                     ^~~~~~~~~~
   include/linux/list.h:1025:7: note: expanded from macro 'hlist_for_each_e=
ntry_safe'
                pos && ({ n =3D pos->member.next; 1; });                   =
  \
                ^~~
   net/netrom/nr_route.c:971:25: note: Left side of '&&' is true
           nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
                                  ^
   net/netrom/nr_route.c:971:2: note: Loop condition is true.  Entering loo=
p body
           nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
           ^
   include/net/netrom.h:164:2: note: expanded from macro 'nr_neigh_for_each=
_safe'
           hlist_for_each_entry_safe(__nr_neigh, node2, list, neigh_node)
           ^
   include/linux/list.h:1024:2: note: expanded from macro 'hlist_for_each_e=
ntry_safe'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*pos), membe=
r);\
           ^
   net/netrom/nr_route.c:972:3: note: Loop condition is true.  Entering loo=
p body
                   while(s->count) {
                   ^
   net/netrom/nr_route.c:974:4: note: Calling 'nr_neigh_put'
                           nr_neigh_put(s);
                           ^~~~~~~~~~~~~~~
   include/net/netrom.h:138:2: note: Taking true branch
           if (refcount_dec_and_test(&nr_neigh->refcount)) {
           ^
   include/net/netrom.h:139:7: note: Assuming field 'ax25' is null
                   if (nr_neigh->ax25)
                       ^~~~~~~~~~~~~~
   include/net/netrom.h:139:3: note: Taking false branch
                   if (nr_neigh->ax25)
                   ^
   include/net/netrom.h:142:3: note: Memory is released
                   kfree(nr_neigh);
                   ^~~~~~~~~~~~~~~
   net/netrom/nr_route.c:974:4: note: Returning; memory was released via 1s=
t parameter
                           nr_neigh_put(s);
                           ^~~~~~~~~~~~~~~
   net/netrom/nr_route.c:972:9: note: Use of memory after it is freed
                   while(s->count) {
                         ^~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/hwmon/ltc2945.c:286:2: warning: Value stored to 'ret' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/hwmon/ltc2945.c:286:2: note: Value stored to 'ret' is never read
           ret =3D regmap_update_bits(regmap, LTC2945_CONTROL, CONTROL_TEST=
_MODE,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   2 warnings generated.
   drivers/iio/gyro/itg3200_core.c:94:3: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:94:3: note: Value stored to 'ret' is nev=
er read
                   ret =3D itg3200_read_reg_s16(indio_dev, reg, val);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:371:18: warning: Value stored to 'st' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct itg3200 *st =3D iio_priv(indio_dev);
                           ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/iio/gyro/itg3200_core.c:371:18: note: Value stored to 'st' durin=
g its initialization is never read
           struct itg3200 *st =3D iio_priv(indio_dev);
                           ^~   ~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/venc.c:697:2: warning: Value stored to 'rev_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/venc.c:697:2: note: Value stored to 'rev_id'=
 is never read
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   4 warnings generated.
   Suppressed 4 warnings (4 with check filters).
   13 warnings generated.
   drivers/gpu/drm/drm_mode_config.c:443:4: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_mode_config.c:443:4: note: Value stored to 'ret' is =
never read
                           ret =3D drm_modeset_backoff(&modeset_ctx);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/drm_syncobj.c:408:2: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
           drm_syncobj_fence_add_wait(syncobj, &wait);
           ^
   drivers/gpu/drm/drm_syncobj.c:886:2: note: Taking false branch
           if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
           ^
   drivers/gpu/drm/drm_syncobj.c:889:6: note: Assuming field 'pad' is 0
           if (args->pad)
               ^~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:889:2: note: Taking false branch
           if (args->pad)
           ^
   drivers/gpu/drm/drm_syncobj.c:892:6: note: Assuming field 'dst_point' is=
 0
           if (args->dst_point)
               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:892:2: note: Taking false branch
           if (args->dst_point)
           ^
   drivers/gpu/drm/drm_syncobj.c:895:9: note: Calling 'drm_syncobj_transfer=
_to_binary'
                   ret =3D drm_syncobj_transfer_to_binary(file_private, arg=
s);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:866:7: note: 'binary_syncobj' is non-null
           if (!binary_syncobj)
                ^~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:866:2: note: Taking false branch
           if (!binary_syncobj)
           ^
   drivers/gpu/drm/drm_syncobj.c:868:8: note: Calling 'drm_syncobj_find_fen=
ce'
           ret =3D drm_syncobj_find_fence(file_private, args->src_handle,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:382:32: note: Calling 'drm_syncobj_find'
           struct drm_syncobj *syncobj =3D drm_syncobj_find(file_private, h=
andle);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/drm_syncobj.c:231:6: note: Assuming 'syncobj' is non-null
           if (syncobj)
               ^~~~~~~
   drivers/gpu/drm/drm_syncobj.c:231:2: note: Taking true branch
           if (syncobj)
--
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/base/regmap/regmap-debugfs.c:72:7: note: Loop condition is false=
.  Exiting loop
                   c =3D list_first_entry(&map->debugfs_off_cache,
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/base/regmap/regmap-debugfs.c:75:3: note: Calling 'list_del'
                   list_del(&c->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   2 warnings generated.
   drivers/clocksource/ingenic-timer.c:32:8: warning: Excessive padding in =
'struct ingenic_tcu_timer' (108 padding bytes, where 44 is optimal). =

   Optimal fields order: =

   cevt, =

   cpu, =

   channel, =

   clk, =

   name, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ingenic_tcu_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/clocksource/ingenic-timer.c:32:8: note: Excessive padding in 'st=
ruct ingenic_tcu_timer' (108 padding bytes, where 44 is optimal). Optimal f=
ields order: cevt, cpu, channel, clk, name, consider reordering the fields =
or adding explicit padding members
   struct ingenic_tcu_timer {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/core/net-sysfs.c:1662:2: warning: Value stored to 'txq' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           txq =3D real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1662:2: note: Value stored to 'txq' is never read
           txq =3D real_tx;
           ^     ~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/nvmem/sunxi_sid.c:107:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(val, &word, bytes);
           ^      ~~~
   drivers/nvmem/sunxi_sid.c:89:9: note: Assuming 'bytes' is >=3D 4
           while (bytes >=3D 4) {
                  ^~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:89:2: note: Loop condition is true.  Entering =
loop body
           while (bytes >=3D 4) {
           ^
   drivers/nvmem/sunxi_sid.c:90:9: note: Calling 'sun8i_sid_register_readou=
t'
                   ret =3D sun8i_sid_register_readout(sid, offset, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:61:2: note: Loop condition is false.  Exiting =
loop
           writel(reg_val, sid->base + SUN8I_SID_PRCTL);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:166:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/nvmem/sunxi_sid.c:63:8: note: '__sleep_us' is not equal to 0
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:160:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/nvmem/sunxi_sid.c:63:8: note: Taking true branch
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:87:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
--
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c:668:3: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(mmSRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c:668:3: note: Value stored to 'tmp'=
 is never read
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1246:5: warning: Value stored to '=
ring' is never read [clang-analyzer-deadcode.DeadStores]
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1246:5: note: Value stored to 'rin=
g' is never read
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1307:5: warning: Value stored to '=
ring' is never read [clang-analyzer-deadcode.DeadStores]
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1307:5: note: Value stored to 'rin=
g' is never read
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (14 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/i2c/busses/i2c-amd756.c:108:7: warning: Although the value store=
d to 'temp' is used in the enclosing expression, the value is never actuall=
y read from 'temp' [clang-analyzer-deadcode.DeadStores]
           if ((temp =3D inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_S=
TS)) {
                ^
   drivers/i2c/busses/i2c-amd756.c:108:7: note: Although the value stored t=
o 'temp' is used in the enclosing expression, the value is never actually r=
ead from 'temp'
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/i2c/busses/i2c-sis5595.c:229:8: warning: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp' [clang-analyzer-deadcode.DeadStores]
                   if ((temp =3D sis5595_read(SMB_STS_LO) + (sis5595_read(S=
MB_STS_HI) << 8)) !=3D 0x00) {
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-sis5595.c:229:8: note: Although the value stored =
to 'temp' is used in the enclosing expression, the value is never actually =
read from 'temp'
                   if ((temp =3D sis5595_read(SMB_STS_LO) + (sis5595_read(S=
MB_STS_HI) << 8)) !=3D 0x00) {
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/cpufreq/mediatek-cpufreq.c:305:14: warning: Value stored to 'cpu=
_clk' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:305:14: note: Value stored to 'cpu_cl=
k' during its initialization is never read
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
>> drivers/cpufreq/mediatek-cpufreq.c:306:14: warning: Value stored to 'int=
er_clk' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:306:14: note: Value stored to 'inter_=
clk' during its initialization is never read
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clocksource/timer-of.c:191:3: warning: Value stored to 'flags' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   flags |=3D TIMER_OF_IRQ;
                   ^
   drivers/clocksource/timer-of.c:191:3: note: Value stored to 'flags' is n=
ever read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (12 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/leds/leds-lp5523.c:811:2: warning: Undefined or garbage value re=
turned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/leds/leds-lp5523.c:798:2: note: 'ret' declared without an initia=
l value
           int ret;
           ^~~~~~~
   drivers/leds/leds-lp5523.c:802:14: note: Assuming 'i' is >=3D field 'num=
_colors'
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-lp5523.c:802:2: note: Loop condition is false. Executi=
on continues on line 810
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
           ^
   drivers/leds/leds-lp5523.c:811:2: note: Undefined or garbage value retur=
ned to caller
           return ret;
           ^      ~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   14 warnings generated.
   drivers/iio/accel/mma8452.c:254:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/mma8452.c:254:2: note: Value stored to 'ret' is never =
read
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
--
   fs/reiserfs/fix_node.c:2637:7: note: 'ret' is equal to CARRY_ON
                   if (ret !=3D CARRY_ON) {
                       ^~~
   fs/reiserfs/fix_node.c:2637:3: note: Taking false branch
                   if (ret !=3D CARRY_ON) {
                   ^
   fs/reiserfs/fix_node.c:2655:7: note: 'ret' is equal to CARRY_ON
                   if (ret !=3D CARRY_ON)
                       ^~~
   fs/reiserfs/fix_node.c:2655:3: note: Taking false branch
                   if (ret !=3D CARRY_ON)
                   ^
   fs/reiserfs/fix_node.c:2663:7: note: 'ret' is equal to CARRY_ON
                   if (ret !=3D CARRY_ON)
                       ^~~
   fs/reiserfs/fix_node.c:2663:3: note: Taking false branch
                   if (ret !=3D CARRY_ON)
                   ^
   fs/reiserfs/fix_node.c:2670:8: note: Field 'pe_buffer' is non-null
                   if (!PATH_H_PBUFFER(tb->tb_path, h)) {
                        ^
   fs/reiserfs/reiserfs.h:2171:4: note: expanded from macro 'PATH_H_PBUFFER'
                           PATH_OFFSET_PBUFFER(path, path->path_length - (h=
))
                           ^
   fs/reiserfs/reiserfs.h:2150:86: note: expanded from macro 'PATH_OFFSET_P=
BUFFER'
   #define PATH_OFFSET_PBUFFER(path, n_offset)   (PATH_OFFSET_PELEMENT(path=
, n_offset)->pe_buffer)
                                                                           =
             ^
   fs/reiserfs/fix_node.c:2670:3: note: Taking false branch
                   if (!PATH_H_PBUFFER(tb->tb_path, h)) {
                   ^
   fs/reiserfs/fix_node.c:2677:14: note: Assuming field 'pe_buffer' is null
                   } else if (!PATH_H_PBUFFER(tb->tb_path, h + 1)) {
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2677:10: note: Taking true branch
                   } else if (!PATH_H_PBUFFER(tb->tb_path, h + 1)) {
                          ^
   fs/reiserfs/fix_node.c:2684:8: note: Assuming the condition is true
                           if (tb->blknum[h] > 1) {
                               ^~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2684:4: note: Taking true branch
                           if (tb->blknum[h] > 1) {
                           ^
   fs/reiserfs/fix_node.c:2686:5: note: Loop condition is false.  Exiting l=
oop
                                   RFALSE(h =3D=3D MAX_HEIGHT - 1,
                                   ^
   fs/reiserfs/reiserfs.h:922:41: note: expanded from macro 'RFALSE'
   #define RFALSE( cond, format, args... ) do {;} while( 0 )
                                           ^
   fs/reiserfs/fix_node.c:2630:14: note: 'h' is < MAX_HEIGHT
           for (h =3D 0; h < MAX_HEIGHT && tb->insert_size[h]; h++) {
                       ^
   fs/reiserfs/fix_node.c:2630:14: note: Left side of '&&' is true
   fs/reiserfs/fix_node.c:2630:2: note: Loop condition is true.  Entering l=
oop body
           for (h =3D 0; h < MAX_HEIGHT && tb->insert_size[h]; h++) {
           ^
   fs/reiserfs/fix_node.c:2631:9: note: Calling 'get_direct_parent'
                   ret =3D get_direct_parent(tb, h);
                         ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2098:6: note: Assuming 'path_offset' is > FIRST_P=
ATH_ELEMENT_OFFSET
           if (path_offset <=3D FIRST_PATH_ELEMENT_OFFSET) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2098:2: note: Taking false branch
           if (path_offset <=3D FIRST_PATH_ELEMENT_OFFSET) {
           ^
   fs/reiserfs/fix_node.c:2115:6: note: Assuming the condition is false
           if (!B_IS_IN_TREE
               ^~~~~~~~~~~~~
   fs/reiserfs/fix_node.c:2115:2: note: Taking false branch
           if (!B_IS_IN_TREE
           ^
   fs/reiserfs/fix_node.c:2119:6: note: Assuming the condition is false
           if ((position =3D
               ^~~~~~~~~~~
   fs/reiserfs/fix_node.c:2119:2: note: Taking false branch
           if ((position =3D
           ^
   fs/reiserfs/fix_node.c:2126:6: note: Access to field 'b_blocknr' results=
 in a dereference of a null pointer (loaded from field 'pe_buffer')
               PATH_OFFSET_PBUFFER(path, path_offset)->b_blocknr)
               ^
   fs/reiserfs/reiserfs.h:2150:47: note: expanded from macro 'PATH_OFFSET_P=
BUFFER'
   #define PATH_OFFSET_PBUFFER(path, n_offset)   (PATH_OFFSET_PELEMENT(path=
, n_offset)->pe_buffer)
                                                 ^                         =
             ~~~~~~~~~
   Suppressed 14 warnings (12 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> arch/arm/mach-omap2/id.c:158:2: warning: Value stored to 'rev' is never =
read [clang-analyzer-deadcode.DeadStores]
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:158:2: note: Value stored to 'rev' is never read
           rev =3D (idcode >> 28) & 0x0f;
           ^     ~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:191:3: warning: Value stored to 'j' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:191:3: note: Value stored to 'j' is never read
                   j =3D i;
                   ^   ~
   arch/arm/mach-omap2/id.c:266:2: warning: Value stored to 'n' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:266:2: note: Value stored to 'n' is never read
           n +=3D scnprintf(buf + n, sizeof(buf) - n, ")\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:363:3: warning: Value stored to 'cpu_rev' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:363:3: note: Value stored to 'cpu_rev' is never=
 read
                   cpu_rev =3D "1.0";
                   ^         ~~~~~
   arch/arm/mach-omap2/id.c:773:9: warning: 3rd function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Calling 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:52:2: note: 'val' initialized to 1792
           static u32 val =3D OMAP2_DEVICETYPE_MASK;
           ^~~~~~~~~~~~~~
   arch/arm/mach-omap2/id.c:54:2: note: Taking false branch
           if (val < OMAP2_DEVICETYPE_MASK)
           ^
   arch/arm/mach-omap2/id.c:57:2: note: Taking false branch
           if (soc_is_omap24xx()) {
           ^
   arch/arm/mach-omap2/id.c:59:9: note: Taking false branch
           } else if (soc_is_ti81xx()) {
                  ^
   arch/arm/mach-omap2/id.c:61:13: note: Left side of '||' is false
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:174:27: note: expanded from macro 'soc_is_am33=
xx'
   #define soc_is_am33xx()                 0
                                           ^
   arch/arm/mach-omap2/id.c:61:9: note: Taking false branch
           } else if (soc_is_am33xx() || soc_is_am43xx()) {
                  ^
   arch/arm/mach-omap2/id.c:63:9: note: Taking false branch
           } else if (soc_is_omap34xx()) {
                  ^
   arch/arm/mach-omap2/id.c:65:9: note: Taking false branch
           } else if (soc_is_omap44xx()) {
                  ^
   arch/arm/mach-omap2/id.c:67:13: note: Left side of '||' is false
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                      ^
   arch/arm/mach-omap2/soc.h:309:29: note: expanded from macro 'soc_is_omap=
54xx'
   # define soc_is_omap54xx()              is_omap54xx()
                                           ^
   arch/arm/mach-omap2/id.c:67:9: note: Taking false branch
           } else if (soc_is_omap54xx() || soc_is_dra7xx()) {
                  ^
   arch/arm/mach-omap2/id.c:74:3: note: Control jumps to line 81
                   goto out;
                   ^
   arch/arm/mach-omap2/id.c:81:2: note: Returning the value 1792 (loaded fr=
om 'val')
           return val;
           ^~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:41: note: Returning from 'omap_type'
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                                                  ^~~~~~~~~~~
   arch/arm/mach-omap2/id.c:773:9: note: 3rd function call argument is an u=
ninitialized value
           return sprintf(buf, "%s\n", omap_types[omap_type()]);
                  ^                    ~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.
   mm/oom_kill.c:257:17: warning: Value stored to 'highest_zoneidx' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   mm/oom_kill.c:257:17: note: Value stored to 'highest_zoneidx' during its=
 initialization is never read
           enum zone_type highest_zoneidx =3D gfp_zone(oc->gfp_mask);
                          ^~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   mm/page-writeback.c:1408:14: warning: The result of the left shift is un=
defined because the right operand is negative [clang-analyzer-core.Undefine=
dBinaryOperatorResult]
                   return 1UL << (ilog2(thresh - dirty) >> 1);
                              ^
   mm/page-writeback.c:1885:6: note: Assuming the condition is false
           if (!(bdi->capabilities & BDI_CAP_WRITEBACK))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page-writeback.c:1885:2: note: Taking false branch
--
               ^~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:173:6: note: Left side of '||' is false
   fs/xfs/scrub/parent.c:173:26: note: Assuming the condition is false
           if (error =3D=3D -EINVAL || error =3D=3D -ENOENT) {
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:173:2: note: Taking false branch
           if (error =3D=3D -EINVAL || error =3D=3D -ENOENT) {
           ^
   fs/xfs/scrub/parent.c:178:6: note: Assuming the condition is false
           if (!xchk_fblock_xref_process_error(sc, XFS_DATA_FORK, 0, &error=
))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:178:2: note: Taking false branch
           if (!xchk_fblock_xref_process_error(sc, XFS_DATA_FORK, 0, &error=
))
           ^
   fs/xfs/scrub/parent.c:180:6: note: Assuming 'dp' is not equal to field '=
ip'
           if (dp =3D=3D sc->ip || !S_ISDIR(VFS_I(dp)->i_mode)) {
               ^~~~~~~~~~~~
   fs/xfs/scrub/parent.c:180:6: note: Left side of '||' is false
   fs/xfs/scrub/parent.c:180:23: note: Assuming the condition is true
           if (dp =3D=3D sc->ip || !S_ISDIR(VFS_I(dp)->i_mode)) {
                                ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:180:2: note: Taking false branch
           if (dp =3D=3D sc->ip || !S_ISDIR(VFS_I(dp)->i_mode)) {
           ^
   fs/xfs/scrub/parent.c:192:6: note: Assuming the condition is false
           if (xfs_ilock_nowait(dp, XFS_IOLOCK_SHARED)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:192:2: note: Taking false branch
           if (xfs_ilock_nowait(dp, XFS_IOLOCK_SHARED)) {
           ^
   fs/xfs/scrub/parent.c:211:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/parent.c:211:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/parent.c:215:10: note: Calling 'xchk_parent_count_parent_de=
ntries'
           error =3D xchk_parent_count_parent_dentries(sc, dp, &nlink);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:93:6: note: Assuming field 'if_nextents' is > 0
           if (parent->i_df.if_nextents > 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:93:2: note: Taking true branch
           if (parent->i_df.if_nextents > 0)
           ^
   fs/xfs/scrub/parent.c:96:6: note: Assuming 'error' is not equal to 0
           if (error)
               ^~~~~
   fs/xfs/scrub/parent.c:96:2: note: Taking true branch
           if (error)
           ^
   fs/xfs/scrub/parent.c:97:3: note: Returning without writing to '*nlink'
                   return error;
                   ^
   fs/xfs/scrub/parent.c:215:10: note: Returning from 'xchk_parent_count_pa=
rent_dentries'
           error =3D xchk_parent_count_parent_dentries(sc, dp, &nlink);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:216:6: note: Assuming the condition is false
           if (!xchk_fblock_xref_process_error(sc, XFS_DATA_FORK, 0, &error=
))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:216:2: note: Taking false branch
           if (!xchk_fblock_xref_process_error(sc, XFS_DATA_FORK, 0, &error=
))
           ^
   fs/xfs/scrub/parent.c:222:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/scrub/parent.c:222:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/scrub/parent.c:231:19: note: Assuming field 'i_nlink' is not equa=
l to 0
           expected_nlink =3D VFS_I(sc->ip)->i_nlink =3D=3D 0 ? 0 : 1;
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:231:19: note: '?' condition is false
   fs/xfs/scrub/parent.c:235:6: note: Assuming the condition is false
           if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, 0, &error))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:235:2: note: Taking false branch
           if (!xchk_fblock_process_error(sc, XFS_DATA_FORK, 0, &error))
           ^
   fs/xfs/scrub/parent.c:239:6: note: Assuming 'dnum' is equal to field 'i_=
ino'
           if (dnum !=3D dp->i_ino) {
               ^~~~~~~~~~~~~~~~~
   fs/xfs/scrub/parent.c:239:2: note: Taking false branch
           if (dnum !=3D dp->i_ino) {
           ^
   fs/xfs/scrub/parent.c:250:12: note: The left operand of '!=3D' is a garb=
age value
           if (nlink !=3D expected_nlink)
               ~~~~~ ^
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> arch/arm/mach-imx/tzic.c:160:2: warning: Value stored to 'i' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           i =3D imx_readl(tzic_base + TZIC_INTCNTL);
           ^
   arch/arm/mach-imx/tzic.c:160:2: note: Value stored to 'i' is never read
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 with check filters).
   1 warning generated.
   lib/glob.c:48:32: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   lib/glob.c:48:32: note: Assigned value is garbage or undefined
           char const *back_pat =3D NULL, *back_str =3D back_str;
                                         ^          ~~~~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/pinctrl/samsung/pinctrl-samsung.c:1065:19: warning: Assigned val=
ue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   bank->eint_base =3D virt_base[0];
                                   ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1102:6: note: Assuming 'drvdat=
a' is non-null
           if (!drvdata)
               ^~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1102:2: note: Taking false bra=
nch
           if (!drvdata)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1105:9: note: Calling 'samsung=
_pinctrl_get_soc_data'
           ctrl =3D samsung_pinctrl_get_soc_data(drvdata, pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Calling 'samsung=
_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:6: note: Assuming 'id' is =
>=3D 0
           if (id < 0) {
               ^~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:991:2: note: Taking false bran=
ch
           if (id < 0) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:6: note: Assuming 'id' is =
< field 'num_ctrl'
           if (id >=3D of_data->num_ctrl) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:997:2: note: Taking false bran=
ch
           if (id >=3D of_data->num_ctrl) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1002:2: note: Returning pointe=
r, which participates in a condition later
           return &(of_data->ctrl[id]);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1019:9: note: Returning from '=
samsung_pinctrl_get_soc_data_for_of_alias'
           ctrl =3D samsung_pinctrl_get_soc_data_for_of_alias(pdev);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:6: note: Assuming 'ctrl' =
is non-null
           if (!ctrl)
               ^~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1020:2: note: Taking false bra=
nch
           if (!ctrl)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Calling 'devm_k=
calloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:232:9: note: Calling 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:224:2: note: Taking false branch
           if (unlikely(check_mul_overflow(n, size, &bytes)))
           ^
   include/linux/device.h:227:2: note: Returning pointer, which participate=
s in a condition later
--
           ^
   include/linux/device.h:227:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc(dev, bytes, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:232:9: note: Returning from 'devm_kmalloc_array'
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:232:2: note: Returning pointer, which participate=
s in a condition later
           return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1026:17: note: Returning from =
'devm_kcalloc'
           d->pin_banks =3D devm_kcalloc(&pdev->dev, d->nr_banks,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:6: note: Assuming field '=
pin_banks' is non-null
           if (!d->pin_banks)
               ^~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1028:2: note: Taking false bra=
nch
           if (!d->pin_banks)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:6: note: Assuming the con=
dition is false
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1031:2: note: Taking false bra=
nch
           if (ctrl->nr_ext_resources + 1 > SAMSUNG_PINCTRL_NUM_RESOURCES)
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:14: note: Assuming the co=
ndition is false
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1034:2: note: Loop condition i=
s false. Execution continues on line 1048
           for (i =3D 0; i < ctrl->nr_ext_resources + 1; i++) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:14: note: Assuming 'i' is=
 >=3D field 'nr_banks'
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/samsung/pinctrl-samsung.c:1050:2: note: Loop condition i=
s false. Execution continues on line 1073
           for (i =3D 0; i < ctrl->nr_banks; ++i, ++bdata, ++bank) {
           ^
   drivers/pinctrl/samsung/pinctrl-samsung.c:1073:15: note: Assigned value =
is garbage or undefined
           d->virt_base =3D virt_base[0];
                        ^ ~~~~~~~~~~~~
   1 warning generated.
   arch/arm/mach-omap2/prminst44xx.c:193:2: warning: Value stored to 'v' is=
 never read [clang-analyzer-deadcode.DeadStores]
           v =3D omap4_prminst_read_inst_reg(OMAP4430_PRM_PARTITION,
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-omap2/prminst44xx.c:193:2: note: Value stored to 'v' is ne=
ver read
           v =3D omap4_prminst_read_inst_reg(OMAP4430_PRM_PARTITION,
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   arch/arm/mach-omap2/vp.c:159:2: warning: Value stored to 'timeout' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           timeout =3D 0;
           ^         ~
   arch/arm/mach-omap2/vp.c:159:2: note: Value stored to 'timeout' is never=
 read
           timeout =3D 0;
           ^         ~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/phy/cadence/phy-cadence-torrent.c:778:25: warning: The result of=
 the left shift is undefined because the left operand is negative [clang-an=
alyzer-core.UndefinedBinaryOperatorResult]
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                                  ^
   drivers/phy/cadence/phy-cadence-torrent.c:902:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/phy/cadence/phy-cadence-torrent.c:902:2: note: Taking false bran=
ch
           if (ret) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:907:6: note: Assuming field 's=
et_lanes' is not equal to 0
           if (opts->dp.set_lanes) {
               ^~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:907:2: note: Taking true branch
           if (opts->dp.set_lanes) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:908:9: note: Calling 'cdns_tor=
rent_dp_set_lanes'
                   ret =3D cdns_torrent_dp_set_lanes(cdns_phy, &opts->dp);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:778:25: note: The result of th=
e left shift is undefined because the left operand is negative
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                     ~~~~~~~~~~~~ ^
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/pinctrl/pinctrl-st.c:582:4: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
                           ST_PINCONF_PACK_OE(*config);
                           ^
   drivers/pinctrl/pinctrl-st.c:138:34: note: expanded from macro 'ST_PINCO=
NF_PACK_OE'
   #define ST_PINCONF_PACK_OE(conf)        ST_PINCONF_PACK(conf, 1, OE)
                                           ^
   drivers/pinctrl/pinctrl-st.c:129:49: note: expanded from macro 'ST_PINCO=
NF_PACK'
   #define ST_PINCONF_PACK(conf, val, param)       (conf |=3D\
                                                         ^
   drivers/pinctrl/pinctrl-st.c:1013:6: note: 'function' is 0
           if (function)
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:1013:2: note: Taking false branch
           if (function)
           ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Left side of '&&' is false
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Taking false branch
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pinctrl/pinctrl-st.c:1018:30: note: Loop condition is false.  Ex=
iting loop
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                                       ^
   drivers/pinctrl/pinctrl-st.c:205:3: note: expanded from macro 'pc_to_ban=
k'
                   container_of(pc, struct st_gpio_bank, pc)
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pinctrl/pinctrl-st.c:1018:7: note: Calling 'st_gpio_get_directio=
n'
           oe =3D st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:739:2: note: 'config' declared without an i=
nitial value
           unsigned long config;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:746:13: note: Calling 'st_pctl_get_pin_func=
tion'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:440:6: note: Assuming 'alt' is non-null
           if (!alt)
               ^~~~
   drivers/pinctrl/pinctrl-st.c:440:2: note: Taking false branch
           if (!alt)
           ^
   drivers/pinctrl/pinctrl-st.c:445:2: note: Returning without writing to '=
pc->oe', which participates in a condition later
           return (val >> offset) & 0xf;
           ^
   drivers/pinctrl/pinctrl-st.c:746:13: note: Returning from 'st_pctl_get_p=
in_function'
           function =3D st_pctl_get_pin_function(&pc, offset);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:6: note: Assuming 'function' is not equ=
al to 0
           if (function) {
               ^~~~~~~~
   drivers/pinctrl/pinctrl-st.c:747:2: note: Taking true branch
           if (function) {
           ^
   drivers/pinctrl/pinctrl-st.c:748:3: note: Calling 'st_pinconf_get_direct=
ion'
                   st_pinconf_get_direction(&pc, offset, &config);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-st.c:579:6: note: Assuming field 'oe' is non-null
           if (pc->oe) {
               ^~~~~~
   drivers/pinctrl/pinctrl-st.c:579:2: note: Taking true branch
           if (pc->oe) {
--
                   ^
   fs/jfs/jfs_logmgr.c:762:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry(tblk, &log->cqueue, cqueue) {
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
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/jfs/jfs_logmgr.c:762:2: note: Loop condition is false. Execution cont=
inues on line 771
           list_for_each_entry(tblk, &log->cqueue, cqueue) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   fs/jfs/jfs_logmgr.c:771:2: note: Null pointer value stored to 'tblk'
           tblk =3D xtblk;           /* last tblk of the page */
           ^~~~~~~~~~~~
   fs/jfs/jfs_logmgr.c:776:23: note: Access to field 'bp' results in a dere=
ference of a null pointer (loaded from variable 'tblk')
           bp =3D (struct lbuf *) tblk->bp;
                                ^~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:624:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: warning: Value stor=
ed to 'no_c' is never read [clang-analyzer-deadcode.DeadStores]
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:742:3: note: Value stored =
to 'no_c' is never read
                   no_c =3D 1 << no_c;
                   ^      ~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: warning: Value sto=
red to 'tmdsclock' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:778:16: note: Value stored=
 to 'tmdsclock' during its initialization is never read
           unsigned long tmdsclock =3D inno_hdmi_phy_get_tmdsclk(inno, rate=
);
                         ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   4 warnings generated.
>> drivers/bus/omap_l3_noc.c:96:3: warning: Value stored to 'err_descriptio=
n' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:96:3: note: Value stored to 'err_description' =
is never read
                   err_description =3D "Standard";
                   ^                 ~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: warning: Value stored to 'err_descripti=
on' is never read [clang-analyzer-deadcode.DeadStores]
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
   drivers/bus/omap_l3_noc.c:107:3: note: Value stored to 'err_description'=
 is never read
                   err_description =3D "Custom";
                   ^                 ~~~~~~~~
>> drivers/bus/omap_l3_noc.c:127:4: warning: Value stored to 'master_name' =
is never read [clang-analyzer-deadcode.DeadStores]
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
   drivers/bus/omap_l3_noc.c:127:4: note: Value stored to 'master_name' is =
never read
                           master_name =3D master->name;
                           ^             ~~~~~~~~~~~~
>> drivers/bus/omap_l3_noc.c:132:2: warning: Value stored to 'op_code' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           op_code =3D readl_relaxed(l3_targ_hdr) & 0x7;
           ^
   drivers/bus/omap_l3_noc.c:132:2: note: Value stored to 'op_code' is neve=
r read
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (13 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (13 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   include/linux/math64.h:91:15: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:240:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                                         ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:230:6: note: Assuming field 'fla=
gs' is not equal to 0
           if (c->flags =3D=3D 0) {
               ^~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:230:2: note: Taking false branch
           if (c->flags =3D=3D 0) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:236:6: note: Assuming 'parent_ra=
te' is equal to field 'parent_rate'
           if (parent_rate !=3D c->parent_rate) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:236:2: note: Taking false branch
           if (parent_rate !=3D c->parent_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:247:6: note: Assuming 'target_ra=
te' is not equal to 'parent_rate'
           if (target_rate =3D=3D parent_rate) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:247:2: note: Taking false branch
           if (target_rate =3D=3D parent_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:255:9: note: Calling '__wrpll_ca=
lc_divq'
           divq =3D __wrpll_calc_divq(target_rate, &target_vco_rate);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:149:7: note: 'vco_rate' is non-n=
ull
           if (!vco_rate) {
                ^~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:149:2: note: Taking false branch
           if (!vco_rate) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:155:6: note: Assuming 's' is <=
=3D 1
           if (s <=3D 1) {
               ^~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:155:2: note: Taking true branch
           if (s <=3D 1) {
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:167:2: note: Returning the value=
 1 (loaded from 'divq'), which participates in a condition later
           return divq;
           ^~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:255:9: note: Returning from '__w=
rpll_calc_divq'
           divq =3D __wrpll_calc_divq(target_rate, &target_vco_rate);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:256:7: note: 'divq' is 1
           if (!divq)
                ^~~~
   drivers/clk/analogbits/wrpll-cln28hpc.c:256:2: note: Taking false branch
           if (!divq)
           ^
   drivers/clk/analogbits/wrpll-cln28hpc.c:264:2: note: The value 0 is assi=
gned to 'best_r'
           best_r =3D 0;
           ^~~~~~~~~~
--
           if (retval) {
           ^
   fs/reiserfs/namei.c:1417:6: note: Assuming the condition is true
           if (retval =3D=3D -EEXIST) {
               ^~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1417:2: note: Taking true branch
           if (retval =3D=3D -EEXIST) {
           ^
   fs/reiserfs/namei.c:1418:7: note: Assuming 'new_dentry_inode' is non-null
                   if (!new_dentry_inode) {
                       ^~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1418:3: note: Taking false branch
                   if (!new_dentry_inode) {
                   ^
   fs/reiserfs/namei.c:1437:6: note: 'new_dentry_inode' is non-null
           if (new_dentry_inode)
               ^~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1437:2: note: Taking true branch
           if (new_dentry_inode)
           ^
   fs/reiserfs/namei.c:1440:2: note: Loop condition is true.  Entering loop=
 body
           while (1) {
           ^
   fs/reiserfs/namei.c:1445:3: note: Taking false branch
                   if ((retval =3D
                   ^
   fs/reiserfs/namei.c:1471:7: note: 'retval' is equal to NAME_FOUND_INVISI=
BLE
                   if (retval !=3D NAME_FOUND_INVISIBLE && retval !=3D NAME=
_FOUND) {
                       ^~~~~~
   fs/reiserfs/namei.c:1471:38: note: Left side of '&&' is false
                   if (retval !=3D NAME_FOUND_INVISIBLE && retval !=3D NAME=
_FOUND) {
                                                      ^
   fs/reiserfs/namei.c:1483:7: note: Assuming the condition is true
                   if (S_ISDIR(old_inode->i_mode)) {
                       ^
   include/uapi/linux/stat.h:23:21: note: expanded from macro 'S_ISDIR'
   #define S_ISDIR(m)      (((m) & S_IFMT) =3D=3D S_IFDIR)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:1483:3: note: Taking true branch
                   if (S_ISDIR(old_inode->i_mode)) {
                   ^
   fs/reiserfs/namei.c:1485:9: note: Calling 'search_by_entry_key'
                                search_by_entry_key(new_dir->i_sb,
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:126:2: note: Control jumps to 'case 1:'  at line 136
           switch (retval) {
           ^
   fs/reiserfs/namei.c:137:3: note:  Execution continues on line 148
                   break;
                   ^
   fs/reiserfs/namei.c:148:2: note: Calling 'set_de_item_location'
           set_de_item_location(de, path);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:67:1: note: Returning without writing to 'de->de_ent=
ry_key.on_disk_key.k_offset'
   }
   ^
   fs/reiserfs/namei.c:148:2: note: Returning from 'set_de_item_location'
           set_de_item_location(de, path);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/namei.c:164:38: note: Calling 'cpu_key_k_offset'
           retval =3D bin_search_in_dir_item(de, cpu_key_k_offset(key));
                                               ^~~~~~~~~~~~~~~~~~~~~
   fs/reiserfs/reiserfs.h:1586:2: note: Undefined or garbage value returned=
 to caller
           return key->on_disk_key.k_offset;
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clk/tegra/clk-tegra-super-gen4.c:141:3: warning: Value stored to=
 'clk' is never read [clang-analyzer-deadcode.DeadStores]
                   clk =3D clk_register_divider(NULL, "hclk_div", "sclk", 0,
                   ^
   drivers/clk/tegra/clk-tegra-super-gen4.c:141:3: note: Value stored to 'c=
lk' is never read
   drivers/clk/tegra/clk-tegra-super-gen4.c:156:2: warning: Value stored to=
 'clk' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_divider(NULL, "pclk_div", "hclk", 0,
           ^
   drivers/clk/tegra/clk-tegra-super-gen4.c:156:2: note: Value stored to 'c=
lk' is never read
   4 warnings generated.
   drivers/clk/tegra/clk-tegra114.c:910:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:910:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:934:2: note: Value stored to 'clk' is n=
ever read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: warning: Value stored to 'clk' i=
s never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:943:2: note: Value stored to 'clk' is n=
ever read
           clk =3D clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra114.c:1049:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
           ^
   drivers/clk/tegra/clk-tegra114.c:1049:2: note: Value stored to 'clk' is =
never read
   2 warnings generated.
>> drivers/clk/tegra/clk-tegra124.c:1098:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1098:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_c_out1_div", "pll_c",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: warning: Value stored to 'clk' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/tegra/clk-tegra124.c:1132:2: note: Value stored to 'clk' is =
never read
           clk =3D tegra_clk_register_divider("pll_m_out1_div", "pll_m",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/clk/ti/clk.c:150:3: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buf, c->node_name);
                   ^~~~~~
   drivers/clk/ti/clk.c:150:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy(buf, c->node_name);
                   ^~~~~~
   drivers/clk/ti/clk.c:581:2: warning: Undefined or garbage value returned=
 to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/clk/ti/clk.c:572:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   drivers/clk/ti/clk.c:575:2: note: Left side of '&&' is false
           list_for_each_entry(hw, &clk_hw_omap_clocks, node) {
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ti/clk.c:575:2: note: Taking false branch
           list_for_each_entry(hw, &clk_hw_omap_clocks, node) {
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
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/ti/clk.c:575:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry(hw, &clk_hw_omap_clocks, node) {
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
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/ti/clk.c:575:2: note: Loop condition is false. Execution con=
tinues on line 581
           list_for_each_entry(hw, &clk_hw_omap_clocks, node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/clk/ti/clk.c:581:2: note: Undefined or garbage value returned to=
 caller
           return ret;
           ^      ~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   kernel/workqueue.c:1717:2: note: Taking true branch
           if (likely(ret >=3D 0)) {
           ^
   kernel/workqueue.c:1718:29: note: Passing value via 2nd parameter 'wq'
                   __queue_delayed_work(cpu, wq, dwork, delay);
                                             ^~
   kernel/workqueue.c:1718:3: note: Calling '__queue_delayed_work'
                   __queue_delayed_work(cpu, wq, dwork, delay);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/workqueue.c:1632:15: note: Assuming 'wq' is null
           WARN_ON_ONCE(!wq);
                        ^
   include/asm-generic/bug.h:201:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   kernel/workqueue.c:1633:2: note: Assuming '__ret_warn_on' is not equal t=
o 0
           WARN_ON_ONCE(timer->function !=3D delayed_work_timer_fn);
           ^
   include/asm-generic/bug.h:201:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:189:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/workqueue.c:1635:2: note: Assuming '__ret_warn_on' is not equal t=
o 0
           WARN_ON_ONCE(!list_empty(&work->entry));
           ^
   include/asm-generic/bug.h:201:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:189:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/workqueue.c:1643:6: note: Assuming 'delay' is 0
           if (!delay) {
               ^~~~~~
   kernel/workqueue.c:1643:2: note: Taking true branch
           if (!delay) {
           ^
   kernel/workqueue.c:1644:21: note: Passing null pointer value via 2nd par=
ameter 'wq'
                   __queue_work(cpu, wq, &dwork->work);
                                     ^~
   kernel/workqueue.c:1644:3: note: Calling '__queue_work'
                   __queue_work(cpu, wq, &dwork->work);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/workqueue.c:1413:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_irqs_disabled();
           ^
   include/linux/lockdep.h:619:41: note: expanded from macro 'lockdep_asser=
t_irqs_disabled'
   # define lockdep_assert_irqs_disabled() do { } while (0)
                                           ^
   kernel/workqueue.c:1418:15: note: Access to field 'flags' results in a d=
ereference of a null pointer (loaded from variable 'wq')
           if (unlikely(wq->flags & __WQ_DRAINING) &&
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/workqueue.c:2602:14: warning: Value stored to 'target_func' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           work_func_t target_func =3D target_work ? target_work->func : NU=
LL;
                       ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/workqueue.c:2602:14: note: Value stored to 'target_func' during i=
ts initialization is never read
           work_func_t target_func =3D target_work ? target_work->func : NU=
LL;
                       ^~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/imx/clk-imx6q.c:251:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-imx6q.c:251:2: note: Value stored to 'ret' is never =
read
           ret =3D of_parse_phandle_with_args(node, "assigned-clock-parents=
",
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/clk/ingenic/cgu.c:484:10: warning: Division by zero [clang-analy=
zer-core.DivideZero]
                   rate =3D DIV_ROUND_UP(parent_rate, div);
                          ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ingenic/cgu.c:474:36: note: Left side of '&&' is false
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:206:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ingenic/cgu.c:474:36: note: Taking false branch
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:206:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/ingenic/cgu.c:474:36: note: Loop condition is false.  Exitin=
g loop
           struct ingenic_clk *ingenic_clk =3D to_ingenic_clk(hw);
                                             ^
   drivers/clk/ingenic/cgu.h:206:29: note: expanded from macro 'to_ingenic_=
clk'
   #define to_ingenic_clk(_hw) container_of(_hw, struct ingenic_clk, hw)
                               ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/ingenic/cgu.c:482:6: note: Assuming the condition is true
           if (clk_info->type & CGU_CLK_DIV) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:482:2: note: Taking true branch
           if (clk_info->type & CGU_CLK_DIV) {
           ^
   drivers/clk/ingenic/cgu.c:483:9: note: Calling 'ingenic_clk_calc_div'
                   div =3D ingenic_clk_calc_div(clk_info, parent_rate, req_=
rate);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/clk/ingenic/cgu.c:421:6: note: Assuming field 'div_table' is non=
-null
           if (clk_info->div.div_table) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:421:2: note: Taking true branch
           if (clk_info->div.div_table) {
           ^
   drivers/clk/ingenic/cgu.c:422:12: note: Calling 'ingenic_clk_calc_hw_div'
                   hw_div =3D ingenic_clk_calc_hw_div(clk_info, div);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:395:18: note: 'best_i' initialized to 0
           unsigned int i, best_i =3D 0, best =3D (unsigned int)-1;
                           ^~~~~~
   drivers/clk/ingenic/cgu.c:397:14: note: Assuming the condition is true
           for (i =3D 0; i < (1 << clk_info->div.bits)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:397:14: note: Left side of '&&' is true
   drivers/clk/ingenic/cgu.c:397:2: note: Loop condition is false. Executio=
n continues on line 409
           for (i =3D 0; i < (1 << clk_info->div.bits)
           ^
   drivers/clk/ingenic/cgu.c:409:2: note: Returning zero (loaded from 'best=
_i')
           return best_i;
           ^~~~~~~~~~~~~
   drivers/clk/ingenic/cgu.c:422:12: note: Returning from 'ingenic_clk_calc=
_hw_div'
--
   drivers/gpu/drm/ttm/ttm_bo_util.c:57:3: note: Returning zero, which part=
icipates in a condition later
                   return 0;
                   ^~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:83:8: note: Returning from 'ttm_mem_io=
_reserve'
           ret =3D ttm_mem_io_reserve(bdev, mem);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:6: note: 'ret' is 0
           if (ret || !mem->bus.is_iomem)
               ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:6: note: Left side of '||' is false
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:23: note: Field 'is_iomem' is false
           if (ret || !mem->bus.is_iomem)
                                ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:84:2: note: Taking true branch
           if (ret || !mem->bus.is_iomem)
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:85:3: note: Returning zero (loaded fro=
m 'ret'), which participates in a condition later
                   return ret;
                   ^~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:192:8: note: Returning from 'ttm_resou=
rce_ioremap'
           ret =3D ttm_resource_ioremap(bdev, new_mem, &new_iomap);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:193:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:193:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:199:6: note: 'old_iomap' is not equal =
to NULL
           if (old_iomap =3D=3D NULL && new_iomap =3D=3D NULL)
               ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:199:24: note: Left side of '&&' is fal=
se
           if (old_iomap =3D=3D NULL && new_iomap =3D=3D NULL)
                                 ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:205:6: note: 'old_iomap' is not equal =
to NULL
           if (old_iomap =3D=3D NULL &&
               ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:205:24: note: Left side of '&&' is fal=
se
           if (old_iomap =3D=3D NULL &&
                                 ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:215:6: note: Assuming 'ttm' is null
           if (ttm) {
               ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:215:2: note: Taking false branch
           if (ttm) {
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:221:14: note: Assuming 'i' is < field =
'num_pages'
           for (i =3D 0; i < new_mem->num_pages; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:221:2: note: Loop condition is true.  =
Entering loop body
           for (i =3D 0; i < new_mem->num_pages; ++i) {
           ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:222:7: note: 'old_iomap' is not equal =
to NULL
                   if (old_iomap =3D=3D NULL) {
                       ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:222:3: note: Taking false branch
                   if (old_iomap =3D=3D NULL) {
                   ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:226:14: note: 'new_iomap' is equal to =
NULL
                   } else if (new_iomap =3D=3D NULL) {
                              ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:226:10: note: Taking true branch
                   } else if (new_iomap =3D=3D NULL) {
                          ^
   drivers/gpu/drm/ttm/ttm_bo_util.c:228:31: note: Passing null pointer val=
ue via 1st parameter 'ttm'
                           ret =3D ttm_copy_io_ttm_page(ttm, old_iomap, i,
                                                      ^~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:228:10: note: Calling 'ttm_copy_io_ttm=
_page'
                           ret =3D ttm_copy_io_ttm_page(ttm, old_iomap, i,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_bo_util.c:131:19: note: Access to field 'pages' =
results in a dereference of a null pointer (loaded from variable 'ttm')
           struct page *d =3D ttm->pages[page];
                            ^~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-v3-semi.c:604:6: warning: Value stored to 'pc=
i_end' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-v3-semi.c:604:6: note: Value stored to 'pci_e=
nd' during its initialization is never read
           u64 pci_end =3D cpu_end - entry->offset;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/controller/pci-versatile.c:37:10: warning: Although the valu=
e stored to 'retval' is used in the enclosing expression, the value is neve=
r actually read from 'retval' [clang-analyzer-deadcode.DeadStores]
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pci-versatile.c:37:10: note: Although the value s=
tored to 'retval' is used in the enclosing expression, the value is never a=
ctually read from 'retval'
           while ((retval =3D get_option(&str, &slot))) {
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/pci/controller/pcie-iproc.c:861:17: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:861:17: note: Value stored to 'dev' =
during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   drivers/pci/controller/pcie-iproc.c:1065:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D pcie->dev;
                          ^~~   ~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (14 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/host1x/job.c:182:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:596:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:116:14: note: Assuming 'i' is < field 'num_relo=
cs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:116:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:118:14: note: 'phys_addr' declared without an i=
nitial value
                   dma_addr_t phys_addr, *phys;
                              ^~~~~~~~~
   drivers/gpu/host1x/job.c:122:7: note: Assuming field 'bo' is non-null
                   if (!reloc->target.bo) {
                       ^~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:122:3: note: Taking false branch
                   if (!reloc->target.bo) {
                   ^
   drivers/gpu/host1x/job.c:139:7: note: Assuming 'domain' is non-null
                   if (!domain || client->group)
                       ^~~~~~~
   drivers/gpu/host1x/job.c:139:7: note: Left side of '||' is false
   drivers/gpu/host1x/job.c:139:18: note: Assuming field 'group' is null
                   if (!domain || client->group)
                                  ^~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:139:3: note: Taking false branch
                   if (!domain || client->group)
                   ^
   drivers/gpu/host1x/job.c:145:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
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
   drivers/gpu/host1x/job.c:145:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   drivers/gpu/host1x/job.c:145:3: note: Taking false branch
                   if (IS_ERR(sgt)) {
                   ^
   drivers/gpu/host1x/job.c:150:7: note: Assuming 'sgt' is null
                   if (sgt) {
                       ^~~
   drivers/gpu/host1x/job.c:150:3: note: Taking false branch
                   if (sgt) {
                   ^
   drivers/gpu/host1x/job.c:182:35: note: Assigned value is garbage or unde=
fined
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^ ~~~~~~~~~
   drivers/gpu/host1x/job.c:262:35: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^
   drivers/gpu/host1x/job.c:596:8: note: Calling 'pin_job'
           err =3D pin_job(host, job);
                 ^~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:116:14: note: Assuming 'i' is >=3D field 'num_r=
elocs'
           for (i =3D 0; i < job->num_relocs; i++) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:116:2: note: Loop condition is false. Execution=
 continues on line 192
           for (i =3D 0; i < job->num_relocs; i++) {
           ^
   drivers/gpu/host1x/job.c:192:2: note: Taking false branch
           if (IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL))
           ^
   drivers/gpu/host1x/job.c:195:14: note: Assuming 'i' is < field 'num_gath=
ers'
           for (i =3D 0; i < job->num_gathers; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:195:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < job->num_gathers; i++) {
           ^
   drivers/gpu/host1x/job.c:199:3: note: 'phys_addr' declared without an in=
itial value
                   dma_addr_t phys_addr;
                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:207:7: note: Assuming field 'bo' is non-null
                   if (!g->bo) {
                       ^~~~~~
   drivers/gpu/host1x/job.c:207:3: note: Taking false branch
                   if (!g->bo) {
                   ^
   drivers/gpu/host1x/job.c:217:7: note: Assuming the condition is false
                   if (!iommu_get_domain_for_dev(host->dev))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/job.c:217:3: note: Taking false branch
                   if (!iommu_get_domain_for_dev(host->dev))
                   ^
   drivers/gpu/host1x/job.c:223:7: note: Calling 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
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
   drivers/gpu/host1x/job.c:223:7: note: Returning from 'IS_ERR'
                   if (IS_ERR(sgt)) {
                       ^~~~~~~~~~~
   drivers/gpu/host1x/job.c:223:3: note: Taking false branch
                   if (IS_ERR(sgt)) {
                   ^
   drivers/gpu/host1x/job.c:228:7: note: Assuming field 'domain' is null
                   if (host->domain) {
                       ^~~~~~~~~~~~
   drivers/gpu/host1x/job.c:228:3: note: Taking false branch
                   if (host->domain) {
                   ^
   drivers/gpu/host1x/job.c:252:14: note: Assuming 'sgt' is null
                   } else if (sgt) {
                              ^~~
   drivers/gpu/host1x/job.c:252:10: note: Taking false branch
                   } else if (sgt) {
                          ^
   drivers/gpu/host1x/job.c:262:35: note: Assigned value is garbage or unde=
fined
                   job->addr_phys[job->num_unpins] =3D phys_addr;
                                                   ^ ~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/clk/ti/clockdomain.c:115:2: warning: Value stored to 'clk_name' =
is never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clockdomain.c:115:2: note: Value stored to 'clk_name' is =
never read
           clk_name =3D __clk_get_name(hw->clk);
           ^          ~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/clk/ti/divider.c:240:9: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           return DIV_ROUND_UP(*prate, div);
                  ^
   include/linux/math.h:36:22: note: expanded from macro 'DIV_ROUND_UP'
   #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
                        ^
   include/uapi/linux/const.h:34:54: note: expanded from macro '__KERNEL_DI=
V_ROUND_UP'
   #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
                                        ~~~~~~~~~~~~~~~~^~~~~
   drivers/clk/ti/divider.c:238:8: note: Calling 'ti_clk_divider_bestdiv'
           div =3D ti_clk_divider_bestdiv(hw, rate, prate);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:179:37: note: Left side of '&&' is false
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/clk/ti/divider.c:179:37: note: Taking false branch
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/clk/ti/divider.c:179:37: note: Loop condition is false.  Exiting=
 loop
           struct clk_omap_divider *divider =3D to_clk_omap_divider(hw);
                                              ^
   drivers/clk/ti/clock.h:32:34: note: expanded from macro 'to_clk_omap_div=
ider'
   #define to_clk_omap_divider(_hw) container_of(_hw, struct clk_omap_divid=
er, hw)
                                    ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/clk/ti/divider.c:184:6: note: Assuming 'rate' is not equal to 0
           if (!rate)
               ^~~~~
   drivers/clk/ti/divider.c:184:2: note: Taking false branch
           if (!rate)
           ^
   drivers/clk/ti/divider.c:189:6: note: Assuming the condition is false
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/divider.c:189:2: note: Taking false branch
           if (!(clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT)) {
           ^
   drivers/clk/ti/divider.c:201:11: note: Assuming '__UNIQUE_ID___x112' is =
>=3D '__UNIQUE_ID___y113'
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/clk/ti/divider.c:201:11: note: '?' condition is false
           maxdiv =3D min(ULONG_MAX / rate, maxdiv);
                    ^
   include/linux/minmax.h:51:19: note: expanded from macro 'min'
--
   drivers/clk/sifive/sifive-prci.c:406:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:406:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);   /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:427:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:427:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:448:2: warning: Value stored to 'r' is =
never read [clang-analyzer-deadcode.DeadStores]
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/sifive/sifive-prci.c:448:2: note: Value stored to 'r' is nev=
er read
           r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET); /* barrier */
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   fs/sysv/dir.c:339:2: warning: Value stored to 'err' is never read [clang=
-analyzer-deadcode.DeadStores]
           err =3D dir_commit_chunk(page, pos, SYSV_DIRSIZE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/sysv/dir.c:339:2: note: Value stored to 'err' is never read
           err =3D dir_commit_chunk(page, pos, SYSV_DIRSIZE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/clk/spear/spear1310_clock.c:872:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:872:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_30m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:879:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_48m_fixed_clk", "pll5=
_clk", 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:896:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_plclk0_clk", NULL, 0,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: warning: Value stored to 'clk=
' is never read [clang-analyzer-deadcode.DeadStores]
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/clk/spear/spear1310_clock.c:899:2: note: Value stored to 'clk' i=
s never read
           clk =3D clk_register_fixed_rate(NULL, "ras_tx50_clk", NULL, 0, 5=
0000000);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/drm_ioctl.c:163:25: warning: Null pointer passed as 1st =
argument to string length function [clang-analyzer-unix.cstring.NullArg]
                           master->unique_len =3D strlen(dev->unique);
                                                ^
   drivers/gpu/drm/drm_ioctl.c:388:2: note: Value assigned to field 'unique'
           mutex_lock(&dev->master_mutex);
           ^
   include/linux/mutex.h:167:26: note: expanded from macro 'mutex_lock'
   #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:389:6: note: Assuming the condition is true
           if (sv->drm_di_major !=3D -1) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:389:2: note: Taking true branch
           if (sv->drm_di_major !=3D -1) {
           ^
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Assuming field 'drm_di_major' i=
s equal to DRM_IF_MAJOR
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Left side of '||' is false
   drivers/gpu/drm/drm_ioctl.c:391:7: note: Assuming field 'drm_di_minor' i=
s >=3D 0
                       sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MI=
NOR) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:390:7: note: Left side of '||' is false
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                       ^
   drivers/gpu/drm/drm_ioctl.c:391:31: note: Assuming field 'drm_di_minor' =
is <=3D DRM_IF_MINOR
                       sv->drm_di_minor < 0 || sv->drm_di_minor > DRM_IF_MI=
NOR) {
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/drm_ioctl.c:390:3: note: Taking false branch
                   if (sv->drm_di_major !=3D DRM_IF_MAJOR ||
                   ^
   drivers/gpu/drm/drm_ioctl.c:397:21: note: Assuming '__UNIQUE_ID___x267' =
is <=3D '__UNIQUE_ID___y268'
                   dev->if_version =3D max(if_version, dev->if_version);
                                     ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:397:21: note: '?' condition is false
                   dev->if_version =3D max(if_version, dev->if_version);
                                     ^
   include/linux/minmax.h:58:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^
   include/linux/minmax.h:44:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:39:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:34:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/gpu/drm/drm_ioctl.c:398:7: note: Assuming field 'drm_di_minor' i=
s >=3D 1
                   if (sv->drm_di_minor >=3D 1) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:398:3: note: Taking true branch
                   if (sv->drm_di_minor >=3D 1) {
                   ^
   drivers/gpu/drm/drm_ioctl.c:403:14: note: Calling 'drm_set_busid'
                           retcode =3D drm_set_busid(dev, file_priv);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_ioctl.c:150:6: note: Assuming field 'unique' is equa=
l to NULL
           if (master->unique !=3D NULL)
--
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:288:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1357:9: note: Left side of=
 '||' is true
           return atomic_read(&adev->in_gpu_reset);
                  ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:289:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1357:9: note: Taking false=
 branch
           return atomic_read(&adev->in_gpu_reset);
                  ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1357:9: note: Loop conditi=
on is false.  Exiting loop
           return atomic_read(&adev->in_gpu_reset);
                  ^
   arch/arm/include/asm/atomic.h:25:24: note: expanded from macro 'atomic_r=
ead'
   #define atomic_read(v)  READ_ONCE((v)->counter)
                           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1357:2: note: Returning ze=
ro, which participates in a condition later
           return atomic_read(&adev->in_gpu_reset);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:464:6: note: Returning from=
 'amdgpu_in_reset'
           if (amdgpu_in_reset(adev))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:464:2: note: Taking false b=
ranch
           if (amdgpu_in_reset(adev))
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:468:6: note: Assuming 'ret'=
 is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:468:2: note: Taking false b=
ranch
           if (ret < 0) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:473:6: note: Assuming the c=
ondition is false
           if (is_support_sw_smu(adev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:473:2: note: Taking false b=
ranch
           if (is_support_sw_smu(adev)) {
           ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:478:13: note: Assuming fiel=
d 'get_current_power_state' is null
           } else if (adev->powerplay.pp_funcs->get_current_power_state
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:479:4: note: Left side of '=
&&' is false
                    && adev->powerplay.pp_funcs->get_pp_num_states) {
                    ^
   drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:487:16: note: The right ope=
rand of '<' is a garbage value
           for (i =3D 0; i < data.nums; i++) {
                         ^ ~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: warning: Value stored to =
'temp' is never read [clang-analyzer-deadcode.DeadStores]
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c:243:3: note: Value stored to 'te=
mp' is never read
                   temp =3D hdmi_read_reg(core->base, HDMI_CEC_INT_STATUS_1=
);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:234:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: warning: Value stored to 'de=
v' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_crtc.c:253:21: note: Value stored to 'dev' =
during its initialization is never read
           struct drm_device *dev =3D omap_crtc->base.dev;
                              ^~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/omapdrm/omap_encoder.c:104:16: warning: Access to field =
'bridge' results in a dereference of a null pointer (loaded from variable '=
output') [clang-analyzer-core.NullDereference]
           for (bridge =3D output->bridge; bridge;
                         ^~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Left side of '&&' is=
 false
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Taking false branch
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:76:38: note: Loop condition is fa=
lse.  Exiting loop
           struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
                                               ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:20:28: note: expanded from macro =
'to_omap_encoder'
   #define to_omap_encoder(x) container_of(x, struct omap_encoder, base)
                              ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:77:2: note: 'output' initialized =
here
           struct omap_dss_device *output =3D omap_encoder->output;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Left side of '&&' is =
false
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
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
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/omapdrm/omap_encoder.c:85:2: note: Taking false branch
           list_for_each_entry(connector, &dev->mode_config.connector_list,=
 head) {
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
--
   drivers/gpu/drm/drm_crtc.c:597:30: note: Assuming the condition is false
           if (crtc_req->mode_valid && !drm_lease_held(file_priv, plane->ba=
se.id))
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/drm_crtc.c:597:2: note: Taking false branch
           if (crtc_req->mode_valid && !drm_lease_held(file_priv, plane->ba=
se.id))
           ^
   drivers/gpu/drm/drm_crtc.c:600:2: note: Taking false branch
           DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
           ^
   include/drm/drm_modeset_lock.h:167:2: note: expanded from macro 'DRM_MOD=
ESET_LOCK_ALL_BEGIN'
           if (!drm_drv_uses_atomic_modeset(dev))                          \
           ^
   drivers/gpu/drm/drm_crtc.c:601:43: note: Assuming 'ret' is 0
                                      DRM_MODESET_ACQUIRE_INTERRUPTIBLE, re=
t);
                                                                         ^
   include/drm/drm_modeset_lock.h:172:6: note: expanded from macro 'DRM_MOD=
ESET_LOCK_ALL_BEGIN'
           if (ret)                                                        \
               ^~~
   drivers/gpu/drm/drm_crtc.c:600:2: note: Taking false branch
           DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx,
           ^
   include/drm/drm_modeset_lock.h:172:2: note: expanded from macro 'DRM_MOD=
ESET_LOCK_ALL_BEGIN'
           if (ret)                                                        \
           ^
   drivers/gpu/drm/drm_crtc.c:603:16: note: Field 'mode_valid' is not equal=
 to 0
           if (crtc_req->mode_valid) {
                         ^
   drivers/gpu/drm/drm_crtc.c:603:2: note: Taking true branch
           if (crtc_req->mode_valid) {
           ^
   drivers/gpu/drm/drm_crtc.c:606:7: note: Assuming the condition is true
                   if (crtc_req->fb_id =3D=3D -1) {
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:606:3: note: Taking true branch
                   if (crtc_req->fb_id =3D=3D -1) {
                   ^
   drivers/gpu/drm/drm_crtc.c:609:8: note: Assuming field 'state' is null
                           if (plane->state)
                               ^~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:609:4: note: Taking false branch
                           if (plane->state)
                           ^
   drivers/gpu/drm/drm_crtc.c:614:8: note: Assuming 'old_fb' is non-null
                           if (!old_fb) {
                               ^~~~~~~
   drivers/gpu/drm/drm_crtc.c:614:4: note: Taking false branch
                           if (!old_fb) {
                           ^
   drivers/gpu/drm/drm_crtc.c:634:7: note: Assuming 'mode' is non-null
                   if (!mode) {
                       ^~~~~
   drivers/gpu/drm/drm_crtc.c:634:3: note: Taking false branch
                   if (!mode) {
                   ^
   drivers/gpu/drm/drm_crtc.c:638:7: note: Assuming field 'aspect_ratio_all=
owed' is true
                   if (!file_priv->aspect_ratio_allowed &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:638:40: note: Left side of '&&' is false
                   if (!file_priv->aspect_ratio_allowed &&
                                                        ^
   drivers/gpu/drm/drm_crtc.c:647:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   drivers/gpu/drm/drm_crtc.c:647:3: note: Taking false branch
                   if (ret) {
                   ^
   drivers/gpu/drm/drm_crtc.c:661:7: note: Assuming field 'format_default' =
is true
                   if (!plane->format_default) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:661:3: note: Taking false branch
                   if (!plane->format_default) {
                   ^
   drivers/gpu/drm/drm_crtc.c:676:9: note: Calling 'drm_crtc_check_viewport'
                   ret =3D drm_crtc_check_viewport(crtc, crtc_req->x, crtc_=
req->y,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/gpu/drm/drm_crtc.c:538:6: note: Assuming field 'state' is non-nu=
ll
           if (crtc->state &&
               ^~~~~~~~~~~
   drivers/gpu/drm/drm_crtc.c:538:6: note: Left side of '&&' is true
   drivers/gpu/drm/drm_crtc.c:539:29: note: Access to field 'rotation' resu=
lts in a dereference of a null pointer (loaded from field 'state')
               drm_rotation_90_or_270(crtc->primary->state->rotation))
                                      ^              ~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:183:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, str);
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: warning: Call to function=
 'strcat' is insecure as it does not provide bounding of the memory buffer.=
 Replace unbounded copy functions with analogous functions that support len=
gth arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureA=
PI.strcpy]
                           strcat(found, ", ");
                           ^~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed.c:184:4: note: Call to function 's=
trcat' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcat'. CWE-119
                           strcat(found, ", ");
                           ^~~~~~
   1 warning generated.
>> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: warning: Value stored=
 to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2660:5: note: Value stored to=
 'ret' is never read
                                   ret =3D regmap_update_bits(ctx->maps[des=
c->ip],
                                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   fs/ntfs/compress.c:164:6: warning: Value stored to 'cb_sb_start' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:164:6: note: Value stored to 'cb_sb_start' during its=
 initialization is never read
           u8 *cb_sb_start =3D cb;   /* Beginning of the current sb in the =
cb. */
               ^~~~~~~~~~~   ~~
   fs/ntfs/compress.c:810:4: warning: Value stored to 'cb_pos' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   fs/ntfs/compress.c:810:4: note: Value stored to 'cb_pos' is never read
                           cb_pos +=3D cb_max_ofs - cur_ofs;
                           ^         ~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/sti/sti_hqvdp.c:741:6: warning: Division by zero [clang-=
analyzer-core.DivideZero]
           lfw /=3D max(src_w, dst_w) * mode->clock / 1000;
               ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Left side of '&&' is false
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Taking false branch
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1022:28: note: Loop condition is false. =
 Exiting loop
           struct sti_plane *plane =3D to_sti_plane(drm_plane);
                                     ^
   drivers/gpu/drm/sti/sti_plane.h:13:25: note: expanded from macro 'to_sti=
_plane'
   #define to_sti_plane(x) container_of(x, struct sti_plane, drm_plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Left side of '&&' is false
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Taking false branch
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/gpu/drm/sti/sti_hqvdp.c:1023:28: note: Loop condition is false. =
 Exiting loop
           struct sti_hqvdp *hqvdp =3D to_sti_hqvdp(plane);
                                     ^
   drivers/gpu/drm/sti/sti_hqvdp.c:360:25: note: expanded from macro 'to_st=
i_hqvdp'
   #define to_sti_hqvdp(x) container_of(x, struct sti_hqvdp, plane)
                           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
--
           if (ret <=3D 0)
           ^
   fs/zonefs/super.c:762:6: note: Assuming the condition is false
           if ((iocb->ki_pos | count) & (sb->s_blocksize - 1)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:762:2: note: Taking false branch
           if ((iocb->ki_pos | count) & (sb->s_blocksize - 1)) {
           ^
   fs/zonefs/super.c:768:6: note: Assuming field 'i_ztype' is equal to ZONE=
FS_ZTYPE_SEQ
           if (zi->i_ztype =3D=3D ZONEFS_ZTYPE_SEQ) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:768:2: note: Taking true branch
           if (zi->i_ztype =3D=3D ZONEFS_ZTYPE_SEQ) {
           ^
   fs/zonefs/super.c:770:7: note: Assuming field 'ki_pos' is equal to field=
 'i_wpoffset'
                   if (iocb->ki_pos !=3D zi->i_wpoffset) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:770:3: note: Taking false branch
                   if (iocb->ki_pos !=3D zi->i_wpoffset) {
                   ^
   fs/zonefs/super.c:779:6: note: 'append' is true
           if (append)
               ^~~~~~
   fs/zonefs/super.c:779:2: note: Taking true branch
           if (append)
           ^
   fs/zonefs/super.c:780:9: note: Calling 'zonefs_file_dio_append'
                   ret =3D zonefs_file_dio_append(iocb, from);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:669:2: note: 'size' declared without an initial value
           ssize_t size;
           ^~~~~~~~~~~~
   fs/zonefs/super.c:678:6: note: Assuming 'nr_pages' is not equal to 0
           if (!nr_pages)
               ^~~~~~~~~
   fs/zonefs/super.c:678:2: note: Taking false branch
           if (!nr_pages)
           ^
   fs/zonefs/super.c:682:6: note: Assuming 'bio' is non-null
           if (!bio)
               ^~~~
   fs/zonefs/super.c:682:2: note: Taking false branch
           if (!bio)
           ^
   fs/zonefs/super.c:685:2: note: Assuming field 'bi_disk' is equal to fiel=
d 'bd_disk'
           bio_set_dev(bio, bdev);
           ^
   include/linux/bio.h:488:6: note: expanded from macro 'bio_set_dev'
           if ((bio)->bi_disk !=3D (bdev)->bd_disk)  \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:685:2: note: Taking false branch
           bio_set_dev(bio, bdev);
           ^
   include/linux/bio.h:488:2: note: expanded from macro 'bio_set_dev'
           if ((bio)->bi_disk !=3D (bdev)->bd_disk)  \
           ^
   fs/zonefs/super.c:685:2: note: Loop condition is false.  Exiting loop
           bio_set_dev(bio, bdev);
           ^
   include/linux/bio.h:486:35: note: expanded from macro 'bio_set_dev'
   #define bio_set_dev(bio, bdev)                  \
                                                   ^
   fs/zonefs/super.c:690:6: note: Assuming the condition is false
           if (iocb->ki_flags & IOCB_DSYNC)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/zonefs/super.c:690:2: note: Taking false branch
           if (iocb->ki_flags & IOCB_DSYNC)
           ^
   fs/zonefs/super.c:694:6: note: Assuming 'ret' is not equal to 0
           if (unlikely(ret))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/zonefs/super.c:694:2: note: Taking true branch
           if (unlikely(ret))
           ^
   fs/zonefs/super.c:695:3: note: Control jumps to line 708
                   goto out_release;
                   ^
   fs/zonefs/super.c:711:6: note: Assuming 'ret' is >=3D 0
           if (ret >=3D 0) {
               ^~~~~~~~
   fs/zonefs/super.c:711:2: note: Taking true branch
           if (ret >=3D 0) {
           ^
   fs/zonefs/super.c:712:16: note: Assigned value is garbage or undefined
                   iocb->ki_pos +=3D size;
                                ^  ~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clk/ti/apll.c:100:2: warning: Value stored to 'state' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/apll.c:100:2: note: Value stored to 'state' is never read
           state <<=3D __ffs(ad->idlest_mask);
           ^         ~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
>> drivers/clk/ti/clkt_dpll.c:305:2: warning: Value stored to 'clk_name' is=
 never read [clang-analyzer-deadcode.DeadStores]
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   drivers/clk/ti/clkt_dpll.c:305:2: note: Value stored to 'clk_name' is ne=
ver read
           clk_name =3D clk_hw_get_name(hw);
           ^          ~~~~~~~~~~~~~~~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   drivers/gpu/drm/sun4i/sun4i_tv.c:491:3: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
                   strcpy(mode->name, tv_mode->name);
                   ^~~~~~
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:149:2: warning: Value stored to '=
val' is never read [clang-analyzer-deadcode.DeadStores]
           val =3D readl(hdmi->base + SUN4I_HDMI_PAD_CTRL1_REG);
           ^
   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:149:2: note: Value stored to 'val=
' is never read
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clk/qcom/gcc-ipq4019.c:1286:2: warning: Value stored to 'ret' is=
 never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(pll->cdiv.clkr.regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/qcom/gcc-ipq4019.c:1286:2: note: Value stored to 'ret' is ne=
ver read
           ret =3D regmap_update_bits(pll->cdiv.clkr.regmap,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/tty/serial/mvebu-uart.c:513:4: warning: Value stored to 'baud' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           baud =3D uart_get_baud_rate(port, old, NULL, 0, =
230400);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/tty/serial/mvebu-uart.c:513:4: note: Value stored to 'baud' is n=
ever read
                           baud =3D uart_get_baud_rate(port, old, NULL, 0, =
230400);
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   2 warnings generated.
   include/asm-generic/bitops/non-atomic.h:21:6: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p  |=3D mask;
               ^
   drivers/tty/serial/serial_mctrl_gpio.c:52:6: note: Assuming 'gpios' is n=
ot equal to NULL
           if (gpios =3D=3D NULL)
               ^~~~~~~~~~~~~
--
   fs/select.c:897:6: note: 'end_time' is null
           if (end_time && !timed_out)
               ^~~~~~~~
   fs/select.c:897:15: note: Left side of '&&' is false
           if (end_time && !timed_out)
                        ^
   fs/select.c:900:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   fs/select.c:904:3: note: Loop condition is true.  Entering loop body
                   for (walk =3D list; walk !=3D NULL; walk =3D walk->next)=
 {
                   ^
   fs/select.c:909:11: note: 'pfd' is not equal to 'pfd_end'
                           for (; pfd !=3D pfd_end; pfd++) {
                                  ^~~
   fs/select.c:909:4: note: Loop condition is true.  Entering loop body
                           for (; pfd !=3D pfd_end; pfd++) {
                           ^
   fs/select.c:917:9: note: Calling 'do_pollfd'
                                   if (do_pollfd(pfd, pt, &can_busy_loop,
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:855:2: note: Assigned value is garbage or undefined
           int fd =3D pollfd->fd;
           ^        ~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/pci/pcie/aer.c:641:3: warning: Array access (from variable 'coun=
ter') results in a null pointer dereference [clang-analyzer-core.NullDerefe=
rence]
                   counter[i]++;
                   ^~~~~~~
   drivers/pci/pcie/aer.c:616:2: note: 'counter' initialized to a null poin=
ter value
           u64 *counter =3D NULL;
           ^~~~~~~~~~~~
   drivers/pci/pcie/aer.c:619:6: note: Assuming 'aer_stats' is non-null
           if (!aer_stats)
               ^~~~~~~~~~
   drivers/pci/pcie/aer.c:619:2: note: Taking false branch
           if (!aer_stats)
           ^
   drivers/pci/pcie/aer.c:622:2: note: 'Default' branch taken. Execution co=
ntinues on line 640
           switch (info->severity) {
           ^
   drivers/pci/pcie/aer.c:640:2: note: Assuming 'i' is < 'max'
           for_each_set_bit(i, &status, max)
           ^
   include/linux/bitops.h:36:7: note: expanded from macro 'for_each_set_bit'
                (bit) < (size);                                    \
                ^~~~~~~~~~~~~~
   drivers/pci/pcie/aer.c:640:2: note: Loop condition is true.  Entering lo=
op body
           for_each_set_bit(i, &status, max)
           ^
   include/linux/bitops.h:35:2: note: expanded from macro 'for_each_set_bit'
           for ((bit) =3D find_first_bit((addr), (size));            \
           ^
   drivers/pci/pcie/aer.c:641:3: note: Array access (from variable 'counter=
') results in a null pointer dereference
                   counter[i]++;
                   ^~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:68:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, prefix);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: warning: Call to f=
unction 'strcpy' is insecure as it does not provide bounding of the memory =
buffer. Replace unbounded copy functions with analogous functions that supp=
ort length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.in=
secureAPI.strcpy]
                   strcpy(dst, src);
                   ^~~~~~
   drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c:71:3: note: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119
                   strcpy(dst, src);
                   ^~~~~~
   13 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/base.c:213:21: warning: Value stored to 'dss=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/base.c:213:21: note: Value stored to 'dss' d=
uring its initialization is never read
           struct dss_device *dss =3D src ? src->dss : dst->dss;
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is < 'num=
_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is true.=
  Entering loop body
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:920:3: note: Calling 'dispc_ovl_writ=
e_color_conv_coef'
                   dispc_ovl_write_color_conv_coef(dispc, i, &coefs_yuv2rgb=
_bt601_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:871:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->g=
cb, ct->gcr));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:867:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: warning: The result of the l=
eft shift is undefined because the left operand is negative [clang-analyzer=
-core.UndefinedBinaryOperatorResult]
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:6: note: Assuming the condition=
 is true
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:51:2: note: expanded from macro 'REG=
_GET'
           FLD_GET(dispc_read_reg(dispc, idx), start, end)
           ^
   drivers/gpu/drm/omapdrm/dss/dss.h:66:34: note: expanded from macro 'FLD_=
GET'
   #define FLD_GET(val, start, end) (((val) & FLD_MASK(start, end)) >> (end=
))
                                    ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4901:2: note: Taking true branch
           if (REG_GET(dispc, DISPC_CONFIG, 2, 1) !=3D OMAP_DSS_LOAD_FRAME_=
ONLY) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4902:3: note: Calling '_omap_dispc_i=
nitial_config'
                   _omap_dispc_initial_config(dispc);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3911:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_CORE_CLK_DIV)) {
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:6: note: Assuming field 'has_ga=
mma_table' is false
           if (dispc->feat->has_gamma_table)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3922:2: note: Taking false branch
           if (dispc->feat->has_gamma_table)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:6: note: Left side of '||' is f=
alse
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
               ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3930:19: note: Field 'has_gamma_tabl=
e' is false
               dispc->feat->has_gamma_table)
                            ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3929:2: note: Taking false branch
           if (dispc_has_feature(dispc, FEAT_FUNCGATED) ||
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:3933:2: note: Calling 'dispc_setup_c=
olor_conv_coef'
           dispc_setup_color_conv_coef(dispc);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:14: note: Assuming 'i' is >=3D '=
num_ovl'
           for (i =3D 1; i < num_ovl; i++)
                       ^~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:919:2: note: Loop condition is false=
. Execution continues on line 922
           for (i =3D 1; i < num_ovl; i++)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:6: note: Assuming field 'has_wri=
teback' is true
           if (dispc->feat->has_writeback)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:922:2: note: Taking true branch
           if (dispc->feat->has_writeback)
           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:923:3: note: Calling 'dispc_wb_write=
_color_conv_coef'
                   dispc_wb_write_color_conv_coef(dispc, &coefs_rgb2yuv_bt6=
01_lim);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:889:56: note: The result of the left=
 shift is undefined because the left operand is negative
           dispc_write_reg(dispc, DISPC_OVL_CONV_COEF(plane, 2), CVAL(ct->c=
rb, ct->crg));
                                                                 ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:885:21: note: expanded from macro 'C=
VAL'
   #define CVAL(x, y) (FLD_VAL(x, 26, 16) | FLD_VAL(y, 10, 0))
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dss.h:65:42: note: expanded from macro 'FLD_=
VAL'
   #define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end=
))
                                      ~~~~~ ^
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: warning: Value stored to 'ht=
' is never read [clang-analyzer-deadcode.DeadStores]
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3215:3: note: Value stored to 'ht' i=
s never read
                   ht =3D vm->pixelclock / xtot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: warning: Value stored to 'vt=
' is never read [clang-analyzer-deadcode.DeadStores]
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:3216:3: note: Value stored to 'vt' i=
s never read
                   vt =3D vm->pixelclock / xtot / ytot;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: warning: Value stored to 're=
v' is never read [clang-analyzer-deadcode.DeadStores]
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/dispc.c:4822:2: note: Value stored to 'rev' =
is never read
           rev =3D dispc_read_reg(dispc, DISPC_REVISION);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:1334:4: warning: Value stored to '=
r' is never read [clang-analyzer-deadcode.DeadStores]
                           r =3D vcn_v2_5_stop_dpg_mode(adev, i);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:1334:4: note: Value stored to 'r' =
is never read
                           r =3D vcn_v2_5_stop_dpg_mode(adev, i);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:353:6: warning: Branch condition e=
valuates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!r)
               ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:431:6: note: Assuming 'r' is 0
           if (r)
               ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:431:2: note: Taking false branch
           if (r)
           ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:434:6: note: Calling 'vcn_v3_0_hw_=
init'
           r =3D vcn_v3_0_hw_init(adev);
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:301:12: note: 'r' declared without=
 an initial value
           int i, j, r;
                     ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:303:6: note: Assuming the conditio=
n is false
           if (amdgpu_sriov_vf(adev)) {
               ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h:230:2: note: expanded=
 from macro 'amdgpu_sriov_vf'
   ((adev)->virt.caps & AMDGPU_SRIOV_CAPS_IS_VF)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:303:2: note: Taking false branch
           if (amdgpu_sriov_vf(adev)) {
           ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:330:15: note: Assuming 'i' is >=3D=
 field 'num_vcn_inst'
                   for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:330:3: note: Loop condition is fal=
se. Execution continues on line 353
                   for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
                   ^
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:353:6: note: Branch condition eval=
uates to a garbage value
           if (!r)
               ^~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1544:4: warning: Value stored to '=
r' is never read [clang-analyzer-deadcode.DeadStores]
                           r =3D vcn_v3_0_stop_dpg_mode(adev, i);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1544:4: note: Value stored to 'r' =
is never read
                           r =3D vcn_v3_0_stop_dpg_mode(adev, i);
                           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1938:2: warning: Undefined or gar=
bage value returned to caller [clang-analyzer-core.uninitialized.UndefRetur=
n]
           return r;
           ^      ~
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1878:6: note: 'r' declared withou=
t an initial value
           int r, i;
               ^
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1882:14: note: Assuming 'i' is >=
=3D field 'num_instances'
           for (i =3D 0; i < adev->sdma.num_instances; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1882:2: note: Loop condition is f=
alse. Execution continues on line 1891
           for (i =3D 0; i < adev->sdma.num_instances; i++) {
           ^
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1891:14: note: 'i' is >=3D field =
'num_instances'
           for (i =3D 0; i < adev->sdma.num_instances; i++) {
                       ^
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1891:2: note: Loop condition is f=
alse. Execution continues on line 1899
           for (i =3D 0; i < adev->sdma.num_instances; i++) {
           ^
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1899:14: note: 'i' is >=3D field =
'num_instances'
           for (i =3D 0; i < adev->sdma.num_instances; i++) {
                       ^
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1899:2: note: Loop condition is f=
alse. Execution continues on line 1938
           for (i =3D 0; i < adev->sdma.num_instances; i++) {
           ^
   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c:1938:2: note: Undefined or garbag=
e value returned to caller
           return r;
           ^      ~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
           ^
   fs/ext4/inode.c:6073:13: note: Left side of '&&' is false
           down_read(&EXT4_I(inode)->i_mmap_sem);
                      ^
   include/trace/events/ext4.h:22:24: note: expanded from macro 'EXT4_I'
   #define EXT4_I(inode) (container_of(inode, struct ext4_inode_info, vfs_i=
node))
                          ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/ext4/inode.c:6073:13: note: Taking false branch
           down_read(&EXT4_I(inode)->i_mmap_sem);
                      ^
   include/trace/events/ext4.h:22:24: note: expanded from macro 'EXT4_I'
   #define EXT4_I(inode) (container_of(inode, struct ext4_inode_info, vfs_i=
node))
                          ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/ext4/inode.c:6073:13: note: Loop condition is false.  Exiting loop
           down_read(&EXT4_I(inode)->i_mmap_sem);
                      ^
   include/trace/events/ext4.h:22:24: note: expanded from macro 'EXT4_I'
   #define EXT4_I(inode) (container_of(inode, struct ext4_inode_info, vfs_i=
node))
                          ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/ext4/inode.c:6076:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/ext4/inode.c:6076:2: note: Taking false branch
           if (err)
           ^
   fs/ext4/inode.c:6085:6: note: Assuming the condition is true
           if (ext4_should_journal_data(inode))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:6085:2: note: Taking true branch
           if (ext4_should_journal_data(inode))
           ^
   fs/ext4/inode.c:6086:3: note: Control jumps to line 6136
                   goto retry_alloc;
                   ^
   fs/ext4/inode.c:6138:6: note: Calling 'IS_ERR'
           if (IS_ERR(handle)) {
               ^~~~~~~~~~~~~~
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
   fs/ext4/inode.c:6138:6: note: Returning from 'IS_ERR'
           if (IS_ERR(handle)) {
               ^~~~~~~~~~~~~~
   fs/ext4/inode.c:6138:2: note: Taking false branch
           if (IS_ERR(handle)) {
           ^
   fs/ext4/inode.c:6147:6: note: Assuming the condition is true
           if (!ext4_should_journal_data(inode)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:6147:2: note: Taking true branch
           if (!ext4_should_journal_data(inode)) {
           ^
   fs/ext4/inode.c:6148:9: note: 3rd function call argument is an uninitial=
ized value
                   err =3D block_page_mkwrite(vma, vmf, get_block);
                         ^                            ~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/mfd/menelaus.c:453:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:453:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:525:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: warning: Value stored to 'c' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/menelaus.c:734:21: note: Value stored to 'c' during its init=
ialization is never read
           struct i2c_client *c =3D the_menelaus->client;
                              ^   ~~~~~~~~~~~~~~~~~~~~
   16 warnings generated.
   drivers/mfd/twl-core.c:574:15: warning: The left operand of '&' is a gar=
bage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:569:2: note: 'ctrl' declared without an initial v=
alue
           u8 ctrl;
           ^~~~~~~
   drivers/mfd/twl-core.c:572:2: note: Calling 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:9: note: Calling 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:473:7: note: 'regmap' is null
           if (!regmap)
                ^~~~~~
   drivers/mfd/twl-core.c:473:2: note: Taking true branch
           if (!regmap)
           ^
   drivers/mfd/twl-core.c:474:3: note: Returning without writing to '*value'
                   return -EPERM;
                   ^
   include/linux/mfd/twl.h:180:9: note: Returning from 'twl_i2c_read'
           return twl_i2c_read(mod_no, val, reg, 1);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/twl.h:180:2: note: Returning without writing to '*val'
           return twl_i2c_read(mod_no, val, reg, 1);
           ^
   drivers/mfd/twl-core.c:572:2: note: Returning from 'twl_i2c_read_u8'
           twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &ctrl, R_CFG_BOOT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:574:15: note: The left operand of '&' is a garbag=
e value
           switch (ctrl & 0x3) {
                   ~~~~ ^
   drivers/mfd/twl-core.c:1205:8: warning: The left expression of the compo=
und assignment is an uninitialized value. The computed value will also be g=
arbage [clang-analyzer-core.uninitialized.Assign]
                   temp &=3D ~(SR_I2C_SDA_CTRL_PU | SR_I2C_SCL_CTRL_PU | \
                   ~~~~ ^
   drivers/mfd/twl-core.c:1078:6: note: Assuming 'node' is non-null
           if (!node && !pdata) {
               ^~~~~
   drivers/mfd/twl-core.c:1078:12: note: Left side of '&&' is false
           if (!node && !pdata) {
                     ^
   drivers/mfd/twl-core.c:1083:6: note: Assuming 'twl_priv' is null
           if (twl_priv) {
               ^~~~~~~~
   drivers/mfd/twl-core.c:1083:2: note: Taking false branch
           if (twl_priv) {
           ^
   drivers/mfd/twl-core.c:1090:6: note: Assuming 'pdev' is non-null
           if (!pdev) {
               ^~~~~
   drivers/mfd/twl-core.c:1090:2: note: Taking false branch
           if (!pdev) {
           ^
   drivers/mfd/twl-core.c:1096:6: note: Assuming 'status' is 0
           if (status) {
               ^~~~~~
   drivers/mfd/twl-core.c:1096:2: note: Taking false branch
           if (status) {
           ^
   drivers/mfd/twl-core.c:1101:2: note: Taking false branch
           if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C) =3D=
=3D 0) {
           ^
   drivers/mfd/twl-core.c:1109:6: note: Assuming 'twl_priv' is non-null
           if (!twl_priv) {
               ^~~~~~~~~
   drivers/mfd/twl-core.c:1109:2: note: Taking false branch
           if (!twl_priv) {
           ^
   drivers/mfd/twl-core.c:1114:6: note: Assuming the condition is true
           if ((id->driver_data) & TWL6030_CLASS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1114:2: note: Taking true branch
           if ((id->driver_data) & TWL6030_CLASS) {
           ^
   drivers/mfd/twl-core.c:1118:7: note: Assuming the condition is false
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mfd/twl-core.c:1118:3: note: Taking false branch
                   if ((id->driver_data) & TWL6032_SUBCLASS)
                   ^
   drivers/mfd/twl-core.c:1129:26: note: Calling 'devm_kcalloc'
--
                       ^~~~~
   drivers/gpu/drm/msm/msm_gpu.c:612:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < n; i++)
           ^
   drivers/gpu/drm/msm/msm_gpu.c:612:21: note: The value 1 is assigned to '=
i'
           for (i =3D 0; i < n; i++)
                              ^~~
   drivers/gpu/drm/msm/msm_gpu.c:612:14: note: 'i' is < 'n'
           for (i =3D 0; i < n; i++)
                       ^
   drivers/gpu/drm/msm/msm_gpu.c:612:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < n; i++)
           ^
   drivers/gpu/drm/msm/msm_gpu.c:613:31: note: The left operand of '-' is a=
 garbage value
                   cntrs[i] =3D current_cntrs[i] - gpu->last_cntrs[i];
                              ~~~~~~~~~~~~~~~~ ^
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/watchdog/pcwd_pci.c:169:2: warning: 1st function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
           outb_p(*lsb, pcipcwd_private.io_addr + 4);
           ^
   include/asm-generic/io.h:577:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   drivers/watchdog/pcwd_pci.c:688:6: note: Assuming 'cards_found' is not e=
qual to 1
           if (cards_found =3D=3D 1)
               ^~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:688:2: note: Taking false branch
           if (cards_found =3D=3D 1)
           ^
   drivers/watchdog/pcwd_pci.c:691:6: note: Assuming 'cards_found' is <=3D 1
           if (cards_found > 1) {
               ^~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:691:2: note: Taking false branch
           if (cards_found > 1) {
           ^
   drivers/watchdog/pcwd_pci.c:696:6: note: Assuming the condition is false
           if (pci_enable_device(pdev)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:696:2: note: Taking false branch
           if (pci_enable_device(pdev)) {
           ^
   drivers/watchdog/pcwd_pci.c:701:6: note: Assuming field 'start' is not e=
qual to 0
           if (pci_resource_start(pdev, 0) =3D=3D 0x0000) {
               ^
   include/linux/pci.h:1854:38: note: expanded from macro 'pci_resource_sta=
rt'
   #define pci_resource_start(dev, bar)    ((dev)->resource[(bar)].start)
                                           ^
   drivers/watchdog/pcwd_pci.c:701:2: note: Taking false branch
           if (pci_resource_start(pdev, 0) =3D=3D 0x0000) {
           ^
   drivers/watchdog/pcwd_pci.c:707:2: note: Loop condition is false.  Exiti=
ng loop
           spin_lock_init(&pcipcwd_private.io_lock);
           ^
   include/linux/spinlock.h:334:35: note: expanded from macro 'spin_lock_in=
it'
   # define spin_lock_init(lock)                                   \
                                                                   ^
   drivers/watchdog/pcwd_pci.c:711:6: note: Assuming the condition is false
           if (pci_request_regions(pdev, WATCHDOG_NAME)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:711:2: note: Taking false branch
           if (pci_request_regions(pdev, WATCHDOG_NAME)) {
           ^
   drivers/watchdog/pcwd_pci.c:731:2: note: Calling 'pcipcwd_show_card_info'
           pcipcwd_show_card_info();
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:226:32: note: 'fw_rev_minor' declared withou=
t an initial value
           int got_fw_rev, fw_rev_major, fw_rev_minor;
                                         ^~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:230:15: note: Calling 'send_command'
           got_fw_rev =3D send_command(CMD_GET_FIRMWARE_VERSION, &fw_rev_ma=
jor,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/watchdog/pcwd_pci.c:158:6: note: Assuming 'debug' is < DEBUG
           if (debug >=3D DEBUG)
               ^~~~~~~~~~~~~~
   drivers/watchdog/pcwd_pci.c:158:2: note: Taking false branch
           if (debug >=3D DEBUG)
           ^
   drivers/watchdog/pcwd_pci.c:169:2: note: 1st function call argument is a=
n uninitialized value
           outb_p(*lsb, pcipcwd_private.io_addr + 4);
           ^      ~~~~
   include/asm-generic/io.h:577:16: note: expanded from macro 'outb_p'
   #define outb_p outb_p
                  ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/gpu/drm/omapdrm/dss/venc.c:697:2: warning: Value stored to 'rev_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/omapdrm/dss/venc.c:697:2: note: Value stored to 'rev_id'=
 is never read
           rev_id =3D (u8)(venc_read_reg(venc, VENC_REV_ID) & 0xff);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/rtc/rtc-sc27xx.c:373:8: warning: The result of the left shift is=
 undefined because the left operand is negative [clang-analyzer-core.Undefi=
nedBinaryOperatorResult]
                                      SPRD_RTC_POWER_STS_VALID);
                                      ^
   drivers/rtc/rtc-sc27xx.c:97:31: note: expanded from macro 'SPRD_RTC_POWE=
R_STS_VALID'
           (~SPRD_RTC_POWER_RESET_VALUE << SPRD_RTC_POWER_STS_SHIFT)
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/rtc/rtc-sc27xx.c:358:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/rtc/rtc-sc27xx.c:358:2: note: Taking false branch
           if (ret)
           ^
   drivers/rtc/rtc-sc27xx.c:361:6: note: Assuming field 'valid' is false
           if (!rtc->valid) {
               ^~~~~~~~~~~
   drivers/rtc/rtc-sc27xx.c:361:2: note: Taking true branch
           if (!rtc->valid) {
           ^
   drivers/rtc/rtc-sc27xx.c:365:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   drivers/rtc/rtc-sc27xx.c:365:3: note: Taking false branch
                   if (ret)
                   ^
   drivers/rtc/rtc-sc27xx.c:373:8: note: The result of the left shift is un=
defined because the left operand is negative
                                      SPRD_RTC_POWER_STS_VALID);
                                      ^
   drivers/rtc/rtc-sc27xx.c:97:31: note: expanded from macro 'SPRD_RTC_POWE=
R_STS_VALID'
           (~SPRD_RTC_POWER_RESET_VALUE << SPRD_RTC_POWER_STS_SHIFT)
            ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   1 warning generated.
   drivers/hid/hid-steam.c:246:15: warning: The left operand of '!=3D' is a=
 garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (reply[0] !=3D 0xae || reply[1] !=3D 0x15 || reply[2] !=3D 0x=
01)
                        ^
   drivers/hid/hid-steam.c:564:31: note: Left side of '&&' is false
           struct steam_device *steam =3D container_of(work, struct steam_d=
evice,
                                        ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/hid/hid-steam.c:564:31: note: Taking false branch
           struct steam_device *steam =3D container_of(work, struct steam_d=
evice,
                                        ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/hid/hid-steam.c:564:31: note: Loop condition is false.  Exiting =
loop
           struct steam_device *steam =3D container_of(work, struct steam_d=
evice,
                                        ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
--
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:6: note: Assum=
ing field 'lo' is not equal to 0
           if (it->lo !=3D 0) {
               ^~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:2: note: Takin=
g true branch
           if (it->lo !=3D 0) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:133:11: note: Call=
ing 'inv_compute_chip_period'
                   valid =3D inv_compute_chip_period(ts, fifo_mult, period);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:101:2: note: Takin=
g false branch
           if (!inv_validate_period(period, mult))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:106:2: note: Calli=
ng 'inv_update_acc'
           inv_update_acc(&ts->chip_period, new_chip_period);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:6: note: Assumi=
ng the condition is false
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:2: note: Taking=
 false branch
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:7: note: The va=
lue 0 is assigned to 'i'
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
                ^~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:7: note: Assumi=
ng the condition is true
                   if (acc->values[i] =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:3: note: Taking=
 true branch
                   if (acc->values[i] =3D=3D 0)
                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:36:4: note:  Execu=
tion continues on line 40
                           break;
                           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:26: note: Passi=
ng the value 0 via 2nd parameter 'divisor'
           acc->val =3D div_u64(sum, i);
                                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:40:13: note: Calli=
ng 'div_u64'
           acc->val =3D div_u64(sum, i);
                      ^~~~~~~~~~~~~~~
   include/linux/math64.h:127:31: note: Passing the value 0 via 2nd paramet=
er 'divisor'
           return div_u64_rem(dividend, divisor, &remainder);
                                        ^~~~~~~
   include/linux/math64.h:127:9: note: Calling 'div_u64_rem'
           return div_u64_rem(dividend, divisor, &remainder);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/math64.h:91:15: note: '__base' initialized to 0
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:224:2: note: expanded from macro 'do_div'
           uint32_t __base =3D (base);                       \
           ^~~~~~~~~~~~~~~
   include/linux/math64.h:91:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:227:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) &&             \
                                            ^
   include/linux/math64.h:91:15: note: 4 is >=3D 4
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/div64.h:64:32: note: expanded from macro '__div64_c=
onst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                  ^~~~~~~~
   note: expanded from here
   include/linux/math64.h:91:15: note: Left side of '&&' is true
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:231:13: note: expanded from macro 'do_div'
           } else if (__div64_const32_is_OK &&             \
                      ^
   arch/arm/include/asm/div64.h:64:31: note: expanded from macro '__div64_c=
onst32_is_OK'
   #define __div64_const32_is_OK (__GNUC__ >=3D 4)
                                 ^
   include/linux/math64.h:91:15: note: Left side of '&&' is false
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:232:35: note: expanded from macro 'do_div'
                      __builtin_constant_p(__base) &&      \
                                                   ^
   include/linux/math64.h:91:15: note: Taking true branch
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:239:9: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) =3D=3D 0)) {          \
                  ^
   include/linux/math64.h:91:15: note: Division by zero
           *remainder =3D do_div(dividend, divisor);
                        ^
   include/asm-generic/div64.h:240:25: note: expanded from macro 'do_div'
                   __rem =3D (uint32_t)(n) % __base;         \
                           ~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/hsi/clients/ssi_protocol.c:458:21: warning: Value stored to 'cl'=
 during its initialization is never read [clang-analyzer-deadcode.DeadStore=
s]
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   drivers/hsi/clients/ssi_protocol.c:458:21: note: Value stored to 'cl' du=
ring its initialization is never read
           struct hsi_client *cl =3D ssi->cl;
                              ^~   ~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (12 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/hamradio/baycom_ser_fdx.c:521:4: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                           strcat(hi->data.modename, (!bc->opt_dcd) ? "*" :=
 "+");
                           ^~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:521:4: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                           strcat(hi->data.modename, (!bc->opt_dcd) ? "*" :=
 "+");
                           ^~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/w1/masters/ds1wm.c:567:2: warning: Value stored to 'inten' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/masters/ds1wm.c:567:2: note: Value stored to 'inten' is never=
 read
           inten =3D ds1wm_read_register(ds1wm_data, DS1WM_INT_EN);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   15 warnings generated.
   drivers/iio/proximity/sx9310.c:630:17: warning: The left operand of '>>'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *val =3D pthresh >> (5 - regval);
                          ^
   drivers/iio/proximity/sx9310.c:679:6: note: Assuming field 'type' is equ=
al to IIO_PROXIMITY
           if (chan->type !=3D IIO_PROXIMITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:679:2: note: Taking false branch
           if (chan->type !=3D IIO_PROXIMITY)
           ^
   drivers/iio/proximity/sx9310.c:682:2: note: Control jumps to 'case IIO_E=
V_INFO_HYSTERESIS:'  at line 694
           switch (info) {
           ^
   drivers/iio/proximity/sx9310.c:695:10: note: Calling 'sx9310_read_hyster=
esis'
                   return sx9310_read_hysteresis(data, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:614:23: note: 'pthresh' declared without =
an initial value
           unsigned int regval, pthresh;
                                ^~~~~~~
   drivers/iio/proximity/sx9310.c:617:8: note: Calling 'sx9310_read_thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:596:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/iio/proximity/sx9310.c:596:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:600:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/proximity/sx9310.c:600:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/proximity/sx9310.c:617:8: note: Returning from 'sx9310_read_=
thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:618:6: note: Assuming 'ret' is >=3D 0
--
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/netrom/nr_route.c:971:2: note: Loop condition is false.  Exiting loop
           nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
           ^
   include/net/netrom.h:164:2: note: expanded from macro 'nr_neigh_for_each=
_safe'
           hlist_for_each_entry_safe(__nr_neigh, node2, list, neigh_node)
           ^
   include/linux/list.h:1024:13: note: expanded from macro 'hlist_for_each_=
entry_safe'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*pos), membe=
r);\
                      ^
   include/linux/list.h:983:15: note: expanded from macro 'hlist_entry_safe'
              ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
                        ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/netrom/nr_route.c:971:25: note: 's' is non-null
           nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
                                  ^
   include/net/netrom.h:164:28: note: expanded from macro 'nr_neigh_for_eac=
h_safe'
           hlist_for_each_entry_safe(__nr_neigh, node2, list, neigh_node)
                                     ^~~~~~~~~~
   include/linux/list.h:1025:7: note: expanded from macro 'hlist_for_each_e=
ntry_safe'
                pos && ({ n =3D pos->member.next; 1; });                   =
  \
                ^~~
   net/netrom/nr_route.c:971:25: note: Left side of '&&' is true
           nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
                                  ^
   net/netrom/nr_route.c:971:2: note: Loop condition is true.  Entering loo=
p body
           nr_neigh_for_each_safe(s, nodet, &nr_neigh_list) {
           ^
   include/net/netrom.h:164:2: note: expanded from macro 'nr_neigh_for_each=
_safe'
           hlist_for_each_entry_safe(__nr_neigh, node2, list, neigh_node)
           ^
   include/linux/list.h:1024:2: note: expanded from macro 'hlist_for_each_e=
ntry_safe'
           for (pos =3D hlist_entry_safe((head)->first, typeof(*pos), membe=
r);\
           ^
   net/netrom/nr_route.c:972:3: note: Loop condition is true.  Entering loo=
p body
                   while(s->count) {
                   ^
   net/netrom/nr_route.c:974:4: note: Calling 'nr_neigh_put'
                           nr_neigh_put(s);
                           ^~~~~~~~~~~~~~~
   include/net/netrom.h:138:2: note: Taking true branch
           if (refcount_dec_and_test(&nr_neigh->refcount)) {
           ^
   include/net/netrom.h:139:7: note: Assuming field 'ax25' is null
                   if (nr_neigh->ax25)
                       ^~~~~~~~~~~~~~
   include/net/netrom.h:139:3: note: Taking false branch
                   if (nr_neigh->ax25)
                   ^
   include/net/netrom.h:142:3: note: Memory is released
                   kfree(nr_neigh);
                   ^~~~~~~~~~~~~~~
   net/netrom/nr_route.c:974:4: note: Returning; memory was released via 1s=
t parameter
                           nr_neigh_put(s);
                           ^~~~~~~~~~~~~~~
   net/netrom/nr_route.c:972:9: note: Use of memory after it is freed
                   while(s->count) {
                         ^~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/mtd/devices/phram.c:230:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:230:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(str, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:310:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(phram_paramline, val);
           ^~~~~~
   drivers/mtd/devices/phram.c:310:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(phram_paramline, val);
           ^~~~~~
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/mtd/devices/st_spi_fsm.c:275:8: warning: Excessive padding in 's=
truct seq_rw_config' (6 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   flags, =

   write, =

   cmd, =

   addr_pads, =

   data_pads, =

   mode_data, =

   mode_cycles, =

   dummy_cycles, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:275:8: note: Excessive padding in 'stru=
ct seq_rw_config' (6 padding bytes, where 2 is optimal). Optimal fields ord=
er: flags, write, cmd, addr_pads, data_pads, mode_data, mode_cycles, dummy_=
cycles, consider reordering the fields or adding explicit padding members
   struct seq_rw_config {
   ~~~~~~~^~~~~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:287:8: warning: Excessive padding in 's=
truct flash_info' (4 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   name, =

   jedec_id, =

   sector_size, =

   flags, =

   max_freq, =

   config, =

   ext_id, =

   n_sectors, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
   drivers/mtd/devices/st_spi_fsm.c:287:8: note: Excessive padding in 'stru=
ct flash_info' (4 padding bytes, where 0 is optimal). Optimal fields order:=
 name, jedec_id, sector_size, flags, max_freq, config, ext_id, n_sectors, c=
onsider reordering the fields or adding explicit padding members
   struct flash_info {
   ~~~~~~~^~~~~~~~~~~~
>> drivers/mtd/devices/st_spi_fsm.c:1427:3: warning: Value stored to 'offs'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   offs =3D 0;
                   ^      ~
   drivers/mtd/devices/st_spi_fsm.c:1427:3: note: Value stored to 'offs' is=
 never read
                   offs =3D 0;
                   ^      ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   include/linux/mtd/mtd.h:470:19: warning: The left operand of '=3D=3D' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return ops->mode =3D=3D MTD_OPS_AUTO_OOB ? mtd->oobavail : mtd->=
oobsize;
                            ^
   drivers/mtd/nand/onenand/onenand_base.c:3187:28: note: Assuming the cond=
ition is false
           u_char *buf =3D FLEXONENAND(this) ? this->page_buf : this->oob_b=
uf;
                                     ^
   include/linux/mtd/onenand.h:161:3: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3187:16: note: '?' condition is =
false
           u_char *buf =3D FLEXONENAND(this) ? this->page_buf : this->oob_b=
uf;
                         ^
   include/linux/mtd/onenand.h:161:2: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3192:20: note: '?' condition is =
false
           memset(buf, 0xff, FLEXONENAND(this) ? this->writesize
                             ^
   include/linux/mtd/onenand.h:161:2: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3202:8: note: '?' condition is f=
alse
           len =3D FLEXONENAND(this) ? mtd->writesize : 16;
                 ^
   include/linux/mtd/onenand.h:161:2: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3210:2: note: Taking false branch
           if (FLEXONENAND(this))
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3214:6: note: Assuming 'otp' is =
equal to 1
           if (otp =3D=3D 1)
               ^~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3214:2: note: Taking true branch
           if (otp =3D=3D 1)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3223:8: note: Calling 'onenand_o=
tp_walk'
           ret =3D onenand_otp_walk(mtd, from, len, &retlen, buf, do_otp_lo=
ck, MTD_OTP_USER);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:6: note: Assuming 'density'=
 is >=3D ONENAND_DEVICE_DENSITY_512Mb
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3038:2: note: Taking false branch
           if (density < ONENAND_DEVICE_DENSITY_512Mb)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3043:6: note: 'mode' is not equa=
l to MTD_OTP_FACTORY
           if (mode =3D=3D MTD_OTP_FACTORY) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3043:2: note: Taking false branch
           if (mode =3D=3D MTD_OTP_FACTORY) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3049:6: note: 'mode' is equal to=
 MTD_OTP_USER
           if (mode =3D=3D MTD_OTP_USER) {
               ^~~~
   drivers/mtd/nand/onenand/onenand_base.c:3049:2: note: Taking true branch
           if (mode =3D=3D MTD_OTP_USER) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3050:7: note: Assuming the condi=
tion is false
                   if (mtd->writesize * otp_pages < from + len)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3050:3: note: Taking false branch
                   if (mtd->writesize * otp_pages < from + len)
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: 'len' is > 0
           while (len > 0 && otp_pages > 0) {
                  ^~~
   drivers/mtd/nand/onenand/onenand_base.c:3058:9: note: Left side of '&&' =
is true
   drivers/mtd/nand/onenand/onenand_base.c:3058:2: note: Loop condition is =
true.  Entering loop body
           while (len > 0 && otp_pages > 0) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3059:8: note: 'action' is non-nu=
ll
                   if (!action) {  /* OTP Info functions */
                        ^~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3059:3: note: Taking false branch
                   if (!action) {  /* OTP Info functions */
                   ^
   drivers/mtd/nand/onenand/onenand_base.c:3079:10: note: Calling 'do_otp_l=
ock'
                           ret =3D action(mtd, from, len, &tmp_retlen, buf);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2983:18: note: Assuming the cond=
ition is true
           if (FLEXONENAND(this)) {
                           ^
   include/linux/mtd/onenand.h:161:3: note: expanded from macro 'FLEXONENAN=
D'
           (this->device_id & DEVICE_IS_FLEXONENAND)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:2983:2: note: Taking true branch
           if (FLEXONENAND(this)) {
           ^
   drivers/mtd/nand/onenand/onenand_base.c:2996:9: note: Calling 'onenand_w=
rite_ops_nolock'
                   ret =3D onenand_write_ops_nolock(mtd, mtd->writesize * 4=
9, &ops);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:1799:2: note: Taking false branch
--
           if (ssb_extif_available(&bus->extif))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:946:2: note: Taking false branch
           if (ssb_extif_available(&bus->extif))
           ^
   drivers/ssb/main.c:949:11: note: Assuming field 'dev' is non-null
           else if (bus->chipco.dev)
                    ^~~~~~~~~~~~~~~
   drivers/ssb/main.c:949:7: note: Taking true branch
           else if (bus->chipco.dev)
                ^
   drivers/ssb/main.c:955:6: note: Assuming field 'chip_id' is not equal to=
 21349
           if (bus->chip_id =3D=3D 0x5365) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:955:2: note: Taking false branch
           if (bus->chip_id =3D=3D 0x5365) {
           ^
   drivers/ssb/main.c:958:10: note: Calling 'ssb_calc_clock_rate'
                   rate =3D ssb_calc_clock_rate(plltype, clkctl_n, clkctl_m=
);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:849:2: note: Control jumps to 'case 65536:'  at line =
854
           switch (plltype) {
           ^
   drivers/ssb/main.c:860:3: note:  Execution continues on line 873
                   break;
                   ^
   drivers/ssb/main.c:873:2: note: Control jumps to the 'default' case at l=
ine 878
           switch (plltype) {
           ^
   drivers/ssb/main.c:881:6: note: Assuming 'clock' is not equal to 0
           if (!clock)
               ^~~~~~
   drivers/ssb/main.c:881:2: note: Taking false branch
           if (!clock)
           ^
   drivers/ssb/main.c:889:2: note: Control jumps to 'case 65536:'  at line =
890
           switch (plltype) {
           ^
   drivers/ssb/main.c:894:8: note: Calling 'clkfactor_f6_resolve'
                   m1 =3D clkfactor_f6_resolve(m1);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:824:2: note: 'Default' branch taken. Execution contin=
ues on line 838
           switch (v) {
           ^
   drivers/ssb/main.c:838:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:894:8: note: Returning from 'clkfactor_f6_resolve'
                   m1 =3D clkfactor_f6_resolve(m1);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:894:3: note: The value 0 is assigned to 'm1'
                   m1 =3D clkfactor_f6_resolve(m1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:895:8: note: 'plltype' is equal to SSB_PLLTYPE_1
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                        ^~~~~~~
   drivers/ssb/main.c:895:34: note: Left side of '||' is true
                   if ((plltype =3D=3D SSB_PLLTYPE_1) ||
                                                  ^
   drivers/ssb/main.c:900:8: note: Calling 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:824:2: note: 'Default' branch taken. Execution contin=
ues on line 838
           switch (v) {
           ^
   drivers/ssb/main.c:838:2: note: Returning zero
           return 0;
           ^~~~~~~~
   drivers/ssb/main.c:900:8: note: Returning from 'clkfactor_f6_resolve'
                   m3 =3D clkfactor_f6_resolve(m3);
                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:900:3: note: The value 0 is assigned to 'm3'
                   m3 =3D clkfactor_f6_resolve(m3);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ssb/main.c:902:3: note: Control jumps to 'case 17:'  at line 911
                   switch (mc) {
                   ^
   drivers/ssb/main.c:912:18: note: Division by zero
                           return (clock / (m1 * m3));
                                   ~~~~~~^~~~~~~~~~~
   drivers/ssb/main.c:1306:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/ssb/main.c:1306:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   drivers/ssb/main.c:1312:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/ssb/main.c:1312:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
>> drivers/nvmem/sunxi_sid.c:107:2: warning: Null pointer passed as 1st arg=
ument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(val, &word, bytes);
           ^      ~~~
   drivers/nvmem/sunxi_sid.c:89:9: note: Assuming 'bytes' is >=3D 4
           while (bytes >=3D 4) {
                  ^~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:89:2: note: Loop condition is true.  Entering =
loop body
           while (bytes >=3D 4) {
           ^
   drivers/nvmem/sunxi_sid.c:90:9: note: Calling 'sun8i_sid_register_readou=
t'
                   ret =3D sun8i_sid_register_readout(sid, offset, val);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/sunxi_sid.c:61:2: note: Loop condition is false.  Exiting =
loop
           writel(reg_val, sid->base + SUN8I_SID_PRCTL);
           ^
   arch/arm/include/asm/io.h:307:25: note: expanded from macro 'writel'
   #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
                                      ^
   arch/arm/include/asm/io.h:166:20: note: expanded from macro '__iowmb'
   #define __iowmb()               wmb()
                                   ^
   arch/arm/include/asm/barrier.h:66:16: note: expanded from macro 'wmb'
   #define wmb()           __arm_heavy_mb(st)
                           ^
   arch/arm/include/asm/barrier.h:58:30: note: expanded from macro '__arm_h=
eavy_mb'
   #define __arm_heavy_mb(x...) do { dsb(x); arm_heavy_mb(); } while (0)
                                ^
   drivers/nvmem/sunxi_sid.c:63:8: note: '__sleep_us' is not equal to 0
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:160:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/nvmem/sunxi_sid.c:63:8: note: Taking true branch
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:29: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                               ^
   include/linux/kernel.h:87:26: note: expanded from macro 'might_resched'
   # define might_resched() do { } while (0)
                            ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
           ^
   include/linux/iopoll.h:121:2: note: expanded from macro 'readx_poll_time=
out'
           read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, ad=
dr)
           ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:160:45: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                               ^
   include/linux/kernel.h:152:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   drivers/nvmem/sunxi_sid.c:63:8: note: Loop condition is false.  Exiting =
loop
           ret =3D readl_poll_timeout(sid->base + SUN8I_SID_PRCTL, reg_val,
                 ^
   include/linux/iopoll.h:156:2: note: expanded from macro 'readl_poll_time=
out'
           readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
--
   net/core/filter.c:1770:2: warning: Null pointer passed as 1st argument t=
o memory set function [clang-analyzer-unix.cstring.NullArg]
           memset(to, 0, len);
           ^      ~~
   net/core/filter.c:1756:15: note: Assuming 'offset' is <=3D 65535
           if (unlikely(offset > 0xffff))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1756:2: note: Taking false branch
           if (unlikely(offset > 0xffff))
           ^
   net/core/filter.c:1759:15: note: Assuming field 'skb' is non-null
           if (unlikely(!ctx->skb))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1759:2: note: Taking false branch
           if (unlikely(!ctx->skb))
           ^
   net/core/filter.c:1763:15: note: Assuming 'ptr' is null
           if (unlikely(!ptr))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1763:2: note: Taking true branch
           if (unlikely(!ptr))
           ^
   net/core/filter.c:1764:3: note: Control jumps to line 1770
                   goto err_clear;
                   ^
   net/core/filter.c:1770:2: note: Null pointer passed as 1st argument to m=
emory set function
           memset(to, 0, len);
           ^      ~~
   net/core/filter.c:5161:15: warning: Value stored to 'sk' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           struct sock *sk =3D bpf_sock->sk;
                        ^~   ~~~~~~~~~~~~
   net/core/filter.c:5161:15: note: Value stored to 'sk' during its initial=
ization is never read
           struct sock *sk =3D bpf_sock->sk;
                        ^~   ~~~~~~~~~~~~
   net/core/filter.c:5162:6: warning: Value stored to 'val' during its init=
ialization is never read [clang-analyzer-deadcode.DeadStores]
           int val =3D argval & BPF_SOCK_OPS_ALL_CB_FLAGS;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:5162:6: note: Value stored to 'val' during its initial=
ization is never read
           int val =3D argval & BPF_SOCK_OPS_ALL_CB_FLAGS;
               ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c:668:3: warning: Value stored to 't=
mp' is never read [clang-analyzer-deadcode.DeadStores]
                   tmp =3D RREG32(mmSRBM_SOFT_RESET);
                   ^
   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c:668:3: note: Value stored to 'tmp'=
 is never read
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1246:5: warning: Value stored to '=
ring' is never read [clang-analyzer-deadcode.DeadStores]
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1246:5: note: Value stored to 'rin=
g' is never read
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1307:5: warning: Value stored to '=
ring' is never read [clang-analyzer-deadcode.DeadStores]
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c:1307:5: note: Value stored to 'rin=
g' is never read
                                   ring =3D &adev->vcn.inst->ring_dec;
                                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/cpufreq/mediatek-cpufreq.c:305:14: warning: Value stored to 'cpu=
_clk' during its initialization is never read [clang-analyzer-deadcode.Dead=
Stores]
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:305:14: note: Value stored to 'cpu_cl=
k' during its initialization is never read
           struct clk *cpu_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~   ~~~~~~~~~~~~~~~~
>> drivers/cpufreq/mediatek-cpufreq.c:306:14: warning: Value stored to 'int=
er_clk' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   drivers/cpufreq/mediatek-cpufreq.c:306:14: note: Value stored to 'inter_=
clk' during its initialization is never read
           struct clk *inter_clk =3D ERR_PTR(-ENODEV);
                       ^~~~~~~~~   ~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/clocksource/timer-of.c:191:3: warning: Value stored to 'flags' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   flags |=3D TIMER_OF_IRQ;
                   ^
   drivers/clocksource/timer-of.c:191:3: note: Value stored to 'flags' is n=
ever read
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/i2c/busses/i2c-amd756.c:108:7: warning: Although the value store=
d to 'temp' is used in the enclosing expression, the value is never actuall=
y read from 'temp' [clang-analyzer-deadcode.DeadStores]
           if ((temp =3D inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_S=
TS)) {
                ^
   drivers/i2c/busses/i2c-amd756.c:108:7: note: Although the value stored t=
o 'temp' is used in the enclosing expression, the value is never actually r=
ead from 'temp'
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/i2c/busses/i2c-sis5595.c:229:8: warning: Although the value stor=
ed to 'temp' is used in the enclosing expression, the value is never actual=
ly read from 'temp' [clang-analyzer-deadcode.DeadStores]
                   if ((temp =3D sis5595_read(SMB_STS_LO) + (sis5595_read(S=
MB_STS_HI) << 8)) !=3D 0x00) {
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-sis5595.c:229:8: note: Although the value stored =
to 'temp' is used in the enclosing expression, the value is never actually =
read from 'temp'
                   if ((temp =3D sis5595_read(SMB_STS_LO) + (sis5595_read(S=
MB_STS_HI) << 8)) !=3D 0x00) {
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/leds/leds-lp5523.c:811:2: warning: Undefined or garbage value re=
turned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^      ~~~
   drivers/leds/leds-lp5523.c:798:2: note: 'ret' declared without an initia=
l value
           int ret;
           ^~~~~~~
   drivers/leds/leds-lp5523.c:802:14: note: Assuming 'i' is >=3D field 'num=
_colors'
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/leds-lp5523.c:802:2: note: Loop condition is false. Executi=
on continues on line 810
           for (i =3D 0; i < led->mc_cdev.num_colors; i++) {
           ^
   drivers/leds/leds-lp5523.c:811:2: note: Undefined or garbage value retur=
ned to caller
           return ret;
           ^      ~~~
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/rev +158 arch/arm/mach-omap2/id.c

de26804b60d460 Linus Walleij    2013-09-05  146  =

4de34f3572882f Vaibhav Hiremath 2011-12-19  147  void __init omap2xxx_check=
_revision(void)
1dbae815a72430 Tony Lindgren    2005-11-10  148  {
1dbae815a72430 Tony Lindgren    2005-11-10  149  	int i, j;
a88231430384f4 Tony Lindgren    2008-12-10  150  	u32 idcode, prod_id;
1dbae815a72430 Tony Lindgren    2005-11-10  151  	u16 hawkeye;
a88231430384f4 Tony Lindgren    2008-12-10  152  	u8  dev_type, rev;
c46732bbf3477f Kan-Ru Chen      2010-08-02  153  	struct omap_die_id odi;
1dbae815a72430 Tony Lindgren    2005-11-10  154  =

1dbae815a72430 Tony Lindgren    2005-11-10  155  	idcode =3D read_tap_reg(O=
MAP_TAP_IDCODE);
0e564848693b06 Tony Lindgren    2008-10-06  156  	prod_id =3D read_tap_reg(=
tap_prod_id);
1dbae815a72430 Tony Lindgren    2005-11-10  157  	hawkeye =3D (idcode >> 12=
) & 0xffff;
1dbae815a72430 Tony Lindgren    2005-11-10 @158  	rev =3D (idcode >> 28) & =
0x0f;
1dbae815a72430 Tony Lindgren    2005-11-10  159  	dev_type =3D (prod_id >> =
16) & 0x0f;
c46732bbf3477f Kan-Ru Chen      2010-08-02  160  	omap_get_die_id(&odi);
1dbae815a72430 Tony Lindgren    2005-11-10  161  =

097c584cd48844 Paul Walmsley    2008-07-03  162  	pr_debug("OMAP_TAP_IDCODE=
 0x%08x REV %i HAWKEYE 0x%04x MANF %03x\n",
1dbae815a72430 Tony Lindgren    2005-11-10  163  		 idcode, rev, hawkeye, (=
idcode >> 1) & 0x7ff);
c46732bbf3477f Kan-Ru Chen      2010-08-02  164  	pr_debug("OMAP_TAP_DIE_ID=
_0: 0x%08x\n", odi.id_0);
097c584cd48844 Paul Walmsley    2008-07-03  165  	pr_debug("OMAP_TAP_DIE_ID=
_1: 0x%08x DEV_REV: %i\n",
c46732bbf3477f Kan-Ru Chen      2010-08-02  166  		 odi.id_1, (odi.id_1 >> =
28) & 0xf);
c46732bbf3477f Kan-Ru Chen      2010-08-02  167  	pr_debug("OMAP_TAP_DIE_ID=
_2: 0x%08x\n", odi.id_2);
c46732bbf3477f Kan-Ru Chen      2010-08-02  168  	pr_debug("OMAP_TAP_DIE_ID=
_3: 0x%08x\n", odi.id_3);
097c584cd48844 Paul Walmsley    2008-07-03  169  	pr_debug("OMAP_TAP_PROD_I=
D_0: 0x%08x DEV_TYPE: %i\n",
1dbae815a72430 Tony Lindgren    2005-11-10  170  		 prod_id, dev_type);
097c584cd48844 Paul Walmsley    2008-07-03  171  =

1dbae815a72430 Tony Lindgren    2005-11-10  172  	/* Check hawkeye ids */
1dbae815a72430 Tony Lindgren    2005-11-10  173  	for (i =3D 0; i < ARRAY_S=
IZE(omap_ids); i++) {
1dbae815a72430 Tony Lindgren    2005-11-10  174  		if (hawkeye =3D=3D omap_=
ids[i].hawkeye)
1dbae815a72430 Tony Lindgren    2005-11-10  175  			break;
1dbae815a72430 Tony Lindgren    2005-11-10  176  	}
1dbae815a72430 Tony Lindgren    2005-11-10  177  =

1dbae815a72430 Tony Lindgren    2005-11-10  178  	if (i =3D=3D ARRAY_SIZE(o=
map_ids)) {
1dbae815a72430 Tony Lindgren    2005-11-10  179  		printk(KERN_ERR "Unknown=
 OMAP CPU id\n");
1dbae815a72430 Tony Lindgren    2005-11-10  180  		return;
1dbae815a72430 Tony Lindgren    2005-11-10  181  	}
1dbae815a72430 Tony Lindgren    2005-11-10  182  =

1dbae815a72430 Tony Lindgren    2005-11-10  183  	for (j =3D i; j < ARRAY_S=
IZE(omap_ids); j++) {
1dbae815a72430 Tony Lindgren    2005-11-10  184  		if (dev_type =3D=3D omap=
_ids[j].dev)
1dbae815a72430 Tony Lindgren    2005-11-10  185  			break;
1dbae815a72430 Tony Lindgren    2005-11-10  186  	}
1dbae815a72430 Tony Lindgren    2005-11-10  187  =

1dbae815a72430 Tony Lindgren    2005-11-10  188  	if (j =3D=3D ARRAY_SIZE(o=
map_ids)) {
7852ec0536ca39 Paul Walmsley    2012-07-26  189  		pr_err("Unknown OMAP dev=
ice type. Handling it as OMAP%04x\n",
1dbae815a72430 Tony Lindgren    2005-11-10  190  		       omap_ids[i].type =
>> 16);
1dbae815a72430 Tony Lindgren    2005-11-10  191  		j =3D i;
1dbae815a72430 Tony Lindgren    2005-11-10  192  	}
1dbae815a72430 Tony Lindgren    2005-11-10  193  =

f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  194  	sprintf(soc_name, "OMAP%0=
4x", omap_rev() >> 16);
f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  195  	sprintf(soc_rev, "ES%x", =
(omap_rev() >> 12) & 0xf);
f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  196  =

f9d41eefcfbb91 Ruslan Bilovol   2013-02-14  197  	pr_info("%s", soc_name);
84a34344ea1f2f Lauri Leukkunen  2008-12-10  198  	if ((omap_rev() >> 8) & 0=
x0f)
04a92358b39649 Aaro Koskinen    2018-11-19  199  		pr_cont("%s", soc_rev);
04a92358b39649 Aaro Koskinen    2018-11-19  200  	pr_cont("\n");
a88231430384f4 Tony Lindgren    2008-12-10  201  }
a88231430384f4 Tony Lindgren    2008-12-10  202  =


:::::: The code at line 158 was first introduced by commit
:::::: 1dbae815a724303b46ab4663b5fc23c13e9d9690 [ARM] 3145/1: OMAP 3a/5: Ad=
d support for omap24xx

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1390925208600892249==--

