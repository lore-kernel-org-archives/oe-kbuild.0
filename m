Content-Type: multipart/mixed; boundary="===============0819256604327805766=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFCv3 6/6] media: ds90ub953: new driver for TI DS90UB953-Q1 video serializer
Date: Tue, 08 Feb 2022 08:07:05 +0800
Message-ID: <202202080821.7ivUP1zg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0819256604327805766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220206115939.3091265-7-luca@lucaceresoli.net>
References: <20220206115939.3091265-7-luca@lucaceresoli.net>
TO: Luca Ceresoli <luca@lucaceresoli.net>

Hi Luca,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on media-tree/master]
[also build test WARNING on wsa/i2c/for-next robh/for-next linux/master lin=
us/master v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Luca-Ceresoli/i2c-core-let=
-adapters-be-notified-of-client-attach-detach/20220206-220012
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: riscv-randconfig-c006-20220207 (https://download.01.org/0day-ci/arc=
hive/20220208/202202080821.7ivUP1zg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850=
ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/f16e61ede4253720502445887=
06c6d04fa3d6812
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Luca-Ceresoli/i2c-core-let-adapter=
s-be-notified-of-client-attach-detach/20220206-220012
        git checkout f16e61ede425372050244588706c6d04fa3d6812
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           } while (*++name !=3D '\0');
                    ^~~~~~~~~~~~~~~
   net/ceph/osdmap.c:2995:2: note: Loop condition is false.  Exiting loop
           do {
           ^
   net/ceph/osdmap.c:3003:2: note: Returning the value 1, which participate=
s in a condition later
           return true;
           ^~~~~~~~~~~
   net/ceph/osdmap.c:3031:15: note: Returning from 'is_valid_crush_name'
                   if (!cn || !is_valid_crush_name(cn->cn_name))
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/osdmap.c:3031:3: note: Taking false branch
                   if (!cn || !is_valid_crush_name(cn->cn_name))
                   ^
   net/ceph/osdmap.c:3034:15: note: Assuming 'j' is < field 'size'
                   for (j =3D 0; j < b->size; j++) {
                               ^~~~~~~~~~~
   net/ceph/osdmap.c:3034:3: note: Loop condition is true.  Entering loop b=
ody
                   for (j =3D 0; j < b->size; j++) {
                   ^
   net/ceph/osdmap.c:3035:8: note: Assuming the condition is false
                           if (b->items[j] !=3D id)
                               ^~~~~~~~~~~~~~~~~
   net/ceph/osdmap.c:3035:4: note: Taking false branch
                           if (b->items[j] !=3D id)
                           ^
   net/ceph/osdmap.c:3040:4: note: Null pointer value stored to 'loc.cl_typ=
e_name'
                           parent_loc->cl_type_name =3D type_cn->cn_name;
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/osdmap.c:3083:8: note: Returning from 'get_immediate_parent'
                   id =3D get_immediate_parent(osdmap->crush, id, &type_id,=
 &loc);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   net/ceph/osdmap.c:3084:7: note: Assuming 'id' is < 0
                   if (id >=3D 0)
                       ^~~~~~~
   net/ceph/osdmap.c:3084:3: note: Taking false branch
                   if (id >=3D 0)
                   ^
   net/ceph/osdmap.c:3087:7: note: Calling 'lookup_crush_loc'
                   if (lookup_crush_loc(locs, &loc))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/osdmap.c:2901:1: note: Loop condition is true.  Entering loop b=
ody
   DEFINE_RB_FUNCS2(crush_loc, struct crush_loc_node, cl_loc, crush_loc_com=
pare,
   ^
   include/linux/ceph/libceph.h:265:70: note: expanded from macro 'DEFINE_R=
B_FUNCS2'
   DEFINE_RB_INSDEL_FUNCS2(name, type, keyfld, cmpexp, keyexp, nodefld)    \
                                                                           ^
   include/linux/ceph/libceph.h:247:2: note: expanded from macro '\DEFINE_R=
B_LOOKUP_FUNC2'
           while (n) {                                                     \
           ^
   net/ceph/osdmap.c:2901:60: note: Calling 'crush_loc_compare'
   DEFINE_RB_FUNCS2(crush_loc, struct crush_loc_node, cl_loc, crush_loc_com=
pare,
                                                              ^
   include/linux/ceph/libceph.h:266:44: note: expanded from macro 'DEFINE_R=
B_FUNCS2'
   DEFINE_RB_LOOKUP_FUNC2(name, type, keyfld, cmpexp, keyexp,              \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/libceph.h:251:9: note: expanded from macro '\DEFINE_R=
B_LOOKUP_FUNC2'
                   cmp =3D cmpexp(key, keyexp(cur->keyfld));               =
  \
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/osdmap.c:2897:9: note: Null pointer passed as 1st argument to s=
tring comparison function
           return strcmp(loc1->cl_type_name, loc2->cl_type_name) ?:
                  ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/extcon/extcon-ptn5150.c:173:2: warning: Value stored to 'vendor_=
id' is never read [clang-analyzer-deadcode.DeadStores]
           vendor_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VENDOR, reg_data);
           ^
   drivers/extcon/extcon-ptn5150.c:173:2: note: Value stored to 'vendor_id'=
 is never read
   drivers/extcon/extcon-ptn5150.c:174:2: warning: Value stored to 'version=
_id' is never read [clang-analyzer-deadcode.DeadStores]
           version_id =3D FIELD_GET(PTN5150_REG_DEVICE_ID_VERSION, reg_data=
);
           ^
   drivers/extcon/extcon-ptn5150.c:174:2: note: Value stored to 'version_id=
' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/bluetooth/hci_conn.c:1601:18: warning: Value stored to 'hdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1601:18: note: Value stored to 'hdev' during it=
s initialization is never read
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1627:18: warning: Value stored to 'hdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1627:18: note: Value stored to 'hdev' during it=
s initialization is never read
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/media/i2c/ds90ub953.c:313:17: warning: Value stored to 'dev' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &ds90->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ds90ub953.c:313:17: note: Value stored to 'dev' during=
 its initialization is never read
           struct device *dev =3D &ds90->client->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/wireless/reg.c:3821:2: warning: Potential leak of memory pointed to =
by 'intersected_rd' [clang-analyzer-unix.Malloc]
           return 0;
           ^
   net/wireless/reg.c:3585:2: note: Taking false branch
           if (is_wiphy_all_set_reg_flag(REGULATORY_COUNTRY_IE_IGNORE)) {
           ^
   net/wireless/reg.c:3608:2: note: Taking false branch
           pr_debug("All devices are disconnected, going to restore regulat=
ory settings\n");
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/wireless/reg.c:3609:2: note: Calling 'restore_regulatory_settings'
           restore_regulatory_settings(false, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/reg.c:3464:2: note: Assuming the condition is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:12: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
                     ^~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   net/wireless/reg.c:3464:2: note: '__ret_do_once' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/wireless/reg.c:3464:2: note: Left side of '&&' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   net/wireless/reg.c:3464:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   net/wireless/reg.c:3472:6: note: Assuming 'reg_is_indoor' is false
           if (reg_is_indoor && !reg_is_indoor_portid) {
               ^~~~~~~~~~~~~
   net/wireless/reg.c:3472:20: note: Left side of '&&' is false
           if (reg_is_indoor && !reg_is_indoor_portid) {
                             ^
   net/wireless/reg.c:3493:2: note: Loop condition is false. Execution cont=
inues on line 3497
           list_for_each_entry_safe(reg_beacon, btmp, &reg_pending_beacons,=
 list) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \

vim +/dev +313 drivers/media/i2c/ds90ub953.c

f16e61ede42537 Luca Ceresoli 2022-02-06  308  =

f16e61ede42537 Luca Ceresoli 2022-02-06  309  static long ds90_clkout_round=
_rate(struct clk_hw *hw, unsigned long rate,
f16e61ede42537 Luca Ceresoli 2022-02-06  310  				   unsigned long *parent_=
rate)
f16e61ede42537 Luca Ceresoli 2022-02-06  311  {
f16e61ede42537 Luca Ceresoli 2022-02-06  312  	struct ds90_data *ds90 =3D c=
ontainer_of(hw, struct ds90_data, clk_out_hw);
f16e61ede42537 Luca Ceresoli 2022-02-06 @313  	struct device *dev =3D &ds90=
->client->dev;
f16e61ede42537 Luca Ceresoli 2022-02-06  314  	unsigned long mul, div, res;
f16e61ede42537 Luca Ceresoli 2022-02-06  315  =

f16e61ede42537 Luca Ceresoli 2022-02-06  316  	rational_best_approximation(=
rate, *parent_rate / prediv,
f16e61ede42537 Luca Ceresoli 2022-02-06  317  				    (1 << 5) - 1, (1 << 8=
) - 1,
f16e61ede42537 Luca Ceresoli 2022-02-06  318  				    &mul, &div);
f16e61ede42537 Luca Ceresoli 2022-02-06  319  	ds90->clkout_mul =3D mul;
f16e61ede42537 Luca Ceresoli 2022-02-06  320  	ds90->clkout_div =3D div;
f16e61ede42537 Luca Ceresoli 2022-02-06  321  =

f16e61ede42537 Luca Ceresoli 2022-02-06  322  	res =3D *parent_rate / predi=
v * ds90->clkout_mul / ds90->clkout_div;
f16e61ede42537 Luca Ceresoli 2022-02-06  323  =

f16e61ede42537 Luca Ceresoli 2022-02-06  324  	dev_dbg(dev, "%lu / %lu * %l=
u / %lu =3D %lu (wanted %lu)",
f16e61ede42537 Luca Ceresoli 2022-02-06  325  		*parent_rate, prediv, mul, =
div, res, rate);
f16e61ede42537 Luca Ceresoli 2022-02-06  326  =

f16e61ede42537 Luca Ceresoli 2022-02-06  327  	return res;
f16e61ede42537 Luca Ceresoli 2022-02-06  328  }
f16e61ede42537 Luca Ceresoli 2022-02-06  329  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0819256604327805766==--

