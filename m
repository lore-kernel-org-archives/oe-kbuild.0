Content-Type: multipart/mixed; boundary="===============2030355128462877767=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/temperature/max31865.c:51:8: warning: Excessive padding in 'struct max31865_data' (44 padding bytes, where 12 is optimal).
Date: Mon, 06 Dec 2021 12:45:54 +0800
Message-ID: <202112061253.yg8joErb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2030355128462877767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Navin Sankar Velliangiri <navin@linumiz.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
commit: e112dc4e18eafc5ee9d5700e3c059ac9897ae2a1 iio: temperature: Add MAX3=
1865 RTD Support
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-c001-20211015 (https://download.01.org/0day-ci/arch=
ive/20211206/202112061253.yg8joErb-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6069a6=
a5049497a32a50a49661c2f4169078bdba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De112dc4e18eafc5ee9d5700e3c059ac9897ae2a1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e112dc4e18eafc5ee9d5700e3c059ac9897ae2a1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netlink.h:119:6: note: expanded from macro 'NL_SET_ERR_MSG=
_ATTR_POL'
           if (__extack) {                                         \
               ^~~~~~~~
   include/net/netlink.h:1208:3: note: Taking false branch
                   NL_SET_ERR_MSG_ATTR(extack, nla, "NLA_F_NESTED is missin=
g");
                   ^
   include/linux/netlink.h:127:2: note: expanded from macro 'NL_SET_ERR_MSG=
_ATTR'
           NL_SET_ERR_MSG_ATTR_POL(extack, attr, NULL, msg)
           ^
   include/linux/netlink.h:119:2: note: expanded from macro 'NL_SET_ERR_MSG=
_ATTR_POL'
           if (__extack) {                                         \
           ^
   include/net/netlink.h:1208:3: note: Loop condition is false.  Exiting lo=
op
                   NL_SET_ERR_MSG_ATTR(extack, nla, "NLA_F_NESTED is missin=
g");
                   ^
   include/linux/netlink.h:127:2: note: expanded from macro 'NL_SET_ERR_MSG=
_ATTR'
           NL_SET_ERR_MSG_ATTR_POL(extack, attr, NULL, msg)
           ^
   include/linux/netlink.h:113:57: note: expanded from macro 'NL_SET_ERR_MS=
G_ATTR_POL'
   #define NL_SET_ERR_MSG_ATTR_POL(extack, attr, pol, msg) do {    \
                                                           ^
   net/wireless/nl80211.c:15066:2: note: Returning from 'nla_parse_nested'
           nla_parse_nested(tb, NL80211_SAR_ATTR_MAX,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/wireless/nl80211.c:15070:6: note: Branch condition evaluates to a ga=
rbage value
           if (!tb[NL80211_SAR_ATTR_TYPE] || !tb[NL80211_SAR_ATTR_SPECS])
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
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
   5 warnings generated.
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/resolver/ad2s90.c:24:8: warning: Excessive padding in 'struc=
t ad2s90_state' (46 padding bytes, where 14 is optimal). =

   Optimal fields order: =

   rx, =

   sdev, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad2s90_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/resolver/ad2s90.c:24:8: note: Excessive padding in 'struct a=
d2s90_state' (46 padding bytes, where 14 is optimal). Optimal fields order:=
 rx, sdev, lock, consider reordering the fields or adding explicit padding =
members
   struct ad2s90_state {
   ~~~~~~~^~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/resolver/ad2s1200.c:39:8: warning: Excessive padding in 'str=
uct ad2s1200_state' (38 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   rx, =

   sdev, =

   sample, =

   rdvel, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad2s1200_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/iio/resolver/ad2s1200.c:39:8: note: Excessive padding in 'struct=
 ad2s1200_state' (38 padding bytes, where 6 is optimal). Optimal fields ord=
er: rx, sdev, sample, rdvel, lock, consider reordering the fields or adding=
 explicit padding members
   struct ad2s1200_state {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/temperature/maxim_thermocouple.c:122:8: warning: Excessive p=
adding in 'struct maxim_thermocouple_data' (39 padding bytes, where 7 is op=
timal). =

   Optimal fields order: =

   buffer, =

   spi, =

   chip, =

   tc_type, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct maxim_thermocouple_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/temperature/maxim_thermocouple.c:122:8: note: Excessive padd=
ing in 'struct maxim_thermocouple_data' (39 padding bytes, where 7 is optim=
al). Optimal fields order: buffer, spi, chip, tc_type, consider reordering =
the fields or adding explicit padding members
   struct maxim_thermocouple_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/iio/temperature/max31865.c:51:8: warning: Excessive padding in '=
struct max31865_data' (44 padding bytes, where 12 is optimal). =

   Optimal fields order: =

   buf, =

   filter_50hz, =

   three_wire, =

   spi, =

   lock, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct max31865_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/temperature/max31865.c:51:8: note: Excessive padding in 'str=
uct max31865_data' (44 padding bytes, where 12 is optimal). Optimal fields =
order: buf, filter_50hz, three_wire, spi, lock, consider reordering the fie=
lds or adding explicit padding members
   struct max31865_data {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   5 warnings generated.
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).

vim +51 drivers/iio/temperature/max31865.c

e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  50  =

e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24 @51  struct max31865_dat=
a {
e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  52  	struct spi_device =
*spi;
e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  53  	struct mutex lock;
e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  54  	bool filter_50hz;
e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  55  	bool three_wire;
e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  56  	u8 buf[2] ____cach=
eline_aligned;
e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  57  };
e112dc4e18eafc Navin Sankar Velliangiri 2021-08-24  58  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2030355128462877767==--

