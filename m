Content-Type: multipart/mixed; boundary="===============0852879286389510987=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored to 'func' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 08 Aug 2022 11:05:01 +0800
Message-ID: <202208081040.ebnZXzs7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0852879286389510987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored to=
 'func' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Neil Armstrong <narmstrong@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: 6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2 pinctrl: meson: Enable COM=
PILE_TEST
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220801 (https://download.01.org/0day-ci/archi=
ve/20220808/202208081040.ebnZXzs7-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                                                   ^
   fs/jfs/jfs_dtree.c:787:2: note: Assuming the condition is true
           DT_PUTPAGE(mp);
           ^
   fs/jfs/jfs_dtree.c:131:24: note: expanded from macro 'DT_PUTPAGE'
   #define DT_PUTPAGE(MP) BT_PUTPAGE(MP)
                          ^~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:87:8: note: expanded from macro 'BT_PUTPAGE'
           if (! BT_IS_ROOT(MP)) \
                 ^~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:47:25: note: expanded from macro 'BT_IS_ROOT'
   #define BT_IS_ROOT(MP) (((MP)->xflag & COMMIT_PAGE) =3D=3D 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:787:2: note: Taking false branch
           DT_PUTPAGE(mp);
           ^
   fs/jfs/jfs_dtree.c:131:24: note: expanded from macro 'DT_PUTPAGE'
   #define DT_PUTPAGE(MP) BT_PUTPAGE(MP)
                          ^
   fs/jfs/jfs_btree.h:87:2: note: expanded from macro 'BT_PUTPAGE'
           if (! BT_IS_ROOT(MP)) \
           ^
   fs/jfs/jfs_dtree.c:4528:12: note: Returning from 'dtSearch'
           if ((rc =3D dtSearch(ip, key, orig_ino, &btstack, flag)))
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:4528:7: note: Assuming 'rc' is 0
           if ((rc =3D dtSearch(ip, key, orig_ino, &btstack, flag)))
                ^~
   fs/jfs/jfs_dtree.c:4528:2: note: Taking false branch
           if ((rc =3D dtSearch(ip, key, orig_ino, &btstack, flag)))
           ^
   fs/jfs/jfs_dtree.c:4532:2: note: Assigned value is garbage or undefined
           DT_GETSEARCH(ip, btstack.top, bn, mp, p, index);
           ^
   fs/jfs/jfs_dtree.c:134:2: note: expanded from macro 'DT_GETSEARCH'
           BT_GETSEARCH(IP, LEAF, BN, MP, dtpage_t, P, INDEX, i_dtroot)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:144:5: note: expanded from macro 'BT_GETSEARCH'
           BN =3D (LEAF)->bn;\
              ^ ~~~~~~~~~~
   fs/jfs/jfs_types.h:67:33: warning: The left operand of '&' is a garbage =
value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(0xffffff)) |
                                          ^
   fs/jfs/jfs_dtree.c:946:7: note: Assuming the condition is false
           sp =3D DT_PAGE(ip, smp);
                ^
   fs/jfs/jfs_dtree.c:111:25: note: expanded from macro 'DT_PAGE'
   #define DT_PAGE(IP, MP) BT_PAGE(IP, MP, dtpage_t, i_dtroot)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:51:3: note: expanded from macro 'BT_PAGE'
           (BT_IS_ROOT(MP) ? (TYPE *)&JFS_IP(IP)->ROOT : (TYPE *)(MP)->data)
            ^~~~~~~~~~~~~~
   fs/jfs/jfs_btree.h:47:25: note: expanded from macro 'BT_IS_ROOT'
   #define BT_IS_ROOT(MP) (((MP)->xflag & COMMIT_PAGE) =3D=3D 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:946:7: note: '?' condition is false
           sp =3D DT_PAGE(ip, smp);
                ^
   fs/jfs/jfs_dtree.c:111:25: note: expanded from macro 'DT_PAGE'
   #define DT_PAGE(IP, MP) BT_PAGE(IP, MP, dtpage_t, i_dtroot)
                           ^
   fs/jfs/jfs_btree.h:51:3: note: expanded from macro 'BT_PAGE'
           (BT_IS_ROOT(MP) ? (TYPE *)&JFS_IP(IP)->ROOT : (TYPE *)(MP)->data)
            ^
   fs/jfs/jfs_btree.h:47:24: note: expanded from macro 'BT_IS_ROOT'
   #define BT_IS_ROOT(MP) (((MP)->xflag & COMMIT_PAGE) =3D=3D 0)
                          ^
   fs/jfs/jfs_dtree.c:949:6: note: Assuming field 'name' is non-null
           if (!key.name) {
               ^~~~~~~~~
   fs/jfs/jfs_dtree.c:949:2: note: Taking false branch
           if (!key.name) {
           ^
   fs/jfs/jfs_dtree.c:964:6: note: Assuming the condition is true
           if (sp->header.flag & BT_ROOT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:964:2: note: Taking true branch
           if (sp->header.flag & BT_ROOT) {
           ^
   fs/jfs/jfs_dtree.c:972:7: note: Assuming 'n' is > field 'nslot'
                   if (n <=3D split->nslot)
                       ^~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dtree.c:972:3: note: Taking false branch
                   if (n <=3D split->nslot)
                   ^
   fs/jfs/jfs_dtree.c:974:8: note: Assuming 'rc' is 0
                   if ((rc =3D dbAlloc(ip, 0, (s64) xlen, &xaddr))) {
                        ^~
   fs/jfs/jfs_dtree.c:974:3: note: Taking false branch
                   if ((rc =3D dbAlloc(ip, 0, (s64) xlen, &xaddr))) {
                   ^
   fs/jfs/jfs_dtree.c:982:3: note: Calling 'PXDaddress'
                   PXDaddress(pxd, xaddr);
                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_types.h:67:33: note: The left operand of '&' is a garbage val=
ue
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(0xffffff)) |
                            ~~~~~~~~~~~~~ ^
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
>> drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored =
to 'func' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct meson_pmx_func *func =3D &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: note: Value stored to =
'func' during its initialization is never read
           struct meson_pmx_func *func =3D &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   53 warnings generated.
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   fs/btrfs/space-info.c:1568:3: warning: Value stored to 'used' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   fs/btrfs/space-info.c:1568:3: note: Value stored to 'used' is never read
                   used +=3D orig_bytes;
                   ^       ~~~~~~~~~~
   Suppressed 53 warnings (53 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   fs/xfs/xfs_trans_buf.c:575:3: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(bip->bli_formats[i].blf_data_map, 0,
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_trans_buf.c:575:3: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
                   memset(bip->bli_formats[i].blf_data_map, 0,
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/media/i2c/rdacm21.c:373:11: warning: The left operand of '=3D=3D=
' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (val =3D=3D OV10640_ID_HIGH)
                           ^
   drivers/media/i2c/rdacm21.c:550:6: note: Assuming 'dev' is non-null
           if (!dev)
               ^~~~
   drivers/media/i2c/rdacm21.c:550:2: note: Taking false branch
           if (!dev)
           ^
   drivers/media/i2c/rdacm21.c:557:6: note: 'ret' is >=3D 0
           if (ret < 0) {
               ^~~
   drivers/media/i2c/rdacm21.c:557:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/media/i2c/rdacm21.c:564:2: note: Taking false branch
           if (IS_ERR(dev->isp))
           ^
   drivers/media/i2c/rdacm21.c:567:8: note: Calling 'rdacm21_initialize'
           ret =3D rdacm21_initialize(dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/rdacm21.c:481:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/i2c/rdacm21.c:481:2: note: Taking false branch
           if (ret)

vim +/func +60 drivers/pinctrl/meson/pinctrl-meson8-pmx.c

ce385aa24a0dcc Jerome Brunet 2017-10-12  55  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  56  static int meson8_pmx_set_mux(=
struct pinctrl_dev *pcdev, unsigned func_num,
ce385aa24a0dcc Jerome Brunet 2017-10-12  57  			      unsigned group_num)
ce385aa24a0dcc Jerome Brunet 2017-10-12  58  {
ce385aa24a0dcc Jerome Brunet 2017-10-12  59  	struct meson_pinctrl *pc =3D =
pinctrl_dev_get_drvdata(pcdev);
ce385aa24a0dcc Jerome Brunet 2017-10-12 @60  	struct meson_pmx_func *func =
=3D &pc->data->funcs[func_num];
ce385aa24a0dcc Jerome Brunet 2017-10-12  61  	struct meson_pmx_group *group=
 =3D &pc->data->groups[group_num];
ce385aa24a0dcc Jerome Brunet 2017-10-12  62  	struct meson8_pmx_data *pmx_d=
ata =3D
ce385aa24a0dcc Jerome Brunet 2017-10-12  63  		(struct meson8_pmx_data *)gr=
oup->data;
ce385aa24a0dcc Jerome Brunet 2017-10-12  64  	int i, ret =3D 0;
ce385aa24a0dcc Jerome Brunet 2017-10-12  65  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  66  	dev_dbg(pc->dev, "enable func=
tion %s, group %s\n", func->name,
ce385aa24a0dcc Jerome Brunet 2017-10-12  67  		group->name);
ce385aa24a0dcc Jerome Brunet 2017-10-12  68  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  69  	/*
ce385aa24a0dcc Jerome Brunet 2017-10-12  70  	 * Disable groups using the s=
ame pin.
ce385aa24a0dcc Jerome Brunet 2017-10-12  71  	 * The selected group is not =
disabled to avoid glitches.
ce385aa24a0dcc Jerome Brunet 2017-10-12  72  	 */
ce385aa24a0dcc Jerome Brunet 2017-10-12  73  	for (i =3D 0; i < group->num_=
pins; i++)
ce385aa24a0dcc Jerome Brunet 2017-10-12  74  		meson8_pmx_disable_other_gro=
ups(pc, group->pins[i], group_num);
ce385aa24a0dcc Jerome Brunet 2017-10-12  75  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  76  	/* Function 0 (GPIO) doesn't =
need any additional setting */
ce385aa24a0dcc Jerome Brunet 2017-10-12  77  	if (func_num)
ce385aa24a0dcc Jerome Brunet 2017-10-12  78  		ret =3D regmap_update_bits(p=
c->reg_mux, pmx_data->reg * 4,
ce385aa24a0dcc Jerome Brunet 2017-10-12  79  					 BIT(pmx_data->bit),
ce385aa24a0dcc Jerome Brunet 2017-10-12  80  					 BIT(pmx_data->bit));
ce385aa24a0dcc Jerome Brunet 2017-10-12  81  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  82  	return ret;
ce385aa24a0dcc Jerome Brunet 2017-10-12  83  }
ce385aa24a0dcc Jerome Brunet 2017-10-12  84  =


:::::: The code at line 60 was first introduced by commit
:::::: ce385aa24a0dcccdc81dfcbc90cf7aa290d8b758 pinctrl: meson: rework pinm=
ux ops

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0852879286389510987==--

